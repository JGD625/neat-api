CREATE TABLE neat_liquors (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), 
    liquor_name TEXT NOT NULL,
    date_published TIMESTAMP DEFAULT now() NOT NULL,
    brand_name TEXT,
    producer TEXT,
    origin TEXT,
    liquor_type TEXT,
    liquor_age TEXT,
    proof TEXT,
    price TEXT,
    rating TEXT,
    content TEXT
);
