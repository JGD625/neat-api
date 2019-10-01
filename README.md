# NEAT SERVER

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
