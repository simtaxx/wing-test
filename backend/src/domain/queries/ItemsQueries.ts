import pool from '../../externals/db';

class ItemsQueries {
  private dbConnection;

  constructor() {
    this.dbConnection = pool;
  }

  async getItems() {
    try {
      const items = await this.dbConnection.query('SELECT * FROM items');

      return items.rows;
    } catch (error) {
      return error;
    }
  }
}

export default ItemsQueries;
