import typeDefs from '../graphql/schema';
import resolvers from '../graphql/resolver';
import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';

const server = new ApolloServer({
  typeDefs,
  resolvers,
});

const startApolloServer = async (dataSources: any) => {
  const { url } = await startStandaloneServer(server, {
    context: async () => {
      return {
        dataSources,
      };
    },
  });

  console.log(`🚀 Server ready at ${url}`);
}

export default startApolloServer;
