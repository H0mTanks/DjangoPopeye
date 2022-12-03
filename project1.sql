DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;

CREATE TABLE dishes(
    ID INT,
    name VARCHAR(20),
    calories INT,
    preptime INT,
    cooktime INT,
    recipe VARCHAR(8000),
    PRIMARY KEY(ID)
);

CREATE TABLE allergies(
    name VARCHAR(20),
    PRIMARY KEY(name)
);

CREATE TABLE prone(
    ID INT,
    name VARCHAR(20),
    PRIMARY KEY(ID, name),
    FOREIGN KEY(ID) REFERENCES dishes(ID) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES allergies(name) ON DELETE CASCADE
);

CREATE TABLE non_seasonal_ingredients(
    name VARCHAR(20),
    PRIMARY KEY(name)
);

CREATE TABLE ns_contains(
    ID INT,
    name VARCHAR(20),
    quantity VARCHAR(20),
    PRIMARY KEY(ID, name),
    FOREIGN KEY(ID) REFERENCES dishes(ID) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES non_seasonal_ingredients(name) ON DELETE CASCADE
);

CREATE TABLE seasonal_ingredients(
    name VARCHAR(20),
    PRIMARY KEY(name)
);

CREATE TABLE s_contains(
    ID INT,
    name VARCHAR(20),
    quantity VARCHAR(20),
    PRIMARY KEY(ID, name),
    FOREIGN KEY(ID) REFERENCES dishes(ID) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES seasonal_ingredients(name) ON DELETE CASCADE
);

CREATE TABLE season(
    name VARCHAR(10),
    PRIMARY KEY(name)
);

CREATE TABLE in_season(
    ingredient_name VARCHAR(20),
    season_name VARCHAR(10),
    PRIMARY KEY(ingredient_name, season_name),
    FOREIGN KEY(ingredient_name) REFERENCES seasonal_ingredients(name) ON DELETE CASCADE,
    FOREIGN KEY(season_name) REFERENCES season(name) ON DELETE CASCADE
);

CREATE TABLE cuisine(
    name VARCHAR(20),
    additional_info VARCHAR(2000),
    PRIMARY KEY(name)
);

CREATE TABLE belongs_cuisine(
    ID INT,
    name VARCHAR(20),
    PRIMARY KEY(ID, name),
    FOREIGN KEY(ID) REFERENCES dishes(ID) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES cuisine(name) ON DELETE CASCADE
);

CREATE TABLE type(
    name VARCHAR(20),
    PRIMARY KEY(name)
);

CREATE TABLE is_type(
    ID INT,
    name VARCHAR(20),
    PRIMARY KEY(ID, name),
    FOREIGN KEY(ID) REFERENCES dishes(ID) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES type(name) ON DELETE CASCADE
);

CREATE TABLE flavor_profile(
    name VARCHAR(20),
    PRIMARY KEY(name)
);

CREATE TABLE has_fp(
    ID INT,
    name VARCHAR(20),
    PRIMARY KEY(ID, name),
    FOREIGN KEY(ID) REFERENCES dishes(ID) ON DELETE CASCADE,
    FOREIGN KEY(name) REFERENCES flavor_profile(name) ON DELETE CASCADE
);

