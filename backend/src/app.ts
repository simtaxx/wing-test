import express, { Express, Request, Response } from 'express';
import 'dotenv/config';
import OrderQueries from './domain/queries/OrdersQueries';
import startApolloServer from './externals/apolloServer';
import { createParcels } from './domain/services/parcelsService';
import ItemsQueries from './domain/queries/ItemsQueries';
import ParcelsQueries from './domain/queries/ParcelsQueries';

const app: Express = express();
const port = process.env.PORT;
app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});

app.get('/', async (req: Request, res: Response) => {
  const parcels = await createParcels();
  res.send(parcels);
});

const dataSources = {
  items: new ItemsQueries(),
  orders: new OrderQueries(),
  parcels: new ParcelsQueries()
}

startApolloServer(dataSources);
