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
    'xcatb65c-d073-44d4-8177-ggf9c0230a77',
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
  author_id,
  banner_url
) VALUES
  (
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'Japanese Whisky: the art of fine whiskey making.',
    'When we think of whiskey, many of us think of the American varietals of bourbons and ryes, or perhaps European scotch comes to mind.  But do you think of the East? Japan has developed a really wonderful and rich history of whiskey making all of its own.  For over 100 years, Japanese distilleries have been producing some excellent expressions.  Many scotch fans would do well to try the Hokkaido produced varieties as the northern island has similar weather and landscape to Scotland. The smokey and earthy flavors will be familiar to many seasoned drinkers.  For a softer side, look to the distilleries from the main island of Honshu, where the whiskey often takes on more floral and fruity notes.',
    '5b6620d4-1475-4f4a-b8dc-d1fa4c41023d',
    'http://www.jdbutisbauch.com/images/art_jpns.png'
  ),
  (
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'Building Your Own Home Bar',
    'Building a bar in your home can be a difficult but rewarding task. There is nothing quite as impressive to your guests as a beautifully stocked bar with clever design.  One of the first things you will have to decide for yourself, is what style of bar fits in your home.  You don''t want to spend a lot of time and money creating an eye sore. For a more vintage and rustic feel, look for materials like reclaimed wood, iron, and brass. Don''t over finish anything, and leave as much raw as possible.  For a more modern look, try for nickel and glass.  Another possibly cheap and fun option is to repurpose other furniture into a bar.  Vintage pieces can be easy to come by in yard sales or flea markets, but a coat of paint and some new knobs can really make it shine.',
    'fcdab65c-d063-45d4-8277-fff9c0230a88',
    'http://www.jdbutisbauch.com/images/art_homebar.png'
  ),
  (
    '2acbdb56-2889-4589-8f29-39760170cba4',
    'Choosing Garnishes',
    'What is a Bloody Mary without the celery? A martini without the olives? The proper garnish can make or break a cocktail, and this can be particularly important when thinking of whiskey.  For one thing, whiskey cocktails come in an quite a variety.  Even the same cocktail can vary wildly by selecting different whiskey expressions to create it. A classic Old Fashioned calls for orange and maraschino cherries, but changing it up a bit depending on the bourbon profile can make for a more perfect experience. For example, if you were to use Eagle Rare, a more chocolatey and rich bourbon, you may want to try candied cherries instead for a dessert like experience. Or, if you were to try a higher proof option like Knobb Creek, using a more sticky sweet citrus like tangerine could temper the burn. Choosing the right garnish can be difficult, but if you really consider the qualities of the whiskey expression first, I am sure you will be glad you did.',
    '5b6620d4-1475-4f4a-b8dc-d1fa4c41023d',
    'http://www.jdbutisbauch.com/images/art_garnish.png'
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
    'Wow! I should try this!',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  ),
  (
    '269bb863-ad3b-4f9a-a6f0-22a7b426ffff',
    'I never really looked at it that way. I think I am going to garage sales soon!',
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'fcdab65c-d063-45d4-8277-fff9c0230a88'
  ),
  (
    '6f49cc70-e24d-422b-8385-e8d46c071d97',
    'I find Japanese whisky too expensive, but I did like it when I tried it.',
    'a7f400c6-8c29-46d0-b755-6239507df45e',
    '821a24ae-40ad-4f04-ad46-efbb5322a1bb'
  ),
  (
    '826801e3-e062-4e3f-b602-976aaf49ad74',
    'I build mine out of an old, broken piano!',
    '7b635a3f-ca35-4f46-9cc3-0c30e0ff4e30',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  );

  INSERT INTO liquor_comments (
  id,
  text,
  liquor_id,
  user_id
) VALUES
  (
    'fabb14e1-2ac2-4c9c-8330-453fdb57ca02',
    'Everything they make is so darn good',
    '64o3h725-j4w8-8235-824e-m6913c4to634',
    '2ad8f2bc-23db-4ace-aa9d-4da4844da0f8'
  ),
  (
    '032e0655-3e0b-4469-bc43-b4e860baa0e1',
    'The only Nikka in my budget, but still very good.',
    '84q3d125-u4s6-6135-443u-b7413c1ae576',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  ),
  (
    '269bb863-ad3b-4f9a-a6f0-22a7b426ffff',
    'I would give anything to try this!',
    '91x3d122-a4s3-6939-235z-i3413c1np192',
    '5b6620d4-1475-4f4a-b8dc-d1fa4c41023d'
  ),
  (
    '6f49cc70-e24d-422b-8385-e8d46c071d97',
    'Gotta love my Irish whisky!',
    '29x3d124-c4s9-1637-446w-k4513c1yn042',
    '2ad8f2bc-23db-4ace-aa9d-4da4844da0f8'
  ),
  (
    '826801e3-e062-4e3f-b602-976aaf49ad74',
    'SUUUUUCH a goooood SCOTCH',
    '86g3d127-n4s9-1633-116g-t7413c1ei638',
    'f19d7725-c447-42d0-8b81-f41a16a97c34'
  );

COMMIT;