INSERT INTO dishes VALUES (1, 'butter chicken', 600, 15, 30, 'In a bowl, combine chicken with all of the ingredients for the chicken marinade; let marinate for 30 minutes to an hour (or overnight if time allows).\r\n Heat oil in a large skillet or pot over medium-high heat. When sizzling, add chicken pieces in batches of two or three, making sure not to crowd the pan. Fry until browned for only 3 minutes on each side. Set aside and keep warm. (You will finish cooking the chicken in the sauce.)\r\n
Heat butter or ghee in the same pan. Fry the onions until they start to sweat (about 6 minutes) while scraping up any browned bits stuck on the bottom of the pan.\r\n 
Add garlic and ginger and sauté for 1 minute until fragrant, then add ground coriander, cumin and garam masala. Let cook for about 20 seconds until fragrant, while stirring occasionally.\n]r
Add crushed tomatoes, chili powder and salt. Let simmer for about 10-15 minutes, stirring occasionally until sauce thickens and becomes a deep brown red colour.\r\n
Remove from heat, scoop mixture into a blender and blend until smooth. You may need to add a couple tablespoons of water to help it blend (up to 1/4 cup). Work in batches depending on the size of your blender.\r\n
Pour the puréed sauce back into the pan. Stir the cream, sugar and crushed kasoori methi (or fenugreek leaves) through the sauce. Add the chicken with juices back into the pan and cook for an additional 8-10 minutes until chicken is cooked through and the sauce is thick and bubbling.\r\n
Garnish with chopped cilantro and serve with fresh, hot garlic butter rice and fresh homemade Naan bread!\r\n');

INSERT INTO dishes VALUES(2,'paneer makhanwala',456,15,40,'In a deep pan add all the ingredients mentioned under “For Curry”. Bring to a boil, then cover and cook for 25mins.Turn off the heat and remove the bayleaf, black cardamom and cinnamon. Now let it cool a bit and then grind it into a fine puree, strain and keep aside. In a separate pan melt butter add ginger, green chilli add stir for a minute. Add paneer cubes and cook for another minute. Add chilli powder, stir and add the curry. Cook for 5-10 minutes and add salt. Turn off the heat and add cream and dried methi leaves powder. Stir and serve hot.\r\n');

