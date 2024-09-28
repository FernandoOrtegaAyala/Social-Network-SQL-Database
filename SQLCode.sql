SHOW DATABASES;

-- Creación de la DB
CREATE DATABASE red_social;

-- Utilizacion de la DB actual
USE red_social;

-- Verificacion de las tablas en la DB
SHOW TABLES;

-- Creación de la tabla usuarios
CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_usuario VARCHAR(30) NOT NULL UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	apellidos VARCHAR(55) NOT NULL,
	es_administrador TINYINT(1) DEFAULT 0,
	fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
	email VARCHAR(45) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	avatar VARCHAR(255),
	bio VARCHAR(150) DEFAULT "Sin biografía",
	genero ENUM ("Masculino", "Femenino", "Prefiero no especificar", "No binario", "Otro"),
	cumpleanos DATE,
	id_pais INT,
	FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

-- Insertar datos de prueba en usuarios
INSERT INTO usuarios (nombre_usuario, nombre, apellidos, es_administrador, fecha_registro, email, password, avatar,
	bio, genero, cumpleanos, id_pais)
	VALUES
	("usuario_administrador", "nombredeprueba" , "apellidodeprueba", 1, "2022-07-18 08:23:45", "administrador35771@correo.com", "admin25229100117575701", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Hola, mundo!", "Masculino", "2001-04-24", 1),
	("usuario_prueba1", "nombredeprueba" , "apellidodeprueba", 0, "2022-05-10 04:21:55", "usuario241@correo.com", "prueba2514144418", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Sin bio por el momento", "Femenino", "2011-05-22", 2),
	("usuario_prueba2", "nombredeprueba" , "apellidodeprueba", 0, "2022-02-11 03:00:00", "usuario752@correo.com", "prueba21213554342", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Nuevo aquí!", "No binario", "2002-04-22", 10),
	("usuario_prueba3", "nombredeprueba" , "apellidodeprueba", 0, "2022-01-14 04:20:00", "usuario673@correo.com", "prueba200277227910", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Saludos!", "Otro", "2000-01-11", 4),
	("usuario_prueba4", "nombredeprueba" , "apellidodeprueba", 0, "2022-04-17 03:21:10", "usuario4874@correo.com", "prueba00118577575465", "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=826&t=st=1700959317~exp=1700959917~hmac=2611e21dddab6ee5d612b4a62bfc5108b1526c3f58be3878462ac143def5c149",
	"Un gusto!", "Prefiero no especificar", "2001-04-24", 1);

-- Verificación de los datos de prueba en usuarios
SELECT *
FROM usuarios;

-- Creación de la tabla paises
CREATE TABLE paises (
	id_pais INT AUTO_INCREMENT PRIMARY KEY,
	nombre_pais VARCHAR(45) NOT NULL
);

-- Insertar datos de prueba en paises
INSERT INTO paises (nombre_pais) 
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

-- Verificación de los datos de prueba en paises
SELECT *
FROM paises;

-- Creación de la tabla seguidores
CREATE TABLE seguidores (
	id_seguidor INT AUTO_INCREMENT PRIMARY KEY,
	fecha_seguimiento DATETIME DEFAULT CURRENT_TIMESTAMP,
	id_usuario_seguidor INT, 
	id_usuario_seguido INT,
	FOREIGN KEY (id_usuario_seguidor) REFERENCES usuarios(id_usuario),
	FOREIGN KEY (id_usuario_seguido) REFERENCES usuarios(id_usuario)
);

-- Insertar datos de prueba en seguidores
INSERT INTO seguidores (fecha_seguimiento, id_usuario_seguidor, id_usuario_seguido)
	VALUES
	("2023-11-29 14:30:00", 2, 1),
	("2023-06-22 15:23:00", 3, 1),
	("2023-07-22 16:20:00", 4, 1),
	("2023-07-22 17:20:00", 1, 3),
	("2023-08-22 18:00:00", 2, 3),
	("2023-05-22 19:01:12", 4, 3);

-- Verificación de los datos de prueba en seguidores
SELECT *
FROM seguidores;

-- Creación de la tabla posts
CREATE TABLE posts (
	id_post INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT,
	fecha_pubicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
	texto TEXT,
	imagen1_url VARCHAR(255),
	imagen2_url VARCHAR(255),
	imagen3_url VARCHAR(255),
	imagen4_url VARCHAR(255),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


-- Insertar datos de prueba en posts
INSERT INTO posts (id_usuario, fecha_pubicacion, texto, imagen1_url, imagen2_url, imagen3_url)
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

-- Verificación de los datos de prueba en post
SELECT *
FROM posts;

-- Creación de la tabla likes
CREATE TABLE likes(
	id_like INT AUTO_INCREMENT PRIMARY KEY,
	id_post INT,
	id_usuario INT,
	fecha_like DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
	FOREIGN KEY (id_post) REFERENCES posts(id_post)
);

-- Insertar datos de prueba en likes
INSERT INTO likes (id_post, id_usuario, fecha_like)
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

-- Verificación de los datos de prueba en likes
SELECT *
FROM likes;

-- Creación de la tabla comentarios
CREATE TABLE comentarios(
	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
	id_post INT,
	id_usuario INT,
	fecha_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
	texto TEXT NOT NULL,
	imagen_url VARCHAR(255),
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
	FOREIGN KEY (id_post) REFERENCES posts(id_post)
);


-- Insertar datos de prueba en comentarios
INSERT INTO comentarios (id_post, id_usuario, fecha_comentario, texto, imagen_url)
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


-- Verificación de los datos de prueba en comentarios
SELECT *
FROM comentarios;

INSERT INTO comentarios (id_post, id_usuario, texto)
VALUES (16, 42 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ullamcorper ligula eget augue cursus, vitae posuere dolor vestibulum. Pellentesque pretium sem arcu, quis laoreet tellus dignissim sit amet. Phasellus imperdiet malesuada vestibulum. Vestibulum ac ex non enim fringilla venenatis ut ut mi. Curabitur a turpis eu massa aliquam consequat quis sed velit. Suspendisse posuere risus quis purus feugiat vehicula. Sed fringilla tortor mi, eget mollis felis pellentesque sed. Suspendisse aliquet arcu faucibus sapien vulputate placerat.

Nunc sed nulla sem. Phasellus aliquet lobortis mi vel pretium. Nullam vestibulum neque eu pellentesque porttitor. Curabitur vel nulla in ante convallis volutpat eget sollicitudin felis. Praesent metus dolor, malesuada feugiat molestie sit amet, lobortis eu neque. Proin convallis metus interdum, maximus lorem in, convallis lorem. Ut nec mi nibh. Vestibulum eros risus, malesuada malesuada ultricies eget, consequat quis purus. In eget lacus feugiat, feugiat leo ut, auctor mi. Nulla facilisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec congue augue vel dolor dapibus pretium. Curabitur tellus erat, dapibus interdum risus quis, feugiat blandit tellus. Aliquam dapibus arcu eu neque cursus, vel lobortis odio dignissim.

Etiam vitae condimentum felis. Nullam nunc dolor, pretium vitae aliquam non, cursus ut mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin dignissim velit ac nunc congue, eget dictum neque tincidunt. Proin eget neque nec mi euismod elementum a in sapien. Nulla laoreet lorem eget libero sagittis rhoncus. Sed dignissim congue gravida. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi at mi ac mi maximus rutrum et vitae nibh. Fusce non elit velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi cursus gravida congue. Vivamus ullamcorper nisi leo, vel suscipit velit feugiat nec. Curabitur feugiat quam eget dui elementum imperdiet.")
	
-- Consulta de todos los comentarios de un post
SELECT c.fecha_comentario, c.id_usuario, c.texto, c.imagen_url
FROM comentarios AS c
INNER JOIN posts AS p ON p.id_usuario = c.id_usuario
WHERE p.id_usuario = 1;

-- Consulta de todos los likes de un post
SELECT l.id_like, l.id_usuario, l.fecha_like 
FROM likes AS l
INNER JOIN posts AS p ON p.id_post = l.id_post 
WHERE p.id_post = 1;

-- Consulta del número total de comentarios y likes de un post utilizando subconsultas
SELECT p.id_post, 
    (SELECT COUNT(*) FROM comentarios AS c WHERE C.id_post = p.id_post) AS total_comentarios,
    (SELECT COUNT(*) FROM likes AS l WHERE l.id_post = p.id_post) AS total_likes
FROM posts AS p
WHERE p.id_post = 1;

-- Consulta del contenido de todos los comentarios y todos los likes de un post
SELECT fecha_like, id_usuario, id_like, NULL AS columna
FROM likes
WHERE id_post = 2
UNION ALL
SELECT fecha_comentario, id_usuario, texto, imagen_url
FROM comentarios
WHERE id_post = 2;
