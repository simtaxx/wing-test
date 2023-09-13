"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const db_1 = __importDefault(require("../../externals/db"));
class ItemsQueries {
    dbConnection;
    constructor() {
        this.dbConnection = db_1.default;
    }
    async getItems() {
        try {
            const items = await this.dbConnection.query('SELECT * FROM items');
            return items.rows;
        }
        catch (error) {
            return error;
        }
    }
}
exports.default = ItemsQueries;
