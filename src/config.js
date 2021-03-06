module.exports = {
  PORT: process.env.PORT || 8000,
  NODE_ENV: process.env.NODE_ENV || 'development',
  JWT_SECRET: process.env.JWT_SECRET || 'change-this-secret',
  JWT_EXPIRY: process.env.JWT_EXPIRY || '20s',
  DATABASE_URL: process.env.DATABASE_URL || 'postgresql://NEAT@localhost/NEAT',
  TEST_DATABASE_URL: process.env.TEST_DATABASE_URL || 'postgresql://NEAT@localhost/NEAT-test' 
}
