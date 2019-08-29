BEGIN;

INSERT INTO neat_users (
  id,
  first_name,
  last_name,
  email,
  screen_name,
  picture_url,
  favorite_liquor,
  about_user
) VALUES
  (
    'fcdab65c-d063-45d4-8277-fff9c0230a88',
    'James',
    'DeBourbon',
    'bourbonman@certainlymadeupemail.com',
    'BeardedBourbon42',
    'http://www.jdbutisbauch.com/images/profilepic.png',
    'Bourbon',
    'I tended bar in Brooklyn for seven years, and I really learned to love American whiskies. I am doing some research with hopes of opening my own place, and I want to specialize in bourbons.'
  ),
  (
    'fcaab65c-d073-44d4-8177-ggf9c0230a77',
    'Julie',
    'Butisbauch',
    'jdbutisbauch@gmail.com',
    'JDBitsMe',
    'http://www.jdbutisbauch.com/images/profilepic6.png',
    'Bourbon',
    'I made this thing (the app you are playing with). Surprise! Did you notice it was me?'
  ),
  (
    'f19d7725-c447-42d0-8b81-f41a16a97c34',
    'Ryean',
    'Trinker',
    'RT@sortofmadeupemail.com',
    'RyemanRyan',
    'http://www.jdbutisbauch.com/images/profilepic4.png',
    'Rye',
    'I live in Kentucky, so obviously I have a lot of opinions about liquid gold!'
  ),
  (
    '5b6620d4-1475-4f4a-b8dc-d1fa4c41023d',
    'Scott',
    'Ishman',
    's.ishman@maybemadeupemail.com',
    'schmiddy',
    'http://www.jdbutisbauch.com/images/profilepic5.png',
    'Scotch',
    'My cafe has a really great selection of liquors for our evenings. We have jazz every Friday night, and a Whiskey Club that meets the first Saturday of every month.'
  ),
  (
    '821a24ae-40ad-4f04-ad46-efbb5322a1bb',
    'Alexis',
    'Taylor',
    'a.tay@verymadeupemail.com',
    'lexlor',
    'http://www.jdbutisbauch.com/images/profilepic2.png',
    'Irish Whiskey',
    'I am kind of a homebody, but I like hosting a few good friends for drinks now and then.'
  ),
  (
    '2ad8f2bc-23db-4ace-aa9d-4da4844da0f8',
    'Janet',
    'Po',
    'wip@verymadeupemail.com',
    'PoLittle',
    'http://www.jdbutisbauch.com/images/profilepic3.png',
    'Dark Liquors',
    'I love a good time!!! Catch me out in the ATL every weekend!'
  );

INSERT INTO neat_articles (
  id,
  title,
  content,
  author_id
) VALUES
  (
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'First post with an author',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio, ut atque. Minima beatae ipsa ratione. Dolorem suscipit ullam temporibus repellendus quae atque expedita architecto corrupti doloremque ducimus eaque, eum ipsum!',
    'fcaab65c-d073-44d4-8177-ggf9c0230a77'
  ),
  (
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'Second post with an author',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam minus esse, dolorum vitae neque ullam adipisci consequatur doloremque autem rerum doloribus officiis exercitationem culpa, temporibus eligendi, assumenda ex. Cupiditate, sequi.',
    '5b6620d4-1475-4f4a-b8dc-d1fa4c41023d'
  ),
  (
    '2acbdb56-2889-4589-8f29-39760170cba4',
    'Third post with an author',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut et, eum id distinctio vel sint nulla dolorum vero perspiciatis debitis repudiandae officiis nostrum illo adipisci minus placeat in error. Voluptatum.',
    'fcdab65c-d063-45d4-8277-fff9c0230a88'
  );


INSERT INTO article_comments (
  id,
  text,
  article_id,
  user_id
) VALUES
  (
    'fabb14e1-2ac2-4c9c-8330-453fdb57ca02',
    'Really helpful! Thanks for writing this!',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'fcdab65c-d063-45d4-8277-fff9c0230a88'
  ),
  (
    '032e0655-3e0b-4469-bc43-b4e860baa0e1',
    'Another comment from a user',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  ),
  (
    '269bb863-ad3b-4f9a-a6f0-22a7b426ffff',
    'I never really looked at it that way.',
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'fcdab65c-d063-45d4-8277-fff9c0230a88'
  ),
  (
    '6f49cc70-e24d-422b-8385-e8d46c071d97',
    'More comments by a user',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    '821a24ae-40ad-4f04-ad46-efbb5322a1bb'
  ),
  (
    '826801e3-e062-4e3f-b602-976aaf49ad74',
    'Commentable comment from user',
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  );

  INSERT INTO liquor_comments (
  id,
  text,
  article_id,
  user_id
) VALUES
  (
    'fabb14e1-2ac2-4c9c-8330-453fdb57ca02',
    'Comment with a user',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'fcdab65c-d063-45d4-8277-fff9c0230a88'
  ),
  (
    '032e0655-3e0b-4469-bc43-b4e860baa0e1',
    'Another comment from a user',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  ),
  (
    '269bb863-ad3b-4f9a-a6f0-22a7b426ffff',
    'Users comment',
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'fcdab65c-d063-45d4-8277-fff9c0230a88'
  ),
  (
    '6f49cc70-e24d-422b-8385-e8d46c071d97',
    'More comments by a user',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    '821a24ae-40ad-4f04-ad46-efbb5322a1bb'
  ),
  (
    '826801e3-e062-4e3f-b602-976aaf49ad74',
    'Commentable comment from user',
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  );

COMMIT;