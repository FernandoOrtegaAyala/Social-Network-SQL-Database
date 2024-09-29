-- DB Verification
SHOW DATABASES;

-- DB creation
CREATE DATABASE social_network;

-- Use of the current DB
USE social_network;

-- Verification of tables in the DB
SHOW TABLES;

-- Creating the countries table
CREATE TABLE countries (
	id_country INT AUTO_INCREMENT PRIMARY KEY,
	country_name VARCHAR(45) NOT NULL
);

-- Insert test data into countries
INSERT INTO countries (country_name) 
	VALUES
	("Argentina"),
	("Australia"),
	("Brasil"),
	("Canadá"),
	("China"),
	("Colombia"),
	("Egipto"),
	("España"),
	("Estados Unidos"),
	("Francia"),
	("Alemania"),
	("India"),
	("Indonesia"),
	("Italia"),
	("Japón"),
	("México"),
	("Nigeria"),
	("Países Bajos"),
	("Pakistán"),
	("Perú"),
	("Filipinas"),
	("Polonia"),
	("Portugal"),
	("Rusia"),
	("Arabia Saudita"),
	("Sudáfrica"),
	("Corea del Sur"),
	("Suecia"),
	("Suiza"),
	("Turquía"),
	("Reino Unido"),
	("Vietnam");

-- Verification of test data in countries
SELECT *
FROM countries;

-- Creation of the users table
CREATE TABLE users (
	id_user INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(30) NOT NULL UNIQUE,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(55) NOT NULL,
	is_administrator TINYINT(1) DEFAULT 0,
	registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	email VARCHAR(45) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	avatar VARCHAR(255),
	bio VARCHAR(150) DEFAULT "No bio",
	gender ENUM ("Male", "Female", "I prefer not to specify", "Nonbinary", "Other"),
	birthday  DATE,
	id_country INT,
	FOREIGN KEY (id_country) REFERENCES countries(id_country)
);

