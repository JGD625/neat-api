CREATE TABLE neat_articles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    date_published TIMESTAMP DEFAULT now() NOT NULL,
    banner_url TEXT,
    content TEXT
);