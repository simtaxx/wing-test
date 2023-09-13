"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const db_1 = __importDefault(require("../../externals/db"));
class ParcelsQueries {
    dbConnection;
    constructor() {
        this.dbConnection = db_1.default;
    }
    async getParcels() {
        try {
            const parcels = await this.dbConnection.query('SELECT * FROM parcels');
            return parcels.rows;
        }
        catch (error) {
            return error;
        }
    }
    async createParcels(parcelsData) {
        try {
            const query = parcelsData.map((parcel) => {
                const { order_id, items, weight, tracking_id, palette_number, cost } = parcel;
                const itemsString = JSON.stringify(items);
                return `INSERT INTO parcels (order_id, items, weight, tracking_id, palette_number, cost) VALUES ('${order_id}', '${itemsString}', ${weight}, '${tracking_id}', ${palette_number}, ${cost})`;
            }).join(';');
            const parcels = await this.dbConnection.query(query);
            return parcels.rows;
        }
        catch (error) {
            return error;
        }
    }
    async clearParcels() {
        try {
            const parcels = await this.dbConnection.query('TRUNCATE parcels');
            return parcels.rows;
        }
        catch (error) {
            return error;
        }
    }
}
exports.default = ParcelsQueries;
