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

  ```
  1. cd wing-test/backend

  2. cp .env.example .env

  3. npm i

  4. cd postgres && docker-compose up -d

  5. docker cp wingdb.pgsql postgres:/wingdb.pgsql

  6. docker exec -it postgres bash

  7. psql -U postgres

  8. CREATE USER admin WITH PASSWORD 'admin';

  9. CREATE DATABASE wing;

  10. \c wing

  11. GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

  12. exit

  13. psql -U postgres wing < wingdb.pgsql

  14. exit

  15. cd ..

  16. npm run dev
  ```
  > Si après la commmande 16 "npm run dev" vous avez une erreur, relancez la commande ça
  devrait fonctionner

### Utilisation

- Pour générer les parcels rendez-vous ici : http://localhost:3000

- Pour récupérer les données que vous souhaitez rendez-vous ici: http://localhost:4000

> Une fois après être aller sur http://localhost:3000 lorsque vous allez actualiser la
page, un tableau vide va apparaître car les commandes ont déjà été traitées et nous ne
voulons pas le faire une seconde fois.

> Pour pouvoir relancer le process rendez-vous sur http://localhost:4000 et lancer les
mutations "clearParcel" avec order_id & "updateOrdersStatusToFalse" avec id. 