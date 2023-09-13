"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const graphql_1 = require("graphql");
const schema = (0, graphql_1.buildSchema)(`#graphql
  type Item {
    id: String
    name: String
    weight: Float
  }

  type OrderItem {
    item_id: String
    quantity: Int
  }

  type ParcelItem {
    id: String
    name: String
    weight: Float
    quantity: Int
  }

  type Order {
    id: String
    date: String
    items: [OrderItem]
  }

  type Parcel {
    id: String
    order_id: String
    items: [ParcelItem]
    weight: Float
    tracking_id: String
    palette_number: Int
    cost: Int
  }

  type Query {
    items: [Item]
    orders: [Order]
    parcels: [Parcel]
  }

  type Mutation {
    updateOrdersStatusToFalse: [Order]
    clearParcels: [Parcel]
  }
`);
exports.default = schema;
