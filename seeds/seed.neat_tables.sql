BEGIN;

TRUNCATE
  neat_reviews,
  neat_liquors,
  neat_users,
  RESTART IDENTITY CASCADE;

INSERT INTO neat_users (user_name, full_name, nickname, password)
VALUES
  ('BeardedBourbon42', 'James DeBourbon', 'Jim', '$2a$12$lHK6LVpc15/ZROZcKU00QeiD.RyYq5dVlV/9m4kKYbGibkRc5l4Ne'),
  ('JDBitsMe', 'Julie Bee', 'JayDee', '$2a$12$VQ5HgWm34QQK2rJyLc0lmu59cy2jcZiV6U1.bE8rBBnC9VxDf/YQO'),
  ('RyemanRyan', 'Ryan Trinkter', 'Ryan', '$2a$12$2fv9OPgM07xGnhDbyL6xsuAeQjAYpZx/3V2dnu0XNIR27gTeiK2gK'),
  ('schmiddy', 'Scott Ishman', 'Scottie', '$2a$12$/4P5/ylaB7qur/McgrEKwuCy.3JZ6W.cRtqxiJsYCdhr89V4Z3rp.'),
  ('Lexopotamus', 'Alexis Taylor', 'Lex', '$2a$12$Hq9pfcWWvnzZ8x8HqJotveRHLD13ceS7DDbrs18LpK6rfj4iftNw.'),
  ('Polittle', 'Janet Poe', 'Popo', '$2a$12$ntGOlTLG5nEXYgDVqk4bPejBoJP65HfH2JEMc1JBpXaVjXo5RsTUu');

INSERT INTO neat_liquors (liquor_name, brand_name, producer, origin, liquor_type, liquor_age, proof, price, rating, content)
VALUES

