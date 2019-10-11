# NEAT SERVER
URL
https://radiant-sierra-40073.herokuapp.com/api
( required headers Authorization Bearer KEY )

Server side of NEAT full-stack capstone project by JDBUTISBAUCH
This app uses the React, Node, Express, PostgreSQL stack.

# LIVE APP
https://neat.now.sh

Method:

GET /liquors/ 

POST /users 

URL Params

(requiredFields = ['user_name', 'password', 'full_name'] ) 
(optionalField = ['nickname'] )

POST /api/reviews
( requiredFields = ['text', 'rating', 'thing_id'] )

Example Success Response:

GET /liquors/ 
  {
        "id": 1,
        "liquor_name": "Angel's Envy Kentucky Straight Bourbon",
        "brand_name": "Angel's Envy",
        "producer": "Louisville Distilling Company, LLC",
        "origin": "KY, USA",
        "liquor_type": "Bourbon",
        "liquor_age": "4-6 years",
        "proof": "86.6",
        "price": "3",
        "content": "A light bodied and golden bourbon. A subtle nose with some floral and fruity notes and a light spice.",
        "date_created": "2019-10-01T14:03:14.808Z",
        "user": {},
        "number_of_reviews": 5,
        "average_review_rating": 4
    }

Code: 200 
Content:  {
        "id": 1,
        "liquor_name": "Angel's Envy Kentucky Straight Bourbon",
        "brand_name": "Angel's Envy",
        "producer": "Louisville Distilling Company, LLC", ......
    }
Response: Successful response, liquors are in database

Code: 200 
Content:  { ....
    }
Response: Successful response, however now liquors are in database

Code: 200
Content: { Hello World! }
Successful connection to database

Code: 404 NOT FOUND 
Content: { error: `Liquor doesn't exist` }
Valid call, however no liquor matches given ID

Code: 401  
Content: { error: `Unauthorized request` }
invalid password

Code: 400
Content: { Missing '${field}' in request body }
Required field is missing

Code: 400
Content: { error: `Incorrect user_name or password` }
Invalid login

Code 201:
Successful POST request to /reviews/




## Setting Up

- Install dependencies: `npm install`
- Create development and test databases: `createdb NEAT`, `createdb NEAT-test`
- Create database user: `createuser NEAT`
- Grant privileges to new user in `psql`:
  - `GRANT ALL PRIVILEGES ON DATABASE NEAT TO NEAT`
  - `GRANT ALL PRIVILEGES ON DATABASE "neat-test" TO NEAT`
- Prepare environment file: `cp example.env .env`
  - Replace values in `.env` with your custom values if necessary.
- Bootstrap development database: `MIGRATION_DB_NAME=NEAT npm run migrate`
- Bootstrap test database: `MIGRATION_DB_NAME=NEAT-test npm run migrate`

### Configuring Postgres

For tests involving time to run properly, your Postgres database must be configured to run in the UTC timezone.

1. Locate the `postgresql.conf` file for your Postgres installation.
    - OS X, Homebrew: `/usr/local/var/postgres/postgresql.conf`
2. Uncomment the `timezone` line and set it to `UTC` as follows:

```
# - Locale and Formatting -

datestyle = 'iso, mdy'
#intervalstyle = 'postgres'
timezone = 'UTC'
#timezone_abbreviations = 'Default'     # Select the set of available time zone
```

## Sample Data

- To seed the database for development: `psql -U NEAT -d NEAT -a -f seeds/seed.neat_tables.sql`
- To clear seed data: `psql -U NEAT -d NEAT -a -f seeds/trunc.neat_tables.sql`

## Scripts

- Start application for development: `npm run dev`
- Run tests: `npm test`
