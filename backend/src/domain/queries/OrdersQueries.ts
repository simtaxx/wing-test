import pool from '../../externals/db';

class OrdersQueries {
  private dbConnection;

  constructor() {
    this.dbConnection = pool;
  }

  async getOrders() {
    try {
      const orders = await this.dbConnection.query('SELECT * FROM orders WHERE "isOrderProcessed" IS NOT TRUE');

      return orders.rows;
    } catch (error) {
      return error;
    }
  }

  async updateOrdersStatus(ids: string[]) {
    try {
      const query = ids.map((id: string) => `UPDATE orders SET "isOrderProcessed" = true WHERE id = '${id}'`).join(';');
      const orders = await this.dbConnection.query(query);

      return orders.rows;
    } catch (error) {
      return error;
    }
  }

  async updateOrdersStatusToFalse() {
    try {
      const orders = await this.dbConnection.query('UPDATE orders SET "isOrderProcessed" = false');

      return orders.rows;
    } catch (error) {
      return error;
    }
  }
}

export default OrdersQueries;