('Angel''s Envy Kentucky Straight Bourbon', 'Angel''s Envy', 'Louisville Distilling Company, LLC', 'KY, USA', 'Bourbon', '4-6 years', '86.6', '3', '2', 'A light bodied and golden bourbon. A subtle nose with some floral and fruity notes and a light spice.'),
('Balcones Baby Blue Corn Whisky', 'Balcones', 'Balcones Distilling, LLC', 'TX, USA', 'Whiskey', '4 months', '92', '3', '1', 'An extremely young and thin bodied whiskey, with corn, peanut, and cereal notes. On an interesting note, it is made with ''Hopi'' blue corn, staying true to its Texas identity.'),
('Balcones Brimstone Texas Scrub Oak Smoked Corn Whisky', 'Balcones', 'Balcones Distilling, LLC', 'TX, USA', 'Whisky', 'Less than 2 years', '106', '3', '1', 'A smokey, corn and mesquite flavor. Mahogany colored and medium bodied, an excellent ingredient for barbeque.'),
('Balcones Texas Single Malt Whisky', 'Balcones', 'Balcones Distilling, LLC', 'TX, USA', 'Single Malt Whiskey', 'No Age Statement', '105', '4', '2', 'Made with peated malt imported from Scotland and a winner of Britain''s Best in Glass competition. Plenty of smoke and fire but a strong fruity undertone.'),
('Basil Hayden''s Kentucky Straight Bourbon', 'Basil Hayden''s', 'Beam INC', 'KY, USA', 'Bourbon', '8', '80', '2', '2', 'A light bodied and auburn colored member of the Beam Small Batch Collection, a nice and sweet sipping whiskey. If you are familiar with Old Grand Dad, Basil Hayden''s is in fact the same whiskey aged for a longer time.'),
('Blanton''s Original Single Barrel Bourbon', 'Blanton''s', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', 'No age statement', '93', '3', '4', 'The world''s first single barrel bourbon expression, Blanton''s  is full bodied, reach, and respectable. With its easily recognized bottle and hints of buttery and toffee, this is a must have in any collection.'),
('Buffalo Trace Kentucky Straight Bourbon Whiskey', 'Buffalo Trace', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', 'No age statement', '90', '2', '3', 'A nice dry American bourbon with a very reasonable price point for the quality.  Smooth and drinkable, with buttery oak and wheat flavor.'),
('Bulleit Bourbon Forntier Whiskey', 'Bulleit', 'Bulleit Bourbon, Four Roses Distillery', 'KY, USA', 'Bourbon', '6-8 years', '90', '2', '2', 'Medium bodied and amber colored. Floral and cola notes and a slightly sweet finish. Wonderful when mixed with dark colas.'),
('Bulleit Rye American Whiskey', 'Bulleit', 'Bulleit Bourbon, MGP Ingredients, INC', 'IN, USA', 'Rye', '4-7 years', '90', '2', '2', 'A solid rye with cloves, vanilla, cinnamon and a zesty bite. Excellent with mixers and light bodied.'),
('Colonel E. H. Taylor Barrel Proof Straight Kentucky Bourbon Whiskey', 'Colonel E. H. Taylor', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', 'No age statement', '134.5', '4', '3', 'A big, bold flavor and a high-proof drink. Full and robust with syrup and almond sweetness and a very firey finish.'),
('Colonel E. H. Taylor Single Barrel Straight Kentucky Bourbon Whiskey', 'Colonel E. H. Taylor', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', '7 years', '100', '4', '4', 'An excellent partner to its higher proof sibling, the single barrel is complex and rich. A full body and a range of sweet and warm spices in the taste along with a smooth finish makes for a very drinkable bourbon.'),
('Elijah Craig Kentucky Straight Bourbon Whiskey 12 Years Old', 'Elijah Craig', 'Heaven Hill Distilleries', 'KY, USA', 'Bourbon', '12', '94', '3', '3', 'Fantastic for the price point with a dry finish and a toasty character. Full bodied and auburn color, a slightly higher proof than its older siblings.'),
('Elijah Craig Kentucky Straight Bourbon Whiskey 18 Years Old', 'Elijah Craig', 'Heaven Hill Distilleries', 'KY, USA', 'Bourbon', '18', '90', '3', '4', 'An excellent whiskey, smooth and rich with a spicey, lingering finish.'),
('Elijah Craig Kentucky Straight Bourbon Whiskey 20 Years Old', 'Elijah Craig', 'Heaven Hill Distilleries', 'KY, USA', 'Bourbon', '20', '90', '4', '4', 'Only aged two more years than the 18 variety, yet there is a notable difference in the flavor. Less butter and less sweet, a very dry finish.'),
('Evan Williams 1783 Kentucky Straight Bourbon Whiskey', 'Evan Williams', 'Heaven Hill Distilleries', 'KY, USA', 'Bourbon', 'No age statement', '86', '2', '2', 'Medium bodied and quite sweet with lingering cinnamon spice. Balanced, but not a stand out drink.'),
('Evan Williams Kentucky Straight Bourbon Whiskey Black Label', 'Evan Williams', 'Heaven Hill Distilleries', 'KY, USA', 'Bourbon', 'No age statement', '86', '1', '1', 'Solid and reliable as a cocktail liquor. Light bodied and not overpowering.'),
('Evan Williams Kentucky Straight Bourbon Whiskey Green Label', 'Evan Williams', 'Heaven Hill Distilleries', 'KY, USA', 'Bourbon', 'No age statement', '86','1', '1', 'Like its Black Label twin, a solid and reliable as a cocktail liquor. More acrid and smokey than the Black label, and with a spicier finish.'),
('Four Roses Bourbon', 'Four Roses', 'Four Roses Distillery', 'KY, USA', 'Bourbon', 'No age statement', '80', '1', '2', 'A solid and reputable starter whiskey. Low proof, drinkable, and affordable, light bodied and sweet.'),
('Four Roses Small Batch Kentucky Bourbon Whiskey', 'Four Roses', 'Four Roses Distillery', 'KY, USA', 'Bourbon', 'No age statement', '90', '2', '3', 'An excellent bourbon with notes of honey and nuts and a spicy finish. Strong value.'),
('Four Roses Single Barrel Kentucky Straight Bourbon Whiskey', 'Four Roses', 'Four Roses Distillery', 'KY, USA', 'Bourbon', 'No age statement', '100', '2', '2', 'Four Roses'' Single Barrel releases vary quite a bit. Generally they are solid, medium bodied whiskies with good depth and a well earned reputation.'),
('George Dickel Rye Whisky', 'George Dickel', 'George A. Dickel & Co', 'IN, USA', 'Rye', 'No age statement', '90', '2', '2', 'Finished in the chilled charcoal-mellowed style that makes Dickel whiskey stand out. A solid cocktail rye.'),
('George Dickel Tennessee Whisky Barrel Select', 'George Dickel', 'George A. Dickel & Co', 'TN, USA', 'Whiskey', 'No age statement', '86', '2', '1', 'Light, sweet, and affordable with a thin mouthfeel.  An excellent backbone for lighter or sour cocktails.'),
('George Dickel Tennessee Whisky Cascade Hollow', 'George Dickel', 'George A. Dickel & Co', 'TN, USA', 'Whiskey', 'No age statement', '80', '1', '1', 'Light bodied and sour, yet smooth and drinkable.'),
('George Dickel Tennessee Whisky No. 8', 'George Dickel', 'George A. Dickel & Co', 'TN, USA', 'Whiskey', 'No age statement', '80', '1', '1', 'Medicinal with a cherry and vanilla taste and a spicey finish. '),
('George Dickel Tennessee Whisky No. 12', 'George Dickel', 'George A. Dickel & Co', 'TN, USA', 'Whiskey', 'No age statement', '90', '1', '2', 'A classic Tennessee taste, smooth but very sweet.  Leaves a soft burn on the palate.'),
('High West Wiskey Double Rye!', 'High West', 'High West Distillery and Saloon', 'UT, USA', 'Rye', 'No age statement', '92', '2', '2', 'A solid rye with a funky, oat filled nose and a spicey and sweet finish. Light bodied but capable.'),
('High West Whiskey Rendezvous', 'High West', 'High West Distillery and Saloon', 'UT, USA', 'Rye', '6 years', '92', '3', '2', 'A rye for a scotch lover, Rendezvous has a lot of funk and tobacco flavor with a medium body. Like kissing a smoker, in a good way.'),
('Hudson Baby Bourbon', 'Hudson', 'Tuthilltown Spirits', 'NY, USA', 'Bourbon', 'Less than 4 years', '92', '2', '1', 'Very grainy with an overly strong corn palate. A quick finish on this very young bourbon.'),
('Hudson Four-Grain Bourbon', 'Hudson', 'Tuthilltown Spirits', 'NY, USA', 'Bourbon', 'Less than 4 years', '92', '3', '1', 'Similar to Hudson''s Baby Bourbon, thin bodied and grainy.'),
('Hudson Manhattan Rye', 'Hudson', 'Tuthilltown Spirits', 'NY, USA', 'Rye', 'Less than 4 years', '92', '3', '1', 'Heavy cereal notes and a brassy flavor. The finish has a slight floral hint and is the best part of the beverage.'),
('Hudson Single Malt', 'Hudson', 'Tuthilltown Spirits', 'NY, USA', 'Single Malt Whiskey', 'Less than 4 years', '92', '3', '1', 'Many American distilleries have yet to master the single-malt, and this is no exception. The finish is long and bitter.'),
('Jack Daniel''s Old No. 7 Tennessee Whiskey', 'Jack Daniel''s', 'Jack Daniel Distillery', 'TN, USA', 'Whiskey', 'No age statement', '80', '1', '2', 'Possibly the most famous whiskey in the world. Consistent, reliable, enough flavor to carry itself on ice and smooth enough to be used in a cocktail, yet affordable.'),
('Jack Daniel''s Old No. 7 Tennessee Whiskey Green Label', 'Jack Daniel''s', 'Jack Daniel Distillery', 'TN, USA', 'Whiskey', 'No age statement', '80', '1', '1', 'A lighter, sweeter version of the standard Black Label.'),
('Gentleman Jack Rare Tennessee Whiskey', 'Jack Daniel''s', 'Jack Daniel Distillery', 'TN, USA', 'Whiskey', 'No age statement', '80', '2', '1', 'The thick and syrupy member of the Jack family. Strong maple and peper flavors and an almost sticky sweet mouthfeel.'),
('Jack Daniel''s Single Barrel Select Tennessee Whiskey', 'Jack Daniel''s', 'Jack Daniel Distillery', 'TN, USA', 'Whiskey', 'No age statement', '94', '2', '2', 'The star of Lynchburg, and the head of the Jack family.  Complex, firey heat with sweet notes and a surprisingly bitter finish, an excellent example of Tennessee whiskey.'),
('Jim Beam Kentucky Straight Bourbon Whiskey', 'Jim Beam', 'Beam Inc.', 'KY, USA', 'Bourbon', '4 years', '80', '1', '2', 'One of the most well known names in American whiskey, and a classic mixer. Well balanced between peppery and sweet flavors, an excellent economy whiskey.'),
('Jim Beam Kentucky Straight Rye Whiskey', 'Jim Beam', 'Beam Inc.', 'KY, USA', 'Rye', '4 years old', '80', '1', '1', 'A well known rye with a small flavor. Spicy but not complicated, best suited for cocktails.'),
('Jim Beam Double Aged Kentucky Straight Bourbon Whiskey', 'Jim Beam', 'Beam Inc.', 'KY, USA', 'Bourbon', '8 years', '86', '1', '2', 'The best Beam to be enjoyed alone, this is a light bodied and pleasantly sweet variety. Fruit and honey notes, tawny colored and a cinnamon-sweet finish.'),
('Jim Beam Devil''s Cut Kentucky Straight Bourbon Whiskey', 'Jim Beam', 'Beam Inc.', 'KY, USA', 'Bourbon', 'No age statement', '90', '2', '1', 'Flowery with a candied flavor, there is no real novelty to make this bottle stand out. '),
('Knob Creek Small Batch Kentucky Straight Bourbon Whiskey', 'Knob Creek', 'Beam Inc.', 'KY, USA', 'Bourbon', '9 years', '100', '2', '3', 'High quality for the price point, and a nice, full bodied bourbon.  Apricots and cinnmon with a long finish.'),
('Knob Creek Single Barrel Reserve Kentucky Straight Bourbon Whiskey', 'Knob Creek', 'Beam Inc.', 'KY, USA', 'Bourbon', '9 years', '120', '2', '3', 'As with all the Knob Creek line up, a smooth and excellent whiskey. With a higher proof than its siblings, this bourbon has a slow burn in the finish.'),
('Knob Creek Rye Whiskey Small Batch', 'Knob Creek', 'Beam Inc.', 'KY, USA', 'Rye', '9 years', '100', '2', '3', 'A classic rye with a medicinal flavor and a medium body.'),
('Masterson''s Straight Rye Whiskey', 'Masterson''s', 'Unknown', 'Canada', 'Rye', '10 years', '90', '4', '4', 'A stellar rye with a full body and an intersting origin. Sourced from Canada by a California brand, the true producer is unknown. Flavors range from honey and floral notes to a warm and cinnamon fire, all on a woody base.'),
('McCarthy''s Oregon Single Malt Whiskey', 'McCarthy''s', 'Clear Creek Distillery', 'OR, USA', 'Single Malt Whiskey', '3 years', '85', '3', '4', 'An excellent craft whiskey and a rare American whiskey that is an excellent dupe for a true Scotch. Peat, smoke, ash a leather come together for a medium body and a taste thick enough to chew.'),
('Old Overholt Straight Rye Whiskey', 'Old Overholt', 'Beam Inc.', 'KY, NYC', 'Rye', '4', '80', '1', '2', 'An affordable whiskey with a long history. A buttery, oakey flavor with a cinnamon finish. This rye can easily mix into a cocktail or stand alone.'),
('Old Potrero Single Malt Rye Whiskey', 'Old Potrero', 'Anchor Brewers and Distillers', 'CA, USA', 'Rye', 'No age statement', '97', '4', '2', 'A funky whiskey with a sticky sweetness that is unique enough to divide everyone who tries it. '),
('Old Potrero Single Malt 18th Century Style Whiskey', 'Old Potrero', 'Anchor Brewers and Distillers', 'CA, USA', 'Single Malt', 'No age statement', '102.4', '4', '1', 'High priced for a rubbery and unpleasant single malt. Unlikely to appeal to true scotch fans.'),
('Pikesville Supreme Straight Rye Whiskey', 'Pikesville Supreme', 'Heaven Hill Distilleries', 'KY, USA', 'Rye', '3 years', '80', '1', '2', 'Though its origins and name come from Maryland, this rye has been produced in Kentucky for many years. Full bodied, robust, and flavorful, an excellent starter rye.'),
('Old Rip Van Winkle Handmade Bourbon', 'Old Rip Van Winkle', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', '10 years', '107', '3', '4', 'The least expensive of the Van Winkle family, possibly the easiest to find.  Measured amber liquid with a medium body and a hot finish. Any collector or bar would be proud to have this on their shelf.'),
('Pappy Van Winkle''s Family Reserve 15 Year Old', 'Old Rip Van Winkle', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', '15 years', '107', '4', '5', 'One of the most famous and coveted bottles, a Pappy''s is a prestige brand that earns its reputation. A well balanced and ample whiskey, deeply satisfying with sugary notes and a hot finish.'),
('Pappy Van Winkle''s Family Reserve 20 Year Old', 'Old Rip Van Winkle', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', '20 years', '90.4', '4', '4', 'One of the most famous and coveted bottles, a Pappy''s is a prestige brand that earns its reputation. The oakiest of the Pappy family, with a lighter mouthfeel than its siblings.'),
('Pappy Van Winkle''s Family Reserve 23 Year Old', 'Old Rip Van Winkle', 'Buffalo Trace Distillery', 'KY, USA', 'Bourbon', '23 years', '95.6', '4', '5', 'One of the most famous and coveted bottles, a Pappy''s is a prestige brand that earns its reputation. Difficult to find but easily one of the best bourbons available. Full bodied, mellow yet spiced, and the kind of whiskey.'),
('Van Winkle Family Reserve Rye', 'Old Rip Van Winkle', 'Buffalo Trace Distillery', 'KY, USA', 'Rye', '13 years', '95.6', '4', '5', 'As with all Van Winkle bottles, the rye is an exceptionally good find.  Not particularly sweet, slightly floral, and with a punch of spice on the finish.'),
('Van Winkle Special Reserve Lot B Kentucky Straight Whiskey', 'Old Rip Van Winkle', 'Buffalo Trace Distillery', 'KY, USA', 'type', '12 years', '90.4', '4', '4', 'An excellent, dark whiskey with a clean and floral feel with a slow burn finish that lingers. Easier to find than the Pappy varieties, but not to be over looked.'),
('Pine Barrens Single Malt Whiskey', 'Pine Barrens', 'Long Island Spirits', 'NY, USA', 'Single Malt Whiskey', 'less than 2 years', '96', '3', '2', 'A pleasant whiskey but without the usual peat and scotch feel of a single malt. Thin bodied and limited in distribution.'),
('Riverboat Rye American Rye Whiskey', 'Riverboat Rye', 'MGP Ingredients Inc', 'IN, USA', 'Rye', 'No age statement', '80', '1', '1', 'A mediocre and funky rye with a yeasty flavor and a peppery finish. Thin bodied.'),
('Russell''s Reserve Kentucky Straight Rye Whiskey', 'Russell''s Reserve', 'Austin Nichols Distilling Co', 'KY, USA', 'Rye', '6 years', '90', '3', '3', 'A mild rye with sweet tobacco flavorings and a nutty finish. Medium bodied and strong vanilla notes.'),
('Sazerac Straight Rye Whiskey', 'Sazerac', 'Buffalo Trace Distillery', 'KY, USA', 'Rye', '6 years', '90', '2', '4', 'A tasty rye whiskey, more mild and with less heat than generally expected in a rye. An excellent starter rye for the curious.'),
('Seagram''s Seven Crown American Whiskey', 'Seagram''s 7 Crown', 'Unknown', 'Unknown', 'Whiskey', 'No age statement', '80', '1', '1', 'A blended whiskey with a long history and one of the more well known brands in America. Common in bars as a mixing whiskey, it doesn''t have the legs to stand on its own.'),
('St. George Single Malt Whiskey', 'St. George Single Malt Whiskey', 'St. George Spirits', 'CA, USA', 'Single Malt Whiskey', 'No age statement', '86', '4', '3', 'A fair interpretation of single malts. Woody, with slight peat and honeysuckle flavors and a soft sherry finish.'),
('Stranahan''s Colorado Whiskey', 'Stranahan''s', 'Stranahan''s Colorado Whiskey', 'CO, USA', 'Whiskey', '2 years', '94', '3', '2', 'A very funky whiskey that may appeal to scotch fans.  Ash, peanuts, and barely with a spicey finish and a medium body.'),
('Templeton Rye Small Batch Rye Whiskey', 'Templeton', 'MGP Ingredients, INC', 'IN, USA', 'Rye', 'No age statement', '80', '2', '2', 'A solid and sturdy rye with cereal, vanilla and heat.  Light bodied and an excellent sipping whiskey.'),
('Westward Oregon Straight Malt Whiskey', 'Westward', 'House Spirits Distillery', 'OR, USA', 'Malt Whiskey', 'No age statement', '90', '3', '2', 'An excellent cocktail whiskey with a light body and a salted caramel flavor with a peppery finish.'),
('Whipper Snapper Oregon Spirit Whiskey', 'Whipper Snapper', 'Ransom Wine and Spirits', 'OR, USA', 'Whiskey', 'No age statement', '84', '2', '1', 'A blend of corn whiskey and neutral spirits that is thin bodied and herbal.'),
('Whistlepig Straight Rye Whiskey', 'Whistlepig', 'Whistlepig Farm', 'USA, Canada', 'Rye', '10', '100', '4', '4', 'With mash sourced from Canada and a great team backing it, Whistlepig has earned its place as a coveted whiskey. Flowery with a dry, candy finish and none of the expected rye bitter notes.'),
('Whistlepid Triple One Rye Whiskey', 'Whistlepig', 'Whistlepig Farm', 'USA, Canada', 'Rye', '11', '111', '4', '5', 'With mash sourced from Canada and a great team backing it, Whistlepig has earned its place as a coveted whiskey. Bright, with apricot and floral notes, dark tea and pepper flavor yet a vanilla finish. An excellent choice for a neat glass.'),
('Wild Turkey 81 Kentucky Straight Bourbon Whiskey', 'Wild Turkey', 'Austin Nichols Distilling Co', 'KY, USA', 'Bourbon', 'No age statement', '81', '1', '3', 'A light and refreshing bourbon from one of the most famous names in American whiskey. Vanilla, oak, sweet and nutty.'),
('Wild Turkey 101 Kentucky Straight Bourbon Whiskey', 'Wild Turkey', 'Austin Nichols Distilling Co', 'KY, USA', 'Bourbon', 'No age statement', '101', '2', '2', 'A good and drinkable balance of sweet and bitter, oak and almonds, with a simple sugar finish and a light burn. An excellent mixer.'),
('Wild Turkey Kentucky Straight Rye Whiskey', 'Wild Turkey', 'Austin Nichols Distilling Co', 'KY, USA', 'Rye', 'No age statement', '101', '2', '1', 'A floral and earthy rye that is improved with a splash of water. A long and spicy burn on the finish.'),
('Wild Turkey Rare Breed Kentucky Straight Bourbon Whiskey', 'Wild Turkey', 'Austin Nichols Distilling Co', 'KY, USA', 'Bourbon', '6', '108', '2', '2', 'A fair and respectable bourbon for the price point with a honey finish and a medium body.'),
('Lagavulin 16 Year', 'Lagavulin', 'Lagavulin Whisky Distillery', 'Islay, Scotland', 'Scotch', '16 years', '86', '2', '3', 'An excellent example of a true, peat driven scotch. Intense smoke with a caramel finish.'),
('The Glenlivet 12 Year Old Single Malt Scotch Whisky', 'The Glenlivet', 'Glenlivet Distillery', 'origin', 'Scotch', '12 years', '86', '2', '3', 'Fruity and summer for a scotch. An easy starter scotch for those not ready to jump in with a smokey variety, it has a creamy finish.'),
('The Glenlivet 15 Year Old Single Malt Scotch Whisky', 'The Glenlivet', 'Glenlivet Distillery', 'origin', 'Scotch', '15 years', '86', '2', '3', 'A smooth scotch with a lingering spice finish. A fantastic expression of scotch''s softer side.'),
('The Glenlivet 18 Year Old Single Malt Scotch Whisky', 'The Glenlivet', 'Glenlivet Distillery', 'origin', 'Scotch', '18 years', '86', '3', '4', 'The expression to win the most awards, a solid mid-range bottle. Toffee and spice flavors and an ample body.'),
('The Glenlivet 21 Year Old Single Malt Scotch Whisky', 'The Glenlivet', 'Glenlivet Distillery', 'origin', 'Scotch', '21 years', '86', '4', '5', 'A unique bottle with a sticky toffee mouthfeel, well suited to drinking neat with a full flavored meal.'),
('The Glenlivet 25 Year Old Single Malt Scotch Whisky', 'The Glenlivet', 'Glenlivet Distillery', 'origin', 'Scotch', '25 years', '86', '4', '4', 'A more rare bottle and the depth of the flavor makes finding it worth it. A rich and complex drink, best enjoyed alone, perhaps as a nightcap or after dinner. You want a fresh palate to enjoy the subtle notes this scotch has to offer.'),
('Aberlour 12 Year Old Single Malt Scotch Whisky', 'Aberlour', 'Aberlour Distillery', 'Scotland', 'Scotch', '12', '86', '2', '3', 'Oloroso casks impart subtle yet sweet notes of dried fruits, a capable scotch on the sweeter side.'),
('Aberlour 16 Year Old Single Malt Scotch Whisky', 'Aberlour', 'Aberlour Distillery', 'Scotland', 'Scotch', '16', '86', '2', '3', 'Aged for a minimum of 16 years in a combination of ex-bourbon and ex-sherry casks, almonds and baking spices on the palate. Finish is warm and spicy.'),
('Aberlour 18 Year Old Single Malt Scotch Whisky', 'Aberlour', 'Aberlour Distillery', 'Scotland', 'Scotch', '18', '86', '3', '4', 'Similarly sweet to the other bottles in this family, but with the introduction of the more traditional tobacco and earthy flavors associated with scotch.'),
('Aberlour A''bunadh Single Malt Scotch Whisky', 'Aberlour', 'Aberlour Distillery', 'Scotland', 'Scotch', 'No age statement', '119', '2', '4', 'In the Aberlour family the 12 Year old is extremely smooth, but the A''bunadh is cask strength, it''s not for the laymen.'),
('Aberlour Casg Annamh Batch 1 Single Malt Scotch Whisky', 'Aberlour', 'Aberlour Distillery', 'Scotland', 'Scotch', 'No age statement', '96', '2', '4', 'A softer single malt, with a lower proof that the A''bunadh.'),
('The Dead Rabbit Irish Whiskey', 'The Dead Rabbit Irish Whiskey', 'Dublin Liberties Distillery', 'Ireland', 'Irish Whiskey', '5 years', '88', '2', '3', 'Vanilla flavor that is a bit like a bourbon, this whiskey blend was named for the notorious Irish gang from New York. Excellent for an Irish cocktail or in coffee.'),
('Jameson Irish Whiskey', 'Jameson Irish Whiskey', 'Irish Distillers', 'Ireland', 'Irish Whiskey', '4-7 years', '80', '2', '3', 'The best selling Irish whiskey in the world and an easily recognized brand. Best used as a mixer, excellent with ginger ale.'),
('Yoichi Single Malt', 'Nikka', 'Nikka Whisky', 'Japan', 'Japanese Whiskey', 'No age statement', '90', '2', '3', 'A strong and peaty single malt that reminds one of a scotch, which come at no suprise as it is distilling in the norternmost regions of Japan, where the weather is no unlike the highlands. An excellent whiskey from Japan made with coal filtered distillation.'),
('Taketsuru Pure Malt 17 Years Old', 'Nikka', 'Nikka Whisky', 'Japan', 'Japanese Whiskey', '17', '86', '4', '4', 'A mellow and well rounded bottle that comes with a high price, but a true collector could find it worth the cost. The peat builds up over time, and this is a smooth yet deep flavored and rich drink.'),
('Taketsuru Pure Malt 21 Years Old', 'Nikka', 'Nikka Whisky', 'Japan', 'Japanese Whiskey', '21', '86', '4', '5', 'The prestige bottle of Japan, the 21 year is extremely smooth, well balanced, and a pure pleasure to drink. Put this next to a bottle of Pappy Van Winkle''s to impress your guests.'),
('Taketsuru Pure Malt', 'Nikka', 'Nikka Whisky', 'Japan', 'Japanese Whiskey', 'No age statement', '86', '2', '3', 'A really solid bottle of Japanese whiskey for anyone not prepared to pay for the 17 or 21 year bottles. At hundreds less, this is a much more affordable and still very respectable bottle.'),
('Nikka Coffey Grain Whisky', 'Nikka', 'Nikka Whisky', 'Japan', 'Japanese Whiskey', 'No age statement', '90', '2', '4', 'Predominantly made from corn and distilled in a Coffey Still, not to be confused with coffee. A beautiful grain whiskey and very drinkable with a lower price point than many Nikka varieties.'),
('The Nikka 12 Years Old', 'Nikka', 'Nikka Whisky', 'Japan', 'Japanese Whiskey', '12 years', '86', '2', '4', 'A solid option for someone looking for a mid-grade Nikka product. Using more malt whiskies than grain whiskies in the formula, this expression has malty and rich flavors.'),
('The Yamazaki Single Malt Japanese Whisky 12 Year', 'Yamazaki Whisky', 'Suntory Whisky', 'Japan', 'Japanese Whiskey', '12', '86', '3', '4', 'A golden liquid with sweet fruits and gingers with a softer finish. An excellent first whiskey to try from the oldest malt distillery in Japan.'),
('The Yamazaki Single Malt Japanese Whisky 18 Year', 'Yamazaki Whisky', 'Suntory Whisky', 'Japan', 'Japanese Whiskey', '18', '86', '4', '5', 'An award winning single malt, a truly stunning combination of sherry, oak, and smoke.'),
('The Yamazaki Single Malt Japanese Whisky 25 Year', 'Yamazaki Whisky', 'Suntory Whisky', 'Japan', 'Japanese Whiskey', '25', '86', '4', '4', 'An incredibly hard bottle to find, even an empty bottle can go for over a thousand USD. You read that right, an EMPTY bottle can cost that much. Supposedly the flavor is deep and complex, but I have yet to meet anyone who has even held a bottle much less verified the taste.'),
('Hibiki Japanese Harmony', 'Suntory Whisky Hibiki', 'Suntory Whisky', 'Japan', 'Japanese Whiskey', 'No age statement', '86', '2', '3', 'A subtle and softer member of the Suntory brands, this expression is a blend with honey and floral notes. The easiest to find of the Hibiki family.'),
('Hibiki 17 Year', 'Suntory Whisky Hibiki', 'Suntory Whisky', 'Japan', 'Japanese Whiskey', '17 years', '86', '4', '4', 'A world renowned Japanese blend, Hibiki 17 Year Old is made with aged malt and grain whiskies from Suntory''s distilleries. Initially released in 1989, the blend is matured in Japanese mizunara oak casks at Yamazaki.'),
('Hibiki 21 Year', 'Suntory Whisky Hibiki', 'Suntory Whisky', 'Japan', 'Japanese Whiskey', '21 years', '86', '4', '5', 'Another stellar and long-aged whiskey from Suntory, and a rare bottle to find. Expect to pay for the pleasure, but the malt and grain flavors and the prestige may be worth it to some.'),
('Glenfiddich 12 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '12', '80', '1', '3', 'Creamy with a long, smooth and mellow finish, the base of the Glenfiddich family of expressions.'),
('Glenfiddich 15 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '15', '80', '2', '3', 'A spicy and solid scotch, warming and yet mellow at the same time. An excellent sipping scotch.'),
('Glenfiddich 18 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '18', '80', '2', '3', 'Fruity, robust, and a distinguished finish. The oak notes are a nice touch, and this is a solid choice for the average collector that would like a nicer bottle.'),
('Glenfiddich 21 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '21', '80', '3', '3', 'Finished in rum casks, this is an unusual expression with a warm and spicy feel. There is definitely a hint of the tropical origins in this bottle.'),
('Glenfiddich 30 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '30', '86', '4', '4', 'Not nearly as difficult to come by as the 40 and 50 year expressions, but also possibly not worth as much of the hype. Heart oak and a warm mouthfeel.'),
('Glenfiddich 40 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '40', 'Depends on year', '4', '4', 'Similar to the 50 year, this is an exceptionally rare bottle. A gold medal winner and sought after by experts, only 1000 bottles are released in a year.'),
('Glenfiddich 50 Year Old', 'Glenfiddich', 'Glenfiddich Whisky Distillery', 'Scotland', 'Scotch', '50', '92', '4', '5', 'Only 50 bottles of this single malt Scotch whisky are released each year. A gentle, smokey whiskey and an unusual expression to say the least.');


INSERT INTO neat_reviews (
  text,
  rating,
  liquor_id,
  user_id
) VALUES
  (
    'This is amazing.',
    4,
    1,
    2
  ),
  (
    'Put a bit of sugar and orange on it!',
    4,
    1,
    3
  ),
  (
    'All the other reviewers are obviously insane, this is actually pretty amazing.',
    5,
    1,
    4
  ),
  (
    'When life gives you lemons, make a garnish for this!',
    4,
    1,
    5
  ),
  (
    'This cured my cough when mixed with a little honey.',
    3,
    2,
    6
  ),
  (
    'I think I swallowed a bug, not into it.',
    1,
    2,
    1
  ),
  (
    'I have not even seen it, I cannot find it in stores. I do not know why I am writing this review, I hear it is good and just want to try it, Three stars!',
    3,
    2,
    3
  ),
  (
    'Ew.',
    1,
    4,
    6
  ),
  (
    'I heard about this and had to try it.',
    3,
    4,
    4
  ),
  (
    'big time many goodness!!!',
    5,
    10,
    3
  ),
  (
    'I liked it!',
    2,
    10,
    5
  ),
  (
    'There are some better but definitely some worse.',
    3,
    7,
    1
  ),
  (
    'Great holiday present.',
    4,
    7,
    2
  ),
  (
    'It does not say this on the label, but this is one of the best out there, it is that good.',
    3,
    7,
    3
  ),
  (
    'Do not believe the hype!',
    1,
    7,
    4
  ),
  (
    'I would rather have a shoulder rub.',
    3,
    9,
    6
  ),
  (
    'I was not a fan! Run! RRUUUUUUNNNN!',
    1,
    6,
    5
  ),
  (
    'It was a useful gift.',
    4,
    6,
    1
  ),
  (
    'Slightly better than waking up deep in the forests of Madagascar and having no idea how you got there, but not THAT much better.',
    3,
    8,
    2
  ),
  (
    'Octopii give it eight tentacles up!',
    5,
    8,
    4
  );


COMMIT;