CREATE TABLE liquor_comments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    text TEXT NOT NULL,
    liquor_id UUID REFERENCES neat_liquors ON DELETE CASCADE NOT NULL
);