"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateTrackingId = void 0;
const node_fetch_1 = __importDefault(require("node-fetch"));
const generateLocalTrackingId = () => {
    const trackingId = Math.floor(Math.random() * 1000000000);
    return `${trackingId}`;
};
const generateTrackingId = async () => {
    try {
        const trackingIdResponse = await (0, node_fetch_1.default)('https://www.random.org/integers/?num=1&min=100000000&max=110000000&col=1&base=10&format=plain&rnd=new');
        if (trackingIdResponse.status !== 200)
            return generateLocalTrackingId();
        return generateLocalTrackingId();
    }
    catch (error) {
        throw error;
    }
};
exports.generateTrackingId = generateTrackingId;
