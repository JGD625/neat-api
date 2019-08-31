CREATE TABLE neat_users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    screen_name TEXT NOT NULL,
    picture_url TEXT,
    favorite_liquor TEXT,
    about_user TEXT,
    date_published TIMESTAMP DEFAULT now() NOT NULL,
    date_modified TIMESTAMP
);

ALTER TABLE neat_users
  ADD CONSTRAINT neat_users_email_uk UNIQUE (email);

ALTER TABLE neat_articles
  ADD COLUMN
    author_id UUID REFERENCES neat_users ON DELETE SET NULL;

ALTER TABLE article_comments
  ADD COLUMN
    user_id UUID REFERENCES neat_users ON DELETE SET NULL;

ALTER TABLE liquor_comments
  ADD COLUMN
    user_id UUID REFERENCES neat_users ON DELETE SET NULL;


