"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const schema_1 = __importDefault(require("../graphql/schema"));
const resolver_1 = __importDefault(require("../graphql/resolver"));
const server_1 = require("@apollo/server");
const standalone_1 = require("@apollo/server/standalone");
const server = new server_1.ApolloServer({
    typeDefs: schema_1.default,
    resolvers: resolver_1.default,
});
const startApolloServer = async (dataSources) => {
    const { url } = await (0, standalone_1.startStandaloneServer)(server, {
        context: async () => {
            return {
                dataSources,
            };
        },
    });
    console.log(`🚀 Server ready at ${url}`);
};
exports.default = startApolloServer;
