CREATE TABLE article_comments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    text TEXT NOT NULL,
    article_id UUID
        REFERENCES neat_articles ON DELETE CASCADE NOT NULL
);