DROP TABLE IF EXISTS peeps;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email_address text,
  password text
  bio text,
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time_of_posting timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

INSERT INTO users (name, username, email_address, password, bio) VALUES
('Emma Johnson', 'MarketingMaven', 'SparkleLioness1234@gmail.com', 'ZnG3q', 'Always searching for the perfect slice of pizza.'),
('Ethan Hernandez', 'TechieTiger', 'NeonUnicorn12@yahoo.com', 'Lk8$2', 'Lover of all things vintage and retro.'),
('Daniel Anderson', 'SocialMediaGuru', 'ElectricPenguin77@outlook.com', 'Vt9@p', 'Personal growth and development are essential. I''m always seeking new opportunities to learn and grow.'),
('Steve Williams', 'AdventureAddict', 'techsavvy87@gmail.com','qwezr', 'Certified couch potato and Netflix addict.'),
('Ben J Smith', 'ChefChampion', 'musiclover23@yahoo.com','plmko', 'Always hungry, never satisfied. Lover of snacks and naps.'),
('Melissa Thompson', 'FitnessFreak', 'fitnessjunkie99@outlook.com','yhnji', 'Sustainability and environmentalism are key to our future. Let''s work together to protect our planet.'),
('Anthony N Harris', 'BikeBuddy', 'travelenthusiast13@live.com','gfdsa', 'Adventure is my middle name! Whether hiking, diving, or strolling through cities, I''m always seeking new experiences. And a good cup of coffee is a must'),
('Laura Davis', 'CoffeeCrazy', 'fashionista82@icloud.com','vbhnm', 'Just a girl trying to make sense of the world.'),
('Sarah Johnson','PixelPirate', 'gamerfanatic45@protonmail.com','xdrfv', 'I put the "pro" in procrastination.'),
('Jenn Martinez', 'ZombieTweeter', 'brainsnack@hotmail.com','lkjhg', 'I''m a zombie with a taste for brains and a passion for dance. When I''m not stumbling around looking for my next meal, you can find me getting down to some sick beats in the graveyard. Watch out, I might just bite you with my killer moves.');

INSERT INTO peeps (content, time_of_posting, user_id) VALUES
('We will never forget the impact of #TheEvent and the changes it brought to the world! Who else is ready for summer?! #summervibes', NOW() - INTERVAL '1 year', 7),
('Wow - this new tech is going to revolutionize the way we work and play', NOW() - INTERVAL '1 year', 6),
('Order corn', NOW() - INTERVAL '300 days', 7),
('got a new puppy! Shes soooo cute! #puppylove', NOW() - INTERVAL '5 days', 8),
('Just took a walk in the park. So peaceful.', NOW() - INTERVAL '6 hours', 1),
('Going out for a coffee with some friends later. Cant wait!', NOW() - INTERVAL '2 hours', 10),
('Just heard a loud noise - Im not sure what it was but Im getting out of here!', NOW() - INTERVAL '100 minutes', 8),
('Hey guys I am so excited to be here! Cant wait to start my new job!', NOW() - INTERVAL '50 minutes', 5),
('Just had a delicious lunch. Yum!', NOW() - INTERVAL '27 minutes', 10),
('Had a great time catching up with an old friend, yum! #zombielife', NOW() - INTERVAL '19 minutes', 10),
('I love rx. Hes basically the kawaii version of me.', NOW() - INTERVAL '18 minutes', 4),
('Has anyone else noticed the strange creatures lurking around here?', NOW() - INTERVAL '15 minutes', 3),
('Why is it still night time?', NOW() - INTERVAL '10 minutes', 2),
('We are here to build products, not portfolios', NOW() - INTERVAL '7 minutes', 5),
('just found out my parents have been lying about being dead for 22 years. i still love you mom and dad.', NOW() - INTERVAL '3 minutes', 6),
('Sometimes you just need a good hug! #zombielife', NOW() - INTERVAL '50 seconds', 10),
('got an amazing new haircut and Im feelin sooo good!', NOW() - INTERVAL '45 seconds', 2),
('Its been 10 years since #TheEvent - so much has changed since then!', NOW() - INTERVAL '10 seconds', 9),
('Just finished a great workout! #sweatyselfie', NOW(), 1);
