
-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!

-- Name Database spur_connect
CREATE TABLE "industry" (
    "id" SERIAL PRIMARY KEY,
    "industry_name" VARCHAR (80) NOT NULL
);

CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL
);

CREATE TABLE "profiles" (
	"id" SERIAL PRIMARY KEY,
	"email" CHARACTER VARYING (255) NOT NULL,
    "photo" VARCHAR (350),
    "industry_id" INT REFERENCES "industry" (id) ON DELETE CASCADE NOT NULL,
    "facebook" VARCHAR (255),
    "linkedin" VARCHAR (255),
    "twitter" VARCHAR (255),
    "youtube" VARCHAR (255),
    "instagram" VARCHAR (255),
    "portfolio" VARCHAR (255),
    "location_city" VARCHAR (100) NOT NULL,
    "location_zip" VARCHAR (15) NOT NULL,
    "location_state" VARCHAR (25) NOT NULL,
    "availability" BOOLEAN DEFAULT true,
    "user_id" INT REFERENCES "user" (id) ON DELETE CASCADE NOT NULL,
    "first_name" VARCHAR (40) NOT NULL,
    "last_name" VARCHAR (40) NOT NULL,
    "about_me" VARCHAR (5000)
);

CREATE TABLE "user_messages" (
    "id" SERIAL PRIMARY KEY,
    "content" VARCHAR (80) NOT NULL,
    "sender_id" INT REFERENCES "user" (id) ON DELETE CASCADE NOT NULL,
    "recipient_id" INT REFERENCES "user" (id) ON DELETE CASCADE NOT NULL,
    "timestamp" TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE "user_meetings" (
    "id" SERIAL PRIMARY KEY,
    "summary" VARCHAR (255),
    "meetup_location" VARCHAR (255) NOT NULL,
    "date" TIMESTAMP WITH TIME ZONE  NOT NULL,
    "meeting_title" VARCHAR (255) NOT NULL,
    "user_id" INT REFERENCES "user" (id) ON DELETE CASCADE NOT NULL,
    "participant_id" INTEGER NOT NULL,
    "meeting_notes" VARCHAR (1000)
);

CREATE TABLE "meeting_uploads"(
	"id" SERIAL PRIMARY KEY,
	"image_url" VARCHAR (255) NOT NULL,
	"meeting_id" INT REFERENCES "user_meetings" (id) ON DELETE CASCADE NOT NULL,
 	"image_title" VARCHAR (80) NOT NULL,
  "user_id" INT REFERENCES "user" (id) ON DELETE CASCADE
);

-- dummy users! all passwords '1234'
INSERT INTO "user" ("username", "password")
VALUES
('testuser0', '$2a$10$JElypO6zB15H59KVSsc5R.a6k8Y3PS8qlPQ29H79zUbmEjj6dAaom'),
('testUser1', '$2a$10$abmyEv9kcY3wm7CwhIQ9fu8DvwOZnAqDbLybetoHl7N5FzrfaLAPO'),
('testUser2', '$2a$10$cbD7IpSAhKbsVckG3AUh0.SloLK9aM4tIom.W1KfINd1t4p1vyrie'),
('testUser3', '$2a$10$47ix/4rxZXU5uppu2UtQfuCmB7F1oyFoKuzeOlxpvq62rWaac3C22'),
('testUser4', '$2a$10$ttWC3MHHpVYSO1npEPVcMu6G3p8d8y9Cravau9ArZ9ptMfGWzAoLO'),
('testUser5', '$2a$10$8hgUv.nEk2jo5C0ghtEBPeabN2RvwHriBsYy02WTfSq7YL2T6doMW');
('testuser0', '$2a$10$JElypO6zB15H59KVSsc5R.a6k8Y3PS8qlPQ29H79zUbmEjj6dAaom');
('testUser1', '$2a$10$abmyEv9kcY3wm7CwhIQ9fu8DvwOZnAqDbLybetoHl7N5FzrfaLAPO');
('testUser2', '$2a$10$cbD7IpSAhKbsVckG3AUh0.SloLK9aM4tIom.W1KfINd1t4p1vyrie');
('testUser3', '$2a$10$47ix/4rxZXU5uppu2UtQfuCmB7F1oyFoKuzeOlxpvq62rWaac3C22');
('testUser4', '$2a$10$ttWC3MHHpVYSO1npEPVcMu6G3p8d8y9Cravau9ArZ9ptMfGWzAoLO');
('testUser5',  '$2a$10$8hgUv.nEk2jo5C0ghtEBPeabN2RvwHriBsYy02WTfSq7YL2T6doMW');
('spuraccount1', '$2a$10$J0P0SDSiUWGQakF4uhg1jeZMuaBS/zl2IeKwTIlID4q5cNdF5FRIi');
('spuraccount2', '$2a$10$joK9ZMQ3P8.yceCz7Lowd.Ej2scsHdIMojx/55G5dfV.t0hPjm7Ei');
('spuraccount3', '$2a$10$BZUm.TtuWJTuH1wxqXEqf..GCWENl21vr2xBxx7h4LLvogkKirXdq');
('spuraccount4', '$2a$10$gn7g.vygjPagSPYXGIbcqe6EZMlq2IpUbI/bg3Ip4cjXZBajWIODq');
('spuraccount5', '$2a$10$i7T3b1XpcdWN8EEsMlzh4eOWzhDQA5rPhLiaAWhRjobKj9UC4QNqa');
('lovejazz1', '$2a$10$r/46mt1V/RL2BKCdGOo5geUkDr6fM.CHWvDYbTB4jAu6xnhfP0z36');
('lovejazz2', '$2a$10$IuAeaWvQi8Cx77F11kF7.OioogedAKbxyQiNDONSfC/ylr6../4pm');
('lovejazz3', '$2a$10$C8J/a84uCfzI9oiIzHVgBO9GG5Qh0j4m8JoQTSBVeRTWKniCfWFO2');
('lovejazz4', '$2a$10$iNl8tbNcBWhQEdKW/Ow4R.L3rOLvAPmax859MGL.sIewW4zV.6ee6');
('coffeerules1', '$2a$10$B9JOkipxHJxmXtBCKUvEkeHc1rxd5HWrRHBi1Oamamod5E8TUaFqS');
('coffeerules2', '$2a$10$GwvaI6AciqCi88o/Dxpt7e/rUr.t/CEmU5r./E7hDVb86Kpn1WC2a');
('coffeerules3', '$2a$10$rvh3lVvO7bUtcDvgWpynXeuCG0YwfTWLmElVgfnp6wXsNObxJ6UUu');
('coffeerules4', '$2a$10$zpBytjHDpn9h.nDBuN8RoedE477JBnjOEBxccdh79JgKgJru1A50y');
('coffeerules5', '$2a$10$oRyc0w4Q1S5bSbnuoDaoMuNaQ2rsfWPpMGA/gd7vrTbTl6fnGTzIm');


INSERT INTO "industry" ("industry_name") 
VALUES 
('Software Engineer'),
('Sales'),('Healthcare'),('Manufacturing'),('Finance'),('Agriculture'), ('Information Technology'),('Automobile Manufacturing'), ('Telecommunication'), ('Food Industry'), ('Cannabis Industry'), ('Online Conferencing Industry'), ('Online Dating Industry'), ('HR & Recruitment Services'), ('Real Estate'), ('Apparel Manufacturing'), ('Tourism'), ('Entertainment');

-- dummy data for user profiles, need to make users first to see these
INSERT INTO "profiles" ("first_name", "last_name","photo", "email", "industry_id", "facebook", "linkedin", "twitter", "youtube", "instagram", "portfolio", "location_city", "location_zip", "location_state", "availability","about_me", "user_id")
VALUES
('Michael', 'Huso', 'https://media-exp1.licdn.com/dms/image/C4E03AQHHh-WRQR1J6Q/profile-displayphoto-shrink_800_800/0/1639598986851?e=1649894400&v=beta&t=Ni5lrCFvVUNGebUBZ5tTFR8WOVxWoovoYw1L33kNVmA','test1@aol.com', 1, 'facebook.com/test1', 'linkedin.com/test1', 'twitter.com/test1', 'youtube.com/test1', 'instagram.com/test1', 'test1.com', 'Mounds View', 55112, 'Minnesota', true,'I like stuff and other stuff', 1),
('Vic', 'Lees','https://ca.slack-edge.com/T4402UEHM-U02ELEXFWMD-874cb075b0ca-192', 'test2@aol.com', 2, 'facebook.com/test2', 'linkedin.com/test2', 'twitter.com/test2', 'youtube.com/test2', 'instagram.com/test2', 'test2.com', 'Minneapolis', 55407, 'Minnesota', true,'I like stuff and other stuff', 2),
('Joe', 'Allen','https://media-exp1.licdn.com/dms/image/C4D03AQE1kY4-im8Mqw/profile-displayphoto-shrink_800_800/0/1604591310702?e=1649894400&v=beta&t=HtZxjMRcmDTVSjapam4vL428WjcMgfeAkQAZ-3R4Cfc', 'test3@aol.com', 3, 'facebook.com/test3', 'linkedin.com/test3', 'twitter.com/test3', 'youtube.com/test3', 'instagram.com/test3', 'test3.com', 'Minneapolis', 55407, 'Minnesota', true,'I like stuff and other stuff', 3),
('Kayla', 'Mir', 'https://media-exp1.licdn.com/dms/image/C4D03AQFc61xkYWo7Lw/profile-displayphoto-shrink_800_800/0/1635964584121?e=1649894400&v=beta&t=58YIZMFjrK-yRt7ZQTuwQp0ar2kvyWi585YpvB44IKk', 'test4@aol.com', 4, 'facebook.com/test4', 'linkedin.com/test4', 'twitter.com/test4', 'youtube.com/test4', 'instagram.com/test4', 'test4.com', 'Minneapolis', 55407, 'Minnesota', true, 'I like stuff and other stuff',4),
('Nicholas', 'Ilacqua', 'https://media-exp1.licdn.com/dms/image/D5635AQG6AQfgwoOjYA/profile-framedphoto-shrink_800_800/0/1643039736313?e=1644339600&v=beta&t=VSxU_p4WMRXPLY3qS16d5jNit1LBIKonCOJsalTY_j0', 'test5@aol.com', 5, 'facebook.com/test5', 'linkedin.com/test5', 'twitter.com/test5', 'youtube.com/test5', 'instagram.com/test5', 'test5.com', 'Minneapolis', 55407, 'Minnesota', true,'I like stuff and other stuff',  5),
('Duncan', 'Nielsen', 'https://media-exp1.licdn.com/dms/image/C5103AQFPCPSPUSF63w/profile-displayphoto-shrink_800_800/0/1516847683228?e=1648684800&v=beta&t=Md2_WFzOlbaA8s6RrDDR4MACwISNowrQJyhERp7kfL0', 'test6@aol.com', 6, 'facebook.com/test6', 'linkedin.com/test6', 'twitter.com/test6', 'youtube.com/test6', 'instagram.com/test6', 'test6.com', 'Eden Prairie', 55347, 'Minnesota', true,'I like stuff and other stuff', 6);

-- dummy data for meetings
INSERT INTO "user_meetings" ("summary", "meetup_location", "date", "meeting_title", "user_id", "participant_id")
VALUES
('Worked on files for app', 'Coffee Shop Downtown Minneapolis', '2022-02-06T12:18:26.392Z', 'Meeting w/ Vic', '1', '2'),
('Met at coffee shop about new prototype', 'Coffee Shop Downtown', '2022-02-07T15:16:26.392Z', 'Meeting w/ Joe', '1', '3'),
('Met for doc review', 'Office', '2022-02-03T22:10:26.392Z', 'Meeting w/ Kayla', '1', '4'),
('Talked about dinosaurs', 'Goldmedal Park', '2022-02-15T20:12:26.392Z', 'Meeting w/ Nicholas', '1', '5'),
('We definitely worked, definitely', 'The Mall of America', '2022-02-11T22:10:26.392Z', 'Meeting w/ Duncan', '1', '6'),
('Worked on files for app', 'Coffee Shop Downtown Minneapolis', '2022-02-06T12:18:26.392Z', 'Meeting w/ Michael', '2', '1'),
('Met at coffee shop about new prototype', 'Coffee Shop Downtown', '2022-02-07T15:16:26.392Z', 'Meeting w/ Nicholas', '2', '5'),
('Met for doc review', 'Office', '2022-02-03T22:10:26.392Z', 'Meeting w/ Duncan', '2', '6'),
('Talked about dinosaurs', 'Goldmedal Park', '2022-02-15T20:12:26.392Z', 'Meeting w/ Kayla', '2', '4'),
('We definitely worked, definitely', 'The Mall of America', '2022-02-11T22:10:26.392Z', 'Meeting w/ Joe', '2', '3'),
('Worked on files for app', 'Coffee Shop Downtown Minneapolis', '2022-02-06T12:18:26.392Z', 'Meeting w/ Michael', '3', '1'),
('Met at coffee shop about new prototype', 'Coffee Shop Downtown', '2022-02-07T15:16:26.392Z', 'Meeting w/ Nicholas', '3', '5'),
('Met for doc review', 'Office', '2022-02-03T22:10:26.392Z', 'Meeting w/ Duncan', '3', '6'),
('Talked about dinosaurs', 'Goldmedal Park', '2022-02-15T20:12:26.392Z', 'Meeting w/ Kayla', '3', '4'),
('We definitely worked, definitely', 'The Mall of America', '2022-02-11T22:10:26.392Z', 'Meeting w/ Vic', '3', '2'),
('Worked on files for app', 'Coffee Shop Downtown Minneapolis', '2022-02-06T12:18:26.392Z', 'Meeting w/ Michael', '4', '1'),
('Met at coffee shop about new prototype', 'Coffee Shop Downtown', '2022-02-07T15:16:26.392Z', 'Meeting w/ Nicholas', '4', '5'),
('Met for doc review', 'Office', '2022-02-03T22:10:26.392Z', 'Meeting w/ Duncan', '4', '6'),
('Talked about dinosaurs', 'Goldmedal Park', '2022-02-15T20:12:26.392Z', 'Meeting w/ Kayla', '4', '3'),
('We definitely worked, definitely', 'The Mall of America', '2022-02-11T22:10:26.392Z', 'Meeting w/ Vic', '4', '2'),
('Worked on files for app', 'Coffee Shop Downtown Minneapolis', '2022-02-06T12:18:26.392Z', 'Meeting w/ Michael', '5', '1'),
('Met at coffee shop about new prototype', 'Coffee Shop Downtown', '2022-02-07T15:16:26.392Z', 'Meeting w/ Kayla', '5', '4'),
('Met for doc review', 'Office', '2022-02-03T22:10:26.392Z', 'Meeting w/ Duncan', '5', '6'),
('Talked about dinosaurs', 'Goldmedal Park', '2022-02-15T20:12:26.392Z', 'Meeting w/ Kayla', '5', '3'),
('We definitely worked, definitely', 'The Mall of America', '2022-02-11T22:10:26.392Z', 'Meeting w/ Vic', '5', '2'),
('Worked on files for app', 'Coffee Shop Downtown Minneapolis', '2022-02-06T12:18:26.392Z', 'Meeting w/ Michael', '6', '1'),
('Met at coffee shop about new prototype', 'Coffee Shop Downtown', '2022-02-07T15:16:26.392Z', 'Meeting w/ Kayla', '6', '4'),
('Met for doc review', 'Office', '2022-02-03T22:10:26.392Z', 'Meeting w/ Duncan', '6', '5'),
('Talked about dinosaurs', 'Goldmedal Park', '2022-02-15T20:12:26.392Z', 'Meeting w/ Kayla', '6', '3'),
('We definitely worked, definitely', 'The Mall of America', '2022-02-11T22:10:26.392Z', 'Meeting w/ Vic', '6', '2');

-- dummy data for conversations
INSERT INTO "public"."user_messages"("content", "sender_id", "recipient_id", "timestamp") 
VALUES
('Hello!', 1, 2, '2022-01-27 02:24:04-06'),
('Oh, Hi.', 2, 1, '2022-01-27 02:24:12-06'),
('Hey stranger', 2, 3, '2022-01-27 02:24:04-06'),
('Don''t ever come to St. Louis again.', 3, 2, '2022-01-27 02:24:17-06'),
('Hello!', 1, 4, '2022-01-27 02:24:04-06'),
('Business talk only', 4, 1, '2022-01-27 02:25:15-06'),
('Cool', 1, 5, '2022-01-27 02:24:04-06'),
('What''s cool? Weird way to start a conversation.', 5, 1, '2022-01-27 02:24:41-06'),
('Dummy message', 1, 6, '2022-01-27 02:24:04-06'),
('Uh.. Rude?', 6, 1, '2022-01-27 02:24:17-06'),
('GIT CONVERSATION INIT', 2, 4, '2022-01-27 02:24:04-06'),
('NPM INSTALL JOKE LULZ', 4, 2, '2022-01-27 02:24:55-06'),
('Up late, St Louis is cold.', 2, 5, '2022-01-27 02:24:04-06'),
('Try minneapolis, dang.', 5, 2, '2022-01-27 02:24:59-06'),
('Let''s talk business ideas.', 2, 6, '2022-01-27 02:24:04-06'),
('Okay, livestream gluten free bread cooking app?', 6, 2, '2022-01-27 02:26:22-06'),
('You try coming up with a bunch of overtures', 3, 4, '2022-01-27 02:24:04-06'),
('I just say ''no, u''', 4, 3, '2022-01-27 02:26:04-06'),
('Simultaneous friend messaging', 3, 5, '2022-01-27 02:24:04-06'),
('Simultaneous friend becoming ', 5, 3, '2022-01-27 02:24:16-06'),
('Quantum message sending', 3, 6, '2022-01-27 02:24:04-06'),
('Quantum message sending', 6, 3, '2022-01-27 02:24:15-06'),
('Quantum message sending', 4, 5, '2022-01-27 02:24:04-06'),
('Quantum message sending', 5, 4, '2022-01-27 02:24:15-06'),
('Quantum message sending', 4, 6, '2022-01-27 02:24:04-06'),
('Quantum message sending', 6, 4, '2022-01-27 02:24:15-06'),
('Quantum message sending', 5, 6, '2022-01-27 02:24:04-06'),
('Quantum message sending', 6, 5, '2022-01-27 02:24:15-06');