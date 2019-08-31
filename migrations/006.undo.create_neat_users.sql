ALTER TABLE neat_articles DROP COLUMN IF EXISTS author_id;
ALTER TABLE article_comments DROP COLUMN IF EXISTS user_id;
ALTER TABLE liquor_comments DROP COLUMN IF EXISTS user_id;
DROP TABLE IF EXISTS neat_users;