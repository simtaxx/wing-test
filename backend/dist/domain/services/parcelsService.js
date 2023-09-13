"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createParcels = exports.mergeItemsIntoOrders = void 0;
const trackingCode_1 = require("../../externals/trackingCode");
const ItemsQueries_1 = __importDefault(require("../queries/ItemsQueries"));
const OrdersQueries_1 = __importDefault(require("../queries/OrdersQueries"));
const ParcelsQueries_1 = __importDefault(require("../queries/ParcelsQueries"));
const maxWeight = 30;
/**
 * Associate items details to orders
 */
const mergeItemsIntoOrders = (items, orders) => {
    const mergedOrders = orders.map((order) => {
        const orderItems = order.items.map((orderItem) => {
            const { item_id, quantity } = orderItem;
            const item = items.find((item) => item.id === item_id);
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
exports.mergeItemsIntoOrders = mergeItemsIntoOrders;
const createParcel = (order, item, paletteNumber, trackingId) => ({
    order_id: order.id,
    items: [{ ...item, quantity: 1 }],
    weight: item.weight,
    tracking_id: trackingId,
    palette_number: paletteNumber,
    cost: 0
});
const defineParcelCost = (weight) => {
    if (weight > 0 && weight <= 1) {
        return 1;
    }
    else if (weight > 1 && weight <= 5) {
        return 2;
    }
    else if (weight > 5 && weight <= 10) {
        return 3;
    }
    else if (weight > 10 && weight <= 20) {
        return 5;
    }
    return 10;
};
const createParcels = async () => {
    const itemsData = await new ItemsQueries_1.default().getItems();
    const ordersQueries = new OrdersQueries_1.default();
    const ordersData = await ordersQueries.getOrders();
    const parcelsQueries = new ParcelsQueries_1.default();
    let parcels = [];
    const mergedOrders = (0, exports.mergeItemsIntoOrders)(itemsData, ordersData);
    /**
     * Split items into parcels by their weight and orders
     * to have a maximum of 30kg per parcel
     */
    for (const order of mergedOrders) {
        let currentWeight = 0;
        let paletteNumber = 1;
        const trackingId = await (0, trackingCode_1.generateTrackingId)();
        const parcelsResult = [{
                order_id: order.id,
                items: [],
                weight: 0,
                tracking_id: trackingId,
                palette_number: 1,
                cost: 0
            }];
        order.items.forEach((item) => {
            const { weight, quantity } = item;
            for (let count = 0; count < quantity; count++) {
                if (currentWeight + weight > maxWeight) {
                    paletteNumber++;
                    currentWeight = 0;
                }
                let parcel = parcelsResult.find((subParcel) => subParcel.palette_number === paletteNumber);
                if (!parcel || currentWeight + weight > maxWeight) {
                    parcel = createParcel(order, item, paletteNumber, trackingId);
                    parcelsResult.push(parcel);
                }
                else {
                    const currParcelItem = parcel.items.find((parcelItem) => parcelItem.id === item.id);
                    if (currParcelItem) {
                        currParcelItem.quantity++;
                    }
                    else {
                        parcel.items.push({ ...item, quantity: 1 });
                    }
                    parcel.weight += weight;
                }
                currentWeight += weight;
            }
        });
        const parcelsResultWithCost = parcelsResult.map((parcel) => ({
            ...parcel,
            cost: defineParcelCost(parcel.weight)
        }));
        parcels = [...parcels, ...parcelsResultWithCost];
    }
    ordersQueries.updateOrdersStatus(ordersData.map((order) => order.id));
    parcelsQueries.createParcels(parcels);
    return parcels;
};
exports.createParcels = createParcels;
