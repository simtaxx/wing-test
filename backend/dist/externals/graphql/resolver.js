"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const resolver = {
    Query: {
        items: async (_, __, { dataSources }) => {
            return dataSources.items.getItems();
        },
        orders: async (_, __, { dataSources }) => {
            return dataSources.orders.getOrders();
        },
        parcels: async (_, __, { dataSources }) => {
            return dataSources.parcels.getParcels();
        },
    },
    Mutation: {
        clearParcels: async (_, __, { dataSources }) => {
            return dataSources.parcels.clearParcels();
        },
        updateOrdersStatusToFalse: async (_, __, { dataSources }) => {
            return dataSources.orders.updateOrdersStatusToFalse();
        }
    }
};
exports.default = resolver;
