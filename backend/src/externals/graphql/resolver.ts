const resolver = {
  Query: {
    items: async (_: any, __: any, { dataSources }: any) => {
      return dataSources.items.getItems();
    },
    orders: async (_: any, __: any, { dataSources }: any) => {
      return dataSources.orders.getOrders();
    },
    parcels: async (_: any, __: any, { dataSources }: any) => {
      return dataSources.parcels.getParcels();
    },
  },
  Mutation: {
    clearParcels: async (_: any, __: any, { dataSources }: any) => {
      return dataSources.parcels.clearParcels();
    },
    updateOrdersStatusToFalse: async (_: any, __: any, { dataSources }: any) => {
      return dataSources.orders.updateOrdersStatusToFalse();
    }
  }
};

export default resolver;
