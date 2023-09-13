import { generateTrackingId } from '../../externals/trackingCode';
import ItemsQueries from '../queries/ItemsQueries';
import OrdersQueries from '../queries/OrdersQueries';
import ParcelsQueries from '../queries/ParcelsQueries';

interface Item {
  id: string;
  name: string;
  weight: number;
}

interface OrderItem {
  item_id: string;
  quantity: number;
}

interface FormatedItem {
  id: string;
  name: string;
  weight: number;
  quantity: number;
}

interface Parcel {
  order_id: string;
  items: FormatedItem[];
  weight: number;
  tracking_id: string;
  palette_number: number;
  cost: number;
}

interface Order {
  id: string;
  date: string;
  items: OrderItem[];
}

interface MergedOrder {
  id: string;
  date: string;
  items: FormatedItem[];
}

const maxWeight = 30;

/**
 * Associate items details to orders
 */
export const mergeItemsIntoOrders = (items: Item[] | any[], orders: Order[]) => {
  const mergedOrders = orders.map((order: Order) => {
    const orderItems = order.items.map((orderItem: OrderItem) => {
      const { item_id, quantity } = orderItem;
      const item = items.find((item: Item) => item.id === item_id);

      return {
        id: item.id,
        name: item.name,
        weight: Number(item.weight),
        quantity,
      };
    });

    return {
      id: order.id,
      date: order.date,
      items: orderItems,
    };
  });

  return mergedOrders;
};

const createParcel = (order: MergedOrder, item: Item, paletteNumber: number, trackingId: string) => ({
  order_id: order.id,
  items: [{ ...item, quantity: 1 }],
  weight: item.weight,
  tracking_id: trackingId,
  palette_number: paletteNumber,
  cost: 0
});

const defineParcelCost = (weight: number) => {
  if (weight > 0 && weight <= 1) {
    return 1;
  } else if (weight > 1 && weight <= 5) {
    return 2;
  } else if (weight > 5 && weight <= 10) {
    return 3;
  } else if (weight > 10 && weight <= 20) {
    return 5;
  }
  
  return 10;
}

export const createParcels = async () => {
  const itemsData: Item[] | any = await new ItemsQueries().getItems();
  const ordersQueries = new OrdersQueries();
  const ordersData: Order[] | any = await ordersQueries.getOrders();
  const parcelsQueries = new ParcelsQueries();
  let parcels: Parcel[] = [];

  const mergedOrders: MergedOrder[] | any = mergeItemsIntoOrders(itemsData, ordersData);

  /**
   * Split items into parcels by their weight and orders
   * to have a maximum of 30kg per parcel
   */ 
  for (const order of mergedOrders) {
    let currentWeight = 0;
    let paletteNumber = 1;
    const trackingId = await generateTrackingId();

    const parcelsResult: Parcel[] = [{
      order_id: order.id,
      items: [],
      weight: 0,
      tracking_id: trackingId,
      palette_number: 1,
      cost: 0
    }];
  
    order.items.forEach((item: FormatedItem) => {
      const { weight, quantity } = item;
  
      for (let count = 0; count < quantity; count++) {
        if (currentWeight + weight > maxWeight) {
          paletteNumber++;
          currentWeight = 0;
        }
  
        let parcel = parcelsResult.find((subParcel: Parcel) => subParcel.palette_number === paletteNumber);
  
        if (!parcel || currentWeight + weight > maxWeight) {
          parcel = createParcel(order, item, paletteNumber, trackingId);
          parcelsResult.push(parcel);
        } else {
          const currParcelItem = parcel.items.find((parcelItem: FormatedItem) => parcelItem.id === item.id);
          if (currParcelItem) {
            currParcelItem.quantity++;
          } else {
            parcel.items.push({ ...item, quantity: 1 });
          }
          parcel.weight += weight;
        }
  
        currentWeight += weight;
      }
    });

    const parcelsResultWithCost = parcelsResult.map((parcel: Parcel) => ({
      ...parcel,
      cost: defineParcelCost(parcel.weight)
    }));
    
    parcels = [...parcels, ...parcelsResultWithCost];
  }

  ordersQueries.updateOrdersStatus(ordersData.map((order: MergedOrder) => order.id));
  parcelsQueries.createParcels(parcels);

  return parcels;
};