INSERT INTO dishes VALUES(3, 'mango raita', 145, 10, 1, 'Add the mango pulp to thick yogurt. Whisk them together till the yogurt is smooth and creamy.\r\n 
Do a taste test and add sugar as needed. Add salt and mix well.\r\n
Add the mangoes to the yogurt and mix well.\r\n
In a small pan kept over medium heat, add oil. \r\n
When the oil is hot, add mustard and cumin seeds. When they start to splutter, add 5-6 curry leaves and two dried red chilies. Let it fry for about 10 seconds. Remove from heat and add the tempering to this mango raita.\r\n
Serve immediately or refrigerate for later use.\r\n');

INSERT INTO dishes VALUES(4,'pumpkin puree',50,15,20,'You can choose any amount of pumpkin you need. Peel and chop them in 1 to 1.5 inch cubes. Remove the pith and the seeds.In a pan, add the pumpkin and enough water to just cover the pumpkins.Simmer with or without lid until the pumpkins have softened and cooked well. Drain using a colander and let the cooked pumpkin cubes cool to room temperature. This will prevent steam building up in your blender, which can cause great injury!Add the cooled pumpkin cubes in a blender. Blend till smooth or chunky (whatever your preference) without adding any water. Store in the refrigerator for a week or freeze for about 2 to 3 months.\r\n');

INSERT INTO dishes VALUES(5, 'malvani fish fry', 142, 20, 20, 'Sprinkle salt, turmeric powder, 1 tsp red chilli powder on the fish pieces. Sprinkle juice of ½ lemon and rub in well. Set aside to marinate for 15 minutes. Heat 2 tbsps oil in a non stick pan. \r\n
Mix garlic paste, ginger paste 2 tsps red chilli powder and salt in a bowl. Apply this masala generously over the fish pieces. Roll them in rice flour and shake off excess flour. Place the fish pieces in the pan and shallow fry till the undersides are golden.\r\n
Flip them over and shallow fry till the other side is equally golden. Drain on absorbent paper. Serve hot garnished with a lemon slice.\r\n');

INSERT INTO dishes VALUES(6,'lychee colada',20,5,10,'Blend together 100 gm lychee, 2 tbsp sugar and 1 cup coconut milk for 3-4 minutes.Now add the puree; cup fresh cream and ice cubes as required. Blend for a few minutes. Now pour in tall glasses, serve chilled.\r\n');

INSERT INTO dishes VALUES(7, 'bruschetta',52, 15,5, 'Halve tomatoes then remove and discard the majority of the seeds. Chop tomatoes into 1/4-inch chunks then add to a medium bowl with a generous pinch of salt, a small pinch of black pepper, one tablespoon of the olive oil and the basil. Stir and let sit 10 minutes.\r\n
Meanwhile, heat a grill pan over medium heat or prepare an outdoor grill for medium heat. Drizzle bread slices with the remaining tablespoon of oil and grill 2 to 3 minutes on each side until warmed through and grill marks appear.\r\n
Rub one side of the bread while still warm with garlic — two to three strokes per bread slice should do it.\r\n
Stir the tomatoes one more time; taste then adjust with more salt or pepper as needed. Spoon a generous amount onto each bread slice. Drizzle a little of the juice remaining at the bottom of the bowl over tomatoes and enjoy.\r\n');

INSERT INTO dishes VALUES(8,'chilaquiles',174,30,30,'In a large sauté pan, coat pan generously with corn oil, (1/8 inch), heat on medium high to high. When the oil is quite hot, add the tortillas, fry until golden brown.Remove tortillas to a paper towel lined plate to soak up excess oil. Sprinkle a little salt on the tortillas.Wipe pan clean of any browned bits of tortillas.Add 2 tablespoons of oil to pan, bring to high heat again. Add the salsa and let salsa cook for several minutes. If you have a few sprigs of epazote, add them to the salsa.Add the fried tortilla quarters to the salsa. Gently turn over the pieces of tortilla until they are all well coated with salsa. Let cook for a few minutes more.Remove from heat. Serve chilaquiles with garnishes and fried eggs and beans\r\n');

INSERT INTO dishes VALUES(9, 'kimchi cold noodles', 45, 8, 12, 'Cook the somen noodles in rapidly boiling water until al dente. (Follow the directions from the package.) Drain the noodles and cool down under cold running water for about 1 minute. Stir the noodles with some tongs or your hand while its under the water. Drain the noodles well.\r\n
Put together the noodles, Kimchi (& Kimchi juice if any came out during the cutting) and bibim sauce in a large mixing bowl and mix them well with your hands. (Wear a food handling glove). Serve it in a bowl. Place the cucumber and egg on top of the noodles. Enjoy!\r\n');

INSERT INTO dishes VALUES(10,'tomato soup',30,10,20,'firstly, in a kadai heat 1 tsp butter and saute ½ onion, 2 clove garlic and 1 bay leaf.Add 3 tomato, ½ carrot chopped and ½ tsp salt.Saute for a minute or till tomatoes change colour.Add 1/2 cup water, cover and boil for 10 minutes.Boil till tomatoes turn soft and mushy.Now remove the bay leaf and cool the mixture.Blend to smooth paste without adding any water.Now sieve the tomato paste discarding the residue. Add 1/2 cup water or more adjusting consistency get the soup to a boil and add 1 tsp sugar, 1/2tsp pepper and 1/4 tsp salt.Mix well making sure all the spices are combined well.Turn off the flame and add 2 tbsp cream, mix well.\r\n');

INSERT INTO season VALUES('summer');
INSERT INTO season VALUES('winter');
INSERT INTO season VALUES('autumn');
INSERT INTO season VALUES('spring');
INSERT INTO season VALUES('monsoon');

INSERT INTO cuisine VALUES('punjabi','Punjabi cuisine is a culinary style originating in the Punjab, a region in the northern part of the Indian subcontinent, which is now divided in an Indian part to the east and a Pakistani part to the west. This cuisine has a rich tradition of many distinct and local ways of cooking');
INSERT INTO cuisine VALUES('asian','Asian cuisine includes several major regional cuisines: Central Asian, East Asian, North Asian, South Asian, Southeast Asian, and West Asian. A cuisine is a characteristic style of cooking practices and traditions,usually associated with a specific culture. Asia, being the largest and most populous continent, is home to many cultures, many of which have their own characteristic cuisine.');
INSERT INTO cuisine VALUES('western','The cuisines of Western countries are diverse, although there are common characteristics that distinguish them from those of other regions.Compared with traditional cooking of East Asia, meat is more prominent and substantial in serving size');
INSERT INTO cuisine VALUES('malvani','Malvani cuisine is the standard cuisine of the South Konkan region of Maharashtra and Goa. Although Malvani cuisine is predominantly non-vegetarian, there are many vegetarian dishes. Although it is an independent cuisine, it overlaps Maharashtrian cuisine and Goan cuisine.');
INSERT INTO cuisine VALUES('italian','Italian cuisine (Italian: Cucina italiana) is a Mediterranean cuisine consisting of the ingredients, recipes and cooking techniques developed across the Italian Peninsula since antiquity, and later spread around the world together with waves of Italian diaspora.');
INSERT INTO cuisine VALUES('korean','Korean cuisine has evolved through centuries of social and political change. Originating from ancient agricultural and nomadic traditions in Korea and southern Manchuria, Korean cuisine reflects a complex interaction of the natural environment and different cultural trends.');
INSERT INTO cuisine VALUES('mexican','Mexican cuisine consists of the cooking cuisines and traditions of the modern country of Mexico. Its roots lie in Mesoamerican cuisine. Its ingredients and methods begin with the first agricultural communities such as the Maya who domesticated maize, created the standard process of maize nixtamalization, and established their foodways.');

INSERT INTO belongs_cuisine VALUES(1,'punjabi');
INSERT INTO belongs_cuisine VALUES(2,'punjabi');
INSERT INTO belongs_cuisine VALUES(3,'asian');
INSERT INTO belongs_cuisine VALUES(4,'western');
INSERT INTO belongs_cuisine VALUES(5,'malvani');
INSERT INTO belongs_cuisine VALUES(6,'italian');
INSERT INTO belongs_cuisine VALUES(7,'italian');
INSERT INTO belongs_cuisine VALUES(8,'mexican');
INSERT INTO belongs_cuisine VALUES(9,'korean');
INSERT INTO belongs_cuisine VALUES(10,'asian');

INSERT INTO non_seasonal_ingredients VALUES('chicken');
INSERT INTO non_seasonal_ingredients VALUES('yogurt');
INSERT INTO non_seasonal_ingredients VALUES('garlic');
INSERT INTO non_seasonal_ingredients VALUES('garam masala');
INSERT INTO non_seasonal_ingredients VALUES('turmeric');
INSERT INTO non_seasonal_ingredients VALUES('ground cumin');
INSERT INTO non_seasonal_ingredients VALUES('red chili powder');
INSERT INTO non_seasonal_ingredients VALUES('olive oil');
INSERT INTO non_seasonal_ingredients VALUES('ghee');
INSERT INTO non_seasonal_ingredients VALUES('ginger');
INSERT INTO non_seasonal_ingredients VALUES('cumin');
INSERT INTO non_seasonal_ingredients VALUES('coriander');
INSERT INTO non_seasonal_ingredients VALUES('tomato');
INSERT INTO non_seasonal_ingredients VALUES('salt');
INSERT INTO non_seasonal_ingredients VALUES('heavy cream');
INSERT INTO non_seasonal_ingredients VALUES('sugar');
INSERT INTO non_seasonal_ingredients VALUES('dried fenugreek');
INSERT INTO non_seasonal_ingredients VALUES('water');
INSERT INTO non_seasonal_ingredients VALUES('butter');
INSERT INTO non_seasonal_ingredients VALUES('onion');
INSERT INTO non_seasonal_ingredients VALUES('bay leaf');
INSERT INTO non_seasonal_ingredients VALUES('cashew');
INSERT INTO non_seasonal_ingredients VALUES('cream');
INSERT INTO non_seasonal_ingredients VALUES('curry leaves');
INSERT INTO non_seasonal_ingredients VALUES('mustard seeds');
INSERT INTO non_seasonal_ingredients VALUES('cumin seeds');
INSERT INTO non_seasonal_ingredients VALUES('dried red chilies');
INSERT INTO non_seasonal_ingredients VALUES('rice flour');
INSERT INTO non_seasonal_ingredients VALUES('lemon');
INSERT INTO non_seasonal_ingredients VALUES('oil');
INSERT INTO non_seasonal_ingredients VALUES('coconut milk');
INSERT INTO non_seasonal_ingredients VALUES('ice cubes');
INSERT INTO non_seasonal_ingredients VALUES('black pepper');
INSERT INTO non_seasonal_ingredients VALUES('basil leaves');
INSERT INTO non_seasonal_ingredients VALUES('Italian Bread');
INSERT INTO non_seasonal_ingredients VALUES('corn tortillas');
INSERT INTO non_seasonal_ingredients VALUES('corn oil');
INSERT INTO non_seasonal_ingredients VALUES('salsa verde');
INSERT INTO non_seasonal_ingredients VALUES('queso fresco');
INSERT INTO non_seasonal_ingredients VALUES('creme fraiche');
INSERT INTO non_seasonal_ingredients VALUES('cilantro');
INSERT INTO non_seasonal_ingredients VALUES('avocado');
INSERT INTO non_seasonal_ingredients VALUES('aged kimchi');
INSERT INTO non_seasonal_ingredients VALUES('english cucumber');
INSERT INTO non_seasonal_ingredients VALUES('rice vinegar');
INSERT INTO non_seasonal_ingredients VALUES('honey');
INSERT INTO non_seasonal_ingredients VALUES('sesame oil');
INSERT INTO non_seasonal_ingredients VALUES('toasted sesame seeds');
INSERT INTO non_seasonal_ingredients VALUES('boiled egg');


INSERT INTO ns_contains VALUES(1, 'chicken','800g' );
INSERT INTO ns_contains VALUES(1, 'yogurt','1/2 cup' );
INSERT INTO ns_contains VALUES(1, 'garlic','3 tbsp' );
INSERT INTO ns_contains VALUES(1, 'ginger','2 tbsp' );
INSERT INTO ns_contains VALUES(1, 'garam masala','3 1/2 tsp' );
INSERT INTO ns_contains VALUES(1, 'turmeric','1tsp' );
INSERT INTO ns_contains VALUES(1, 'ground cumin','2 1/2tsp' );
INSERT INTO ns_contains VALUES(1, 'red chili powder','2 tsp' );
INSERT INTO ns_contains VALUES(1, 'salt','to taste' );
INSERT INTO ns_contains VALUES(1, 'olive oil','2 tbsp' );
INSERT INTO ns_contains VALUES(1, 'ghee','2 tbsp' );
INSERT INTO ns_contains VALUES(1, 'onion','1' );
INSERT INTO ns_contains VALUES(1, 'coriander','1tsp' );
INSERT INTO ns_contains VALUES(1, 'tomato','400g' );
INSERT INTO ns_contains VALUES(1, 'heavy cream','1 cup' );
INSERT INTO ns_contains VALUES(1, 'sugar','1 tbsp' );
INSERT INTO ns_contains VALUES(2, 'water','1/2cup' );
INSERT INTO ns_contains VALUES(2, 'butter','1 tbsp' );
INSERT INTO ns_contains VALUES(2, 'onion','1/2cup' );
INSERT INTO ns_contains VALUES(2, 'bay leaf','1' );
INSERT INTO ns_contains VALUES(2, 'cashew','12' );
INSERT INTO ns_contains VALUES(2, 'dried fenugreek','3/2 tbsp' );
INSERT INTO ns_contains VALUES(2, 'cream','4 tbsp' );
INSERT INTO ns_contains VALUES(3, 'yogurt','1 1/2 cups' );
INSERT INTO ns_contains VALUES(3, 'sugar','3 tbsp' );
INSERT INTO ns_contains VALUES(3, 'salt','1/2 tsp' );
INSERT INTO ns_contains VALUES(3, 'ghee','1 tbsp' );
INSERT INTO ns_contains VALUES(3, 'cumin seeds','1/2 tsp' );
INSERT INTO ns_contains VALUES(3, 'dried red chilies','2' );
INSERT INTO ns_contains VALUES(4, 'water','1/2cup' );
INSERT INTO ns_contains VALUES(5, 'rice flour','1/2 cups' );
INSERT INTO ns_contains VALUES(5, 'turmeric','1 tsp' );
INSERT INTO ns_contains VALUES(5, 'red chili powder','3 tsps' );
INSERT INTO ns_contains VALUES(5, 'lemon','1 1/2 wedges' );
INSERT INTO ns_contains VALUES(5, 'oil','2 tbsp' );
INSERT INTO ns_contains VALUES(5, 'garlic','1 1/2 tbsp' );
INSERT INTO ns_contains VALUES(5, 'ginger','1 1/2 tbsp' );
INSERT INTO ns_contains VALUES(5, 'salt','to taste' );
INSERT INTO ns_contains VALUES(6, 'coconut milk','1cup' );
INSERT INTO ns_contains VALUES(6, 'cream','1/2cup' );
INSERT INTO ns_contains VALUES(6, 'sugar','2 tbsp' );
INSERT INTO ns_contains VALUES(6, 'ice cubes','6' );
INSERT INTO ns_contains VALUES(7, 'tomato','3-4' );
INSERT INTO ns_contains VALUES(7, 'black pepper','to taste' );
INSERT INTO ns_contains VALUES(7, 'olive oil','2 tbsp' );
INSERT INTO ns_contains VALUES(7, 'basil leaves','6' );
INSERT INTO ns_contains VALUES(7, 'italian bread','6 slices' );
INSERT INTO ns_contains VALUES(7, 'garlic','2 cloves' );
INSERT INTO ns_contains VALUES(8,'corn tortillas','12' );
INSERT INTO ns_contains VALUES(8,'corn oil','3 tbsp' );
INSERT INTO ns_contains VALUES(8,'salsa verde','2 tbsp' );
INSERT INTO ns_contains VALUES(8,'queso fresco','10g' );
INSERT INTO ns_contains VALUES(8,'creme fraiche','100g' );
INSERT INTO ns_contains VALUES(8,'cilantro','50g' );
INSERT INTO ns_contains VALUES(8,'avocado','10' );
INSERT INTO ns_contains VALUES(9, 'english cucumber','85g' );
INSERT INTO ns_contains VALUES(9, 'boiled egg','1' );
INSERT INTO ns_contains VALUES(9, 'rice vinegar','1 tbsp' );
INSERT INTO ns_contains VALUES(9, 'honey','1 tbsp' );
INSERT INTO ns_contains VALUES(9, 'sugar','1 tbsp' );
INSERT INTO ns_contains VALUES(9, 'sesame oil','1 tbsp' );
INSERT INTO ns_contains VALUES(9, 'toasted sesame seeds','1 tbsp' );
INSERT INTO ns_contains VALUES(10,'butter','1 tbsp' );
INSERT INTO ns_contains VALUES(10,'onion','0.5' );
INSERT INTO ns_contains VALUES(10,'garlic','2' );
INSERT INTO ns_contains VALUES(10,'bay leaf','1' );
INSERT INTO ns_contains VALUES(10,'tomato','3' );
INSERT INTO ns_contains VALUES(10,'salt','1/2 tbsp' );
INSERT INTO ns_contains VALUES(10,'sugar','1 tbsp' );
INSERT INTO ns_contains VALUES(10,'water','1 cup' );
INSERT INTO ns_contains VALUES(10,'cream','2 tbsp' );

INSERT INTO seasonal_ingredients VALUES('mango');
INSERT INTO seasonal_ingredients VALUES('pumpkin');
INSERT INTO seasonal_ingredients VALUES('surmai');
INSERT INTO seasonal_ingredients VALUES('lychee');
INSERT INTO seasonal_ingredients VALUES('epazote');
INSERT INTO seasonal_ingredients VALUES('somen noodles');
INSERT INTO seasonal_ingredients VALUES('gochujang paste');
INSERT INTO seasonal_ingredients VALUES('carrot');

INSERT INTO s_contains VALUES(10,'carrot','0.5' );
INSERT INTO s_contains VALUES(9, 'somen noodles','180g' );
INSERT INTO s_contains VALUES(9, 'gochujang paste','2 tbsp' );
INSERT INTO s_contains VALUES(8,'epazote','50g' );
INSERT INTO s_contains VALUES(6, 'lychee','100g' );
INSERT INTO s_contains VALUES(5, 'surmai','5x2 inch pieces');
INSERT INTO s_contains VALUES(4, 'pumpkin','200g' );
INSERT INTO s_contains VALUES(3, 'mango','3');


INSERT INTO in_season VALUES('mango','summer');
INSERT INTO in_season VALUES('pumpkin','autumn');
INSERT INTO in_season VALUES('surmai','monsoon');
INSERT INTO in_season VALUES('lychee','summer');
INSERT INTO in_season VALUES('epazote','winter');
INSERT INTO in_season VALUES('somen noodles','spring');
INSERT INTO in_season VALUES('gochujang paste','winter');
INSERT INTO in_season VALUES('carrot','autumn');

INSERT INTO type VALUES('main course');
INSERT INTO type VALUES('appetizer');
INSERT INTO type VALUES('entree');
INSERT INTO type VALUES('breakfast');
INSERT INTO type VALUES('dessert');


INSERT INTO is_type VALUES(1, 'main course');
INSERT INTO is_type VALUES(2, 'main course');
INSERT INTO is_type VALUES(3, 'entree');
INSERT INTO is_type VALUES(4, 'appetizer');
INSERT INTO is_type VALUES(5, 'appetizer');
INSERT INTO is_type VALUES(6, 'dessert');
INSERT INTO is_type VALUES(7, 'entree');
INSERT INTO is_type VALUES(8, 'main course');
INSERT INTO is_type VALUES(9, 'main course');
INSERT INTO is_type VALUES(10, 'appetizer');

INSERT INTO flavor_profile VALUES('spicy');
INSERT INTO flavor_profile VALUES('savoury');
INSERT INTO flavor_profile VALUES('sour');
INSERT INTO flavor_profile VALUES('bland');
INSERT INTO flavor_profile VALUES('sweet');


INSERT INTO has_fp VALUES(1, 'spicy');
INSERT INTO has_fp VALUES(2, 'savoury');
INSERT INTO has_fp VALUES(3, 'sour');
INSERT INTO has_fp VALUES(4, 'bland');
INSERT INTO has_fp VALUES(5, 'spicy');
INSERT INTO has_fp VALUES(6, 'sweet');
INSERT INTO has_fp VALUES(7, 'savoury');
INSERT INTO has_fp VALUES(8, 'spicy');
INSERT INTO has_fp VALUES(9, 'spicy');
INSERT INTO has_fp VALUES(10, 'savoury');

INSERT INTO allergies VALUES('lactose');
INSERT INTO allergies VALUES('cashew');
INSERT INTO allergies VALUES('lychee');
INSERT INTO allergies VALUES('mango');
INSERT INTO allergies VALUES('peanut');
INSERT INTO allergies VALUES('tree nuts');
INSERT INTO allergies VALUES('soy');
INSERT INTO allergies VALUES('fish');
INSERT INTO allergies VALUES('coco');
INSERT INTO allergies VALUES('black pepper');
INSERT INTO allergies VALUES('eggs');
INSERT INTO allergies VALUES('shellfish');
INSERT INTO allergies VALUES('gluten');

INSERT INTO prone VALUES(3, 'lactose');
INSERT INTO prone VALUES(3, 'mango');
INSERT INTO prone VALUES(2, 'cashew');
INSERT INTO prone VALUES(6, 'lychee');
INSERT INTO prone VALUES(7, 'gluten');
INSERT INTO prone VALUES(7, 'black pepper');

