"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const db_1 = __importDefault(require("../../externals/db"));
class OrdersQueries {
    dbConnection;
    constructor() {
        this.dbConnection = db_1.default;
    }
    async getOrders() {
        try {
            const orders = await this.dbConnection.query('SELECT * FROM orders WHERE "isOrderProcessed" IS NOT TRUE');
            return orders.rows;
        }
        catch (error) {
            return error;
        }
    }
    async updateOrdersStatus(ids) {
        try {
            const query = ids.map((id) => `UPDATE orders SET "isOrderProcessed" = true WHERE id = '${id}'`).join(';');
            const orders = await this.dbConnection.query(query);
            return orders.rows;
        }
        catch (error) {
            return error;
        }
    }
    async updateOrdersStatusToFalse() {
        try {
            const orders = await this.dbConnection.query('UPDATE orders SET "isOrderProcessed" = false');
            return orders.rows;
        }
        catch (error) {
            return error;
        }
    }
}
exports.default = OrdersQueries;
