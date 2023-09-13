# wing-test

### Outils

- NodeJS
- Typescript
- Express
- GraphQL
- Postgres
- Docker

### Installation

Pour installer le projet vous suivre les instructions suivantes

  Une fois le repo cloner rendez vous ici : wing-test/backend

  ```
  1. cp .env.example .env

  2. npm i

  3. cd postgres && docker-compose up -d

  4. docker cp wingdb.pgsql postgres:/wingdb.pgsql

  5. docker exec -it postgres bash

  6. psql -U postgres

  7. CREATE DATABASE wing;

  8. exit

  9. psql -U postgres wing < wingdb.pgsql

  10. exit

  11. cd .. && npm run dev
  ```

### Utilisation

- Pour générer les parcels rendez-vous ici : http://localhost:3000

- Pour récupérer les données que vous souhaitez rendez-vous ici: http://localhost:4000

> Une fois après être aller sur http://localhost:3000 lorsque vous allez actualiser la
page, un tableau vide va apparaître car les commandes ont déjà été traitées et nous ne
voulons pas le faire une seconde fois.

> Pour pouvoir relancer le process rendez-vous sur http://localhost:4000 et lancer les
mutations "clearParcel" avec order_id & "updateOrdersStatusToFalse" avec id. 