-- Insert test data into users
INSERT INTO users (username, first_name, last_name, is_administrator, registration_date, email, password, avatar,
	bio, gender, birthday , id_country)
	VALUES
	("usuario_administrador", "first_namedeprueba" , "apellidodeprueba", 1, "2022-07-18 08:23:45", "administrador318577@correo.com", "admin252525522910", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Hola, mundo!", "Male", "2001-04-24", 1),
	("usuario_prueba1", "first_namedeprueba" , "apellidodeprueba", 0, "2022-05-10 04:21:55", "usuario17827@correo.com", "prueba252524148", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Sin bio por el momento", "Female", "2011-05-22", 2),
	("usuario_prueba2", "first_namedeprueba" , "apellidodeprueba", 0, "2022-02-11 03:00:00", "usuario28@correo.com", "prueba214242212", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Nuevo aquí!", "Nonbinary", "2002-04-22", 10),
	("usuario_prueba3", "first_namedeprueba" , "apellidodeprueba", 0, "2022-01-14 04:20:00", "usuario363@correo.com", "prueba2002252910", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Saludos!", "Other", "2000-01-11", 4),
	("usuario_prueba4", "first_namedeprueba" , "apellidodeprueba", 0, "2022-04-17 03:21:10", "usuario25524@correo.com", "prueba0025255211465", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Un gusto!", "I prefer not to specify", "2001-04-24", 1);

-- Verifying test data in users
SELECT *
FROM users;

-- Creation of the followers table
CREATE TABLE followers (
	id_follower INT AUTO_INCREMENT PRIMARY KEY,
	follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_user_follower INT, 
	id_user_followed INT,
	FOREIGN KEY (id_user_follower) REFERENCES users(id_user),
	FOREIGN KEY (id_user_followed) REFERENCES users(id_user)
);

-- Insert test data in followers
INSERT INTO followers (follow_date, id_user_follower, id_user_followed)
	VALUES
	("2023-11-29 14:30:00", 2, 1),
	("2023-06-22 15:23:00", 3, 1),
	("2023-07-22 16:20:00", 4, 1),
	("2023-07-22 17:20:00", 1, 3),
	("2023-08-22 18:00:00", 2, 3),
	("2023-05-22 19:01:12", 4, 3);

-- Verification of test data in followers
SELECT *
FROM followers;

-- Creating the posts table
CREATE TABLE posts (
	id_post INT AUTO_INCREMENT PRIMARY KEY,
	id_user INT,
	post_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	text TEXT,
	image1_url VARCHAR(255),
	image2_url VARCHAR(255),
	image3_url VARCHAR(255),
	image4_url VARCHAR(255),
	FOREIGN KEY (id_user) REFERENCES users(id_user)
);


-- Insert test data into posts
INSERT INTO posts (id_user, post_date, text, image1_url, image2_url, image3_url)
	VALUES
	(1, "2023-11-29 14:20:00", "Post 1 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
	Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
	veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea consequat.",
	"https://img.freepik.com/free-photo/group-people-dancing-disco_23-2147717095.jpg?w=826&t=st=1701308326~exp=1701308926~hmac=3e1aaaf9074f75fc2926be350470aed5f2cc15db08aefe9ee7ceea5339cae4b9",
	"https://img.freepik.com/free-photo/low-angle-view-young-woman-eating-salad-with-her-eyes-closed-while-using-computer-night-home_637285-4361.jpg?w=1380&t=st=1701308390~exp=1701308990~hmac=f1f0180244159457415d93c8debdb9228128c49aab493f94424d1d77e34a6305",
	"https://img.freepik.com/free-photo/vertical-shot-palm-trees-sandy-beach_181624-49124.jpg?w=740&t=st=1701308439~exp=1701309039~hmac=d0ad8e600b1e22e3af844e150e846dd9291aac1e8097807acf2edb7b246ee509"),
	(2, "2023-10-28 11:18:10", "Post 2 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
	Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
	veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea consequat.",
	"https://img.freepik.com/free-photo/young-beautiful-girl-posing-beach-ocean-waves-bright-sun-tanned-skin_1296-794.jpg?w=1380&t=st=1701308529~exp=1701309129~hmac=cdc7d871408e2d87aa522de7e999afa4d8c2f9b383482a9355772f6190eae759",
	"https://img.freepik.com/free-photo/breathtaking-view-snowy-mountains-cloudy-sky-patagonia-chile_181624-9696.jpg?w=1380&t=st=1701308688~exp=1701309288~hmac=508662cde97400b16003f42fd923373f3874a3f58a7365ba2e55aeffd50ad25b",
	"https://img.freepik.com/free-photo/one-person-hiking-mountain-peak-admiring-milky-way-galaxy-generated-by-ai_24640-93611.jpg?t=st=1701307529~exp=1701311129~hmac=3fe41004ac94f8203718ce54a28d930237c6fe255b69b274f2658906cf88014e&w=1380"),
	(3, "2023-10-10 15:19:14", "Post 3 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
	Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
	veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea consequat.",
	"https://img.freepik.com/free-photo/side-view-mushroom-frying-with-salt-fire-human-hand-pan_176474-3146.jpg?w=826&t=st=1701308859~exp=1701309459~hmac=c6b7a49af7723e6af425abfbf210c3ac91bed7c8b92448bd28fd4f7936ea48ac",
	"https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg?w=1380&t=st=1701308934~exp=1701309534~hmac=c4d2ad98217d28d9d577c5f4082b3684c028275c6874dff80143b4d387b4d82a",
	"https://img.freepik.com/free-photo/people-working-out-indoors-together-with-dumbbells_23-2149175410.jpg?w=1380&t=st=1701309038~exp=1701309638~hmac=70fc097272af75a6aafa6c47e038721ff761761bed1bbb91be26a203cf9c3902"),
	(4, "2023-08-24 10:18:28", "Post 4 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
	Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
	veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea consequat.",
	"https://img.freepik.com/free-photo/man-watching-movie-theater-seats-spectacle-generative-ai_188544-7929.jpg?w=826&t=st=1701309118~exp=1701309718~hmac=ee22be2d613cbc2b1f2fe3ee922b2a2cc922adf0f67f7c1a3acf2cec4d1cea1c",
	"https://img.freepik.com/free-photo/front-view-man-playing-guitar_23-2149849435.jpg?w=1380&t=st=1701309152~exp=1701309752~hmac=3eabe367a5f6b482545a0ed4999de225920508eaa2c3c30a33584057e5ea82c7",
	"https://as2.ftcdn.net/v2/jpg/06/26/23/51/1000_F_626235178_rgHy65xxVnnOMTV9JiDoNljmUW2xuqPJ.jpg"),
	(5, "2023-09-22 09:10:20", "Post 5 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
	Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
	veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea consequat.",
	"https://img.freepik.com/free-photo/handsome-man-kissing-beautiful-woman_23-2148363622.jpg?w=1380&t=st=1701309282~exp=1701309882~hmac=ea848eb6b0669fd313b16fce2e1ac1d0b37a98befb3033e8fcd4f60c89dec434",
	"https://img.freepik.com/free-vector/cute-valentine-s-day-animal-couple_23-2148811376.jpg?w=826&t=st=1701309302~exp=1701309902~hmac=ae43d24853619cc9e7224b8c1519bdfd48a1de5ba8f0b8c229dd6a6990295c55",
	"https://img.freepik.com/free-photo/young-asian-couple-watching-sunset-near-beach-sweet-couple-happy-relax-enjoy-love-romantic-moment_7861-1718.jpg?w=1380&t=st=1701309381~exp=1701309981~hmac=8977f95ceb5abdf27fb614f7058d60a7a17464caf18dcd2785f577e6f2bdad5d");

-- Verification of test data in post
SELECT *
FROM posts;

-- Creation of the likes table
CREATE TABLE likes(
	id_like INT AUTO_INCREMENT PRIMARY KEY,
	id_post INT,
	id_user INT,
	like_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_post) REFERENCES posts(id_post)
);

-- Insert test data into likes
INSERT INTO likes (id_post, id_user, like_date)
	VALUES
	(1, 2, "2023-11-29 14:20:00"),
	(1, 3, "2023-11-28 13:20:00"),
	(1, 4, "2023-11-27 12:20:00"),
	(1, 5, "2023-11-26 11:20:00"),
	(2, 1, "2023-10-29 11:20:00"),
	(2, 3, "2023-10-29 12:20:00"),
	(2, 4, "2023-10-29 13:20:00"),
	(2, 5, "2023-10-29 14:20:00"),
	(3, 1, "2023-11-28 10:20:00"),
	(3, 2, "2023-11-24 11:20:00"),
	(3, 4, "2023-11-26 12:20:00");

-- Verification of test data in likes
SELECT *
FROM likes;

-- Creating the comments table
CREATE TABLE comments(
	id_comment INT AUTO_INCREMENT PRIMARY KEY,
	id_post INT,
	id_user INT,
	comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	text TEXT NOT NULL,
	image_url VARCHAR(255),
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_post) REFERENCES posts(id_post)
);


-- Insert test data in comments
INSERT INTO comments (id_post, id_user, comment_date, text, image_url)
	VALUES
	(1, 1, "2022-10-29 15:20:00", "Comentario 1 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://img.freepik.com/free-photo/night-sky-glows-with-iridescent-deep-space-generative-ai_188544-11285.jpg?w=1380&t=st=1701737505~exp=1701738105~hmac=ccb4563d7e295383bb93424562f54434f56f186f60e8c419327ad583e776976e"),
	(1, 2, "2023-11-30 16:20:00", "Comentario 2 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://img.freepik.com/free-photo/3d-abstract-wave-pattern-background_53876-104422.jpg?w=1380&t=st=1701737815~exp=1701738415~hmac=89a18aa244799b1306e247ab3dd4ad55430ce30aa6797fb9d135601f3125990d"),
	(1, 3, "2020-12-30 17:20:00", "Comentario 3 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://img.freepik.com/free-photo/dark-floral-seamless-pattern-luxury-wallpaper-vintage-texture-generative-ai_8829-2871.jpg?w=740&t=st=1701737870~exp=1701738470~hmac=6dd0e7be2bcfe4822db6353f36d7edf5409da605b2ab14c38c4f7cd8f45cbaa0"),
	(2, 3, "2021-12-29 18:10:00", "Comentario 4 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://img.freepik.com/free-vector/five-stars-rating-button-experience-reviews_8829-2624.jpg?w=1380&t=st=1701737932~exp=1701738532~hmac=544b19e1a53f7d2ef70b74d81f2b674c9dc43886c0e21c772a97c2ee67727295"),
	(2, 4, "2022-11-29 18:20:00", "Comentario 5 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://www.shutterstock.com/shutterstock/photos/1469197604/display_1500/stock-photo-fixed-word-from-wooden-blocks-with-letters-fixed-interest-rates-or-costs-concept-random-1469197604.jpg"),
	(3, 5, "2020-10-19 10:20:00", "Comentario 6 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://img.freepik.com/free-photo/delicious-cookies-arrangement_23-2150684170.jpg?t=st=1701738103~exp=1701741703~hmac=e9932eaafcf6fc2dd472b3893f324dbe4b97e87a4c85e00af37cd4a0799e70df&w=740"),
	(4, 1, "2019-11-22 15:20:00", "Comentario 7 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://img.freepik.com/free-photo/person-holding-heart-shaped-object_23-2150703670.jpg?t=st=1701738170~exp=1701741770~hmac=437d85b2eec802e449613739813df5679b74f8ab5aa2c10d97ad84d488a8001a&w=740"),
	(5, 4, "2018-12-17 4:20:00", "Comentario 8 de prueba. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
	"https://as2.ftcdn.net/v2/jpg/06/72/04/95/1000_F_672049577_Q7dCnGgELZOtelXXiGavcnusHvTpC21U.jpg");


-- Verifying test data in comments
SELECT *
FROM comments;
	
-- Consultation of all the comments of a post
SELECT c.comment_date, c.id_user, c.text, c.image_url
FROM comments AS c
INNER JOIN posts AS p ON p.id_user = c.id_user
WHERE p.id_user = 1;

-- Check all the likes of a post
SELECT l.id_like, l.id_user, l.like_date 
FROM likes AS l
INNER JOIN posts AS p ON p.id_post = l.id_post 
WHERE p.id_post = 1;

-- Query the total number of comments and likes of a post using subqueries
SELECT p.id_post, 
    (SELECT COUNT(*) FROM comments AS c WHERE C.id_post = p.id_post) AS total_comments,
    (SELECT COUNT(*) FROM likes AS l WHERE l.id_post = p.id_post) AS total_likes
FROM posts AS p
WHERE p.id_post = 1;

-- Consultation of the content of all the comments and all the likes of a post
SELECT like_date, id_user, id_like, NULL AS columna
FROM likes
WHERE id_post = 2
UNION ALL
SELECT comment_date, id_user, text, image_url
FROM comments
WHERE id_post = 2;
