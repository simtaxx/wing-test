import pool from '../../externals/db';

class ParcelsQueries {
  private dbConnection;

  constructor() {
    this.dbConnection = pool;
  }

  async getParcels() {
    try {
      const parcels = await this.dbConnection.query('SELECT * FROM parcels');

      return parcels.rows;
    } catch (error) {
      return error;
    }
  }

  async createParcels(parcelsData: any) {
    try {
      const query = parcelsData.map((parcel: any) => {
        const { order_id, items, weight, tracking_id, palette_number, cost } = parcel;
        const itemsString = JSON.stringify(items);

        return `INSERT INTO parcels (order_id, items, weight, tracking_id, palette_number, cost) VALUES ('${order_id}', '${itemsString}', ${weight}, '${tracking_id}', ${palette_number}, ${cost})`;
      }).join(';');

      const parcels = await this.dbConnection.query(query);

      return parcels.rows;
    } catch (error) {
      return error;
    }
  }

  async clearParcels() {
    try {
      const parcels = await this.dbConnection.query('TRUNCATE parcels');

      return parcels.rows;
    } catch (error) {
      return error;
    }
  }
}

export default ParcelsQueries;
