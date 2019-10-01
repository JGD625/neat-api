CREATE TABLE neat_reviews (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL,
    rating INTEGER NOT NULL,
    date_created TIMESTAMP DEFAULT now() NOT NULL,
    liquor_id INTEGER
        REFERENCES neat_liquors(id) ON DELETE CASCADE NOT NULL,
    user_id INTEGER
        REFERENCES neat_users(id) ON DELETE CASCADE NOT NULL
);
