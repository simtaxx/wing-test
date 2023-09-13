"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
require("dotenv/config");
const OrdersQueries_1 = __importDefault(require("./domain/queries/OrdersQueries"));
const apolloServer_1 = __importDefault(require("./externals/apolloServer"));
const parcelsService_1 = require("./domain/services/parcelsService");
const ItemsQueries_1 = __importDefault(require("./domain/queries/ItemsQueries"));
const ParcelsQueries_1 = __importDefault(require("./domain/queries/ParcelsQueries"));
const app = (0, express_1.default)();
const port = process.env.PORT;
app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});
app.get('/', async (req, res) => {
    const parcels = await (0, parcelsService_1.createParcels)();
    res.send(parcels);
});
const dataSources = {
    items: new ItemsQueries_1.default(),
    orders: new OrdersQueries_1.default(),
    parcels: new ParcelsQueries_1.default()
};
(0, apolloServer_1.default)(dataSources);
