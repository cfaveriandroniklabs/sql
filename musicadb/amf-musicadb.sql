-- cria o banco de dados mymusicdb
create database musicadb;

drop table if exists bandas cascade;
drop table if exists albuns cascade;
drop table if exists musicas cascade; 
drop table if exists playlists cascade; 
drop table if exists playlists_musicas cascade; 

-- cria tabela
create table bandas (
	banda_id serial4 not null,
	nome varchar(255) not null,
	ano_criacao int2 not null,
	genero varchar(255) default 'Nenhum',
	primary key (banda_id)
);

-- cria tabela album
create table albuns (
	album_id int4 not null,
	nome varchar(255) not null,
	ano_lancamento int2 not null,
	banda_id int4,
	primary key (album_id),
    foreign key (banda_id) references bandas(banda_id)
-- CONSTRAINT album_pkey PRIMARY KEY (album_id)
);

-- cria tabela musica
create table musicas (
	musica_id int4 not null,
	nome varchar(255) not null,
	album_id int4,
	primary key (musica_id),
    foreign key (album_id) references albuns(album_id)
);

-- cria tabela playlists
create table playlists (
	playlist_id int4 not null,
	nome varchar(255) not null,
	primary key (playlist_id)
);

-- cria tabela playlist_musica
create table playlists_musicas (
	playlist_id int4 not null,
	musica_id int4 not null,
	primary key (playlist_id, musica_id),
	foreign key (musica_id) references musicas(musica_id),
	foreign key (playlist_id) references playlists(playlist_id)
);

-- Insere dados na tabela bandas
insert into bandas (banda_id, nome, ano_criacao, genero) values (1,'Black Sabbath',1968,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (2,'Judas Priest',1969,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (3,'Iron Maiden',1975,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (4,'Motorhead',1975,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (5,'Exodus',1979,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (6,'Venom',1979,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (7,'Metallica',1981,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (8,'Slayer',1981,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (9,'Anthrax',1981,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (10,'Pantera',1981,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (11,'Sodom',1981,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (12,'Dio',1982,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (13,'Kreator',1982,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (14,'Megadeth',1983,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (15,'Testament',1983,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (16,'Sepultura',1984,'Heavy Metal');
insert into bandas (banda_id, nome, ano_criacao, genero) values (17,'Ira',1981,'Rock Nacional');
insert into bandas (banda_id, nome, ano_criacao, genero) values (18,'Titãs',1982,'Rock Nacional');
insert into bandas (banda_id, nome, ano_criacao, genero) values (19,'Legião Urbana',1982,'Rock Nacional');
insert into bandas (banda_id, nome, ano_criacao, genero) values (20,'Barão Vermelho',1981,'Rock Nacional');
insert into bandas (banda_id, nome, ano_criacao, genero) values (21,'Biquini Cavadão',1983,'Rock Nacional');
insert into bandas (banda_id, nome, ano_criacao, genero) values (22,'Os Cascavelletes',1987,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (23,'Engenheiros do Hawaii',1985,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (24,'Nenhum de Nós',1986,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (25,'Tequila Baby',1994,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (26,'Cachorro Grande',1999,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (27,'Graforréia Xilarmônica',1987,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (28,'Bidê ou Balde',1998,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (29,'Vera Loca',2002,'Rock Gaúcho');
insert into bandas (banda_id, nome, ano_criacao, genero) values (30,'Rosa Tatooada',1988,'Rock Gaúcho');

-- insere dados na tabela albuns
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (1,'Black Sabbath',1970,1);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (2,'Paranoid',1970,1);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (3,'British Steel',1980,2);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (4,'Painkiller',1990,2);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (5,'The Number of the Beast',1982,3);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (6,'Powerslave',1984,3);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (7,'Ace of Spades',1980,4);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (8,'Overkill',1979,4);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (9,'Bonded by Blood',1985,5);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (10,'Fabulous Disaster',1989,5);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (11,'Welcome to Hell',1981,6);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (12,'Black Metal',1982,6);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (13,'Master of Puppets',1986,7);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (14,'Ride the Lightning',1984,7);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (15,'Reign in Blood',1986,8);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (16,'South of Heaven',1988,8);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (17,'Among the Living',1987,9);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (18,'Spreading the Disease',1985,9);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (19,'Cowboys from Hell',1990,10);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (20,'Vulgar Display of Power',1992,10);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (21,'Agent Orange',1989,11);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (22,'Persecution Mania',1987,11);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (23,'Holy Diver',1983,12);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (24,'The Last in Line',1984,12);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (25,'Pleasure to Kill',1986,13);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (26,'Coma of Souls',1990,13);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (27,'Rust in Peace',1990,14);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (28,'Peace Sells... but Who''s Buying?',1986,14);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (29,'The Legacy',1987,15);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (30,'Practice What You Preach',1989,15);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (31,'Arise',1991,16);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (32,'Chaos A.D.',1993,16);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (33,'Mudança de Comportamento',1985,17);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (34,'Vivendo e Não Aprendendo',1986,17);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (35,'Cabeça Dinossauro',1986,18);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (36,'Televisão',1985,18);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (37,'Legião Urbana',1985,19);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (38,'Dois',1986,19);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (39,'Barão Vermelho',1982,20);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (40,'Maior Abandonado',1984,20);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (41,'Cidades em Torrente',1986,21);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (42,'A Era da Incerteza',1987,21);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (43,'Os Cascavelletes',1989,22);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (44,'O Futuro é Vortex',1986,22);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (45,'Rock''a''ula',1992,22);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (46,'Histórias de Sexo e Violência',1987,22);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (47,'A Revolta dos Dândis',1987,23);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (48,'Ouça o Que Eu Digo: Não Ouça Ninguém',1988,23);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (49,'Cardume',1989,24);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (50,'Nenhum de Nós',1987,24);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (51,'Tequila Baby',1996,25);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (52,'Sangue, Ouro e Pólvora',1999,25);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (53,'Cachorro Grande',2001,26);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (54,'Pista Livre',2005,26);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (55,'Coisa de Louco II',1995,27);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (56,'Chapinhas de Ouro',1998,27);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (57,'Se Sexo É o Que Importa, Só o Rock É Sobre Amor',2000,28);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (58,'Outono Rock Brasileiro',2002,28);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (59,'Vera Loca',2002,29);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (60,'Vera Loca II',2006,29);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (61,'Rosa Tattooada',1990,30);
insert into albuns (album_id, nome, ano_lancamento, banda_id) values (62,'Carburador',1996,30);
-- 
insert into albuns values (63,'Lapadas do Povo',1997,31);

-- insere musicas nos álbuns

insert into musicas (musica_id, nome, album_id) values (1,'Black Sabbath',1);
insert into musicas (musica_id, nome, album_id) values (2,'Paranoid',2);
insert into musicas (musica_id, nome, album_id) values (3,'Breaking the Law',3);
insert into musicas (musica_id, nome, album_id) values (4,'Painkiller',4);
insert into musicas (musica_id, nome, album_id) values (5,'Run to the Hills',5);
insert into musicas (musica_id, nome, album_id) values (6,'Aces High',6);
insert into musicas (musica_id, nome, album_id) values (7,'N.I.B.',1);
insert into musicas (musica_id, nome, album_id) values (8,'Iron Man',2);
insert into musicas (musica_id, nome, album_id) values (9,'Living After Midnight',3);
insert into musicas (musica_id, nome, album_id) values (10,'A Touch of Evil',4);
insert into musicas (musica_id, nome, album_id) values (11,'Hallowed Be Thy Name',5);
insert into musicas (musica_id, nome, album_id) values (12,'2 Minutes to Midnight',6);
insert into musicas (musica_id, nome, album_id) values (13,'Bonded by Blood',9);
insert into musicas (musica_id, nome, album_id) values (14,'The Toxic Waltz',10);
insert into musicas (musica_id, nome, album_id) values (15,'Welcome to Hell',11);
insert into musicas (musica_id, nome, album_id) values (16,'Black Metal',12);
insert into musicas (musica_id, nome, album_id) values (17,'Master of Puppets',13);
insert into musicas (musica_id, nome, album_id) values (18,'Ride the Lightning',14);
insert into musicas (musica_id, nome, album_id) values (19,'Angel of Death',15);
insert into musicas (musica_id, nome, album_id) values (20,'South of Heaven',16);
insert into musicas (musica_id, nome, album_id) values (21,'Among the Living',17);
insert into musicas (musica_id, nome, album_id) values (22,'Madhouse',18);
insert into musicas (musica_id, nome, album_id) values (23,'Cowboys from Hell',19);
insert into musicas (musica_id, nome, album_id) values (24,'Walk',20);
insert into musicas (musica_id, nome, album_id) values (25,'Agent Orange',21);
insert into musicas (musica_id, nome, album_id) values (26,'Nuclear Winter',22);
insert into musicas (musica_id, nome, album_id) values (27,'Holy Diver',23);
insert into musicas (musica_id, nome, album_id) values (28,'We Rock',24);
insert into musicas (musica_id, nome, album_id) values (29,'Pleasure to Kill',25);
insert into musicas (musica_id, nome, album_id) values (30,'Coma of Souls',26);
insert into musicas (musica_id, nome, album_id) values (31,'Holy Wars... The Punishment Due',27);
insert into musicas (musica_id, nome, album_id) values (32,'Peace Sells',28);
insert into musicas (musica_id, nome, album_id) values (33,'Over the Wall',29);
insert into musicas (musica_id, nome, album_id) values (34,'Practice What You Preach',30);
insert into musicas (musica_id, nome, album_id) values (35,'Arise',31);
insert into musicas (musica_id, nome, album_id) values (36,'Refuse/Resist',32);
insert into musicas (musica_id, nome, album_id) values (37,'Núcleo Base',33);
insert into musicas (musica_id, nome, album_id) values (38,'Flores em Você',34);
insert into musicas (musica_id, nome, album_id) values (39,'AA UU',35);
insert into musicas (musica_id, nome, album_id) values (40,'Televisão',36);
insert into musicas (musica_id, nome, album_id) values (41,'Será',37);
insert into musicas (musica_id, nome, album_id) values (42,'Eduardo e Mônica',38);
insert into musicas (musica_id, nome, album_id) values (43,'Pro Dia Nascer Feliz',39);
insert into musicas (musica_id, nome, album_id) values (44,'Maior Abandonado',40);
insert into musicas (musica_id, nome, album_id) values (45,'Tédio',41);
insert into musicas (musica_id, nome, album_id) values (46,'Zé Ninguém',42);
insert into musicas (musica_id, nome, album_id) values (47,'Sob um Céu de Blues',43);
insert into musicas (musica_id, nome, album_id) values (48,'Surfista Calhorda',44);
insert into musicas (musica_id, nome, album_id) values (49,'Eu Quis Comer Você',45);
insert into musicas (musica_id, nome, album_id) values (50,'H.G.M.',46);
insert into musicas (musica_id, nome, album_id) values (51,'Infinita Highway',47);
insert into musicas (musica_id, nome, album_id) values (52,'Somos Quem Podemos Ser',48);
insert into musicas (musica_id, nome, album_id) values (53,'Camila, Camila',49);
insert into musicas (musica_id, nome, album_id) values (54,'Camila, Camila',50);
insert into musicas (musica_id, nome, album_id) values (55,'Velhas Fotos',51);
insert into musicas (musica_id, nome, album_id) values (56,'Sexo, Algemas e Cinta-liga',52);
insert into musicas (musica_id, nome, album_id) values (57,'Debaixo do Chapéu',53);
insert into musicas (musica_id, nome, album_id) values (58,'Sinceramente',54);
insert into musicas (musica_id, nome, album_id) values (59,'Amigo Punk',55);
insert into musicas (musica_id, nome, album_id) values (60,'Você Foi Pro Japão',56);
insert into musicas (musica_id, nome, album_id) values (61,'E Por Que Não?',57);
insert into musicas (musica_id, nome, album_id) values (62,'Mesmo Que Mude',58);
insert into musicas (musica_id, nome, album_id) values (63,'Palácio dos Enfeites',59);
insert into musicas (musica_id, nome, album_id) values (64,'Borracho y Loco',60);
insert into musicas (musica_id, nome, album_id) values (65,'Tardes de Outono',61);
insert into musicas (musica_id, nome, album_id) values (66,'Carburador',62);
insert into musicas (musica_id, nome, album_id) values (67,'A Lesson in Violence',9);
insert into musicas (musica_id, nome, album_id) values (68,'Fabulous Disaster',10);
insert into musicas (musica_id, nome, album_id) values (69,'In League with Satan',11);
insert into musicas (musica_id, nome, album_id) values (70,'Countess Bathory',12);
insert into musicas (musica_id, nome, album_id) values (71,'Battery',13);
insert into musicas (musica_id, nome, album_id) values (72,'For Whom the Bell Tolls',14);
insert into musicas (musica_id, nome, album_id) values (73,'Raining Blood',15);
insert into musicas (musica_id, nome, album_id) values (74,'Mandatory Suicide',16);
insert into musicas (musica_id, nome, album_id) values (75,'Caught in a Mosh',17);
insert into musicas (musica_id, nome, album_id) values (76,'A.I.R.',18);
insert into musicas (musica_id, nome, album_id) values (77,'Cemetery Gates',19);
insert into musicas (musica_id, nome, album_id) values (78,'Mouth for War',20);
insert into musicas (musica_id, nome, album_id) values (79,'Remember the Fallen',21);
insert into musicas (musica_id, nome, album_id) values (80,'Electrocution',22);
insert into musicas (musica_id, nome, album_id) values (81,'Rainbow in the Dark',23);
insert into musicas (musica_id, nome, album_id) values (82,'The Last in Line',24);
insert into musicas (musica_id, nome, album_id) values (83,'Ripping Corpse',25);
insert into musicas (musica_id, nome, album_id) values (84,'People of the Lie',26);
insert into musicas (musica_id, nome, album_id) values (85,'Hangar 18',27);
insert into musicas (musica_id, nome, album_id) values (86,'Wake Up Dead',28);
insert into musicas (musica_id, nome, album_id) values (87,'Apocalyptic City',29);
insert into musicas (musica_id, nome, album_id) values (88,'Perilous Nation',30);
insert into musicas (musica_id, nome, album_id) values (89,'Dead Embryonic Cells',31);
insert into musicas (musica_id, nome, album_id) values (90,'Territory',32);
insert into musicas (musica_id, nome, album_id) values (91,'Tolices',33);
insert into musicas (musica_id, nome, album_id) values (92,'Dias de Luta',34);
insert into musicas (musica_id, nome, album_id) values (93,'Bichos Escrotos',35);
insert into musicas (musica_id, nome, album_id) values (94,'Insensível',36);
insert into musicas (musica_id, nome, album_id) values (95,'Geração Coca-Cola',37);
insert into musicas (musica_id, nome, album_id) values (96,'Tempo Perdido',38);
insert into musicas (musica_id, nome, album_id) values (97,'Todo Amor que Houver Nessa Vida',39);
insert into musicas (musica_id, nome, album_id) values (98,'Bete Balanço',40);
insert into musicas (musica_id, nome, album_id) values (99,'Vento Ventania',41);
insert into musicas (musica_id, nome, album_id) values (100,'Chove Chuva',42);
insert into musicas (musica_id, nome, album_id) values (101,'Estou Amando Loucamente',43);
insert into musicas (musica_id, nome, album_id) values (102,'Nico',44);
insert into musicas (musica_id, nome, album_id) values (103,'Cobras e Lagartos',45);
insert into musicas (musica_id, nome, album_id) values (104,'Problemas',46);
insert into musicas (musica_id, nome, album_id) values (105,'Terra de Gigantes',47);
insert into musicas (musica_id, nome, album_id) values (106,'Pra Ser Sincero',48);
insert into musicas (musica_id, nome, album_id) values (107,'O Astronauta de Mármore',49);
insert into musicas (musica_id, nome, album_id) values (108,'Diga a Ela',50);
insert into musicas (musica_id, nome, album_id) values (109,'Menina Linda',51);
insert into musicas (musica_id, nome, album_id) values (110,'Velhas Fotos',52);
insert into musicas (musica_id, nome, album_id) values (111,'Lunático',53);
insert into musicas (musica_id, nome, album_id) values (112,'Que Loucura',54);
insert into musicas (musica_id, nome, album_id) values (113,'Empregada',55);
insert into musicas (musica_id, nome, album_id) values (114,'Minha Picape',56);
insert into musicas (musica_id, nome, album_id) values (115,'Mesmo Que Mude',57);
insert into musicas (musica_id, nome, album_id) values (116,'Microondas',58);
insert into musicas (musica_id, nome, album_id) values (117,'Velocidade',59);
insert into musicas (musica_id, nome, album_id) values (118,'Meu Toca Discos Se Matou',60);
insert into musicas (musica_id, nome, album_id) values (119,'O Inferno Vai ter que Esperar',61);
insert into musicas (musica_id, nome, album_id) values (120,'Vingança',62);


-- insere na tabela playlists
insert into playlists (playlist_id, nome) values (1,'Heavy Metal Anos 80');
insert into playlists (playlist_id, nome) values (2,'Heavy Metal Anos Moderno');
insert into playlists (playlist_id, nome) values (3,'Rock Nacional');
insert into playlists (playlist_id, nome) values (4,'Rock Gaúcho');

-- insere na tabela playlists

insert into playlists_musicas (playlist_id, musica_id) values (1,1);
insert into playlists_musicas (playlist_id, musica_id) values (1,2);
insert into playlists_musicas (playlist_id, musica_id) values (1,3);
insert into playlists_musicas (playlist_id, musica_id) values (1,5);
insert into playlists_musicas (playlist_id, musica_id) values (1,6);
insert into playlists_musicas (playlist_id, musica_id) values (1,7);
insert into playlists_musicas (playlist_id, musica_id) values (1,8);
insert into playlists_musicas (playlist_id, musica_id) values (1,9);
insert into playlists_musicas (playlist_id, musica_id) values (1,11);
insert into playlists_musicas (playlist_id, musica_id) values (1,12);
insert into playlists_musicas (playlist_id, musica_id) values (1,13);
insert into playlists_musicas (playlist_id, musica_id) values (1,14);
insert into playlists_musicas (playlist_id, musica_id) values (1,15);
insert into playlists_musicas (playlist_id, musica_id) values (1,16);
insert into playlists_musicas (playlist_id, musica_id) values (1,17);
insert into playlists_musicas (playlist_id, musica_id) values (1,18);
insert into playlists_musicas (playlist_id, musica_id) values (1,19);
insert into playlists_musicas (playlist_id, musica_id) values (1,20);
insert into playlists_musicas (playlist_id, musica_id) values (1,21);
insert into playlists_musicas (playlist_id, musica_id) values (1,22);
insert into playlists_musicas (playlist_id, musica_id) values (1,25);
insert into playlists_musicas (playlist_id, musica_id) values (1,26);
insert into playlists_musicas (playlist_id, musica_id) values (1,27);
insert into playlists_musicas (playlist_id, musica_id) values (1,28);
insert into playlists_musicas (playlist_id, musica_id) values (1,29);
insert into playlists_musicas (playlist_id, musica_id) values (1,32);
insert into playlists_musicas (playlist_id, musica_id) values (1,33);
insert into playlists_musicas (playlist_id, musica_id) values (1,34);
insert into playlists_musicas (playlist_id, musica_id) values (1,67);
insert into playlists_musicas (playlist_id, musica_id) values (1,68);
insert into playlists_musicas (playlist_id, musica_id) values (1,69);
insert into playlists_musicas (playlist_id, musica_id) values (1,70);
insert into playlists_musicas (playlist_id, musica_id) values (1,71);
insert into playlists_musicas (playlist_id, musica_id) values (1,72);
insert into playlists_musicas (playlist_id, musica_id) values (1,73);
insert into playlists_musicas (playlist_id, musica_id) values (1,74);
insert into playlists_musicas (playlist_id, musica_id) values (1,75);
insert into playlists_musicas (playlist_id, musica_id) values (1,76);
insert into playlists_musicas (playlist_id, musica_id) values (1,79);
insert into playlists_musicas (playlist_id, musica_id) values (1,80);
insert into playlists_musicas (playlist_id, musica_id) values (1,81);
insert into playlists_musicas (playlist_id, musica_id) values (1,82);
insert into playlists_musicas (playlist_id, musica_id) values (1,83);
insert into playlists_musicas (playlist_id, musica_id) values (1,86);
insert into playlists_musicas (playlist_id, musica_id) values (1,87);
insert into playlists_musicas (playlist_id, musica_id) values (1,88);

-- playlist Heavy Metal Moderno

insert into playlists_musicas (playlist_id, musica_id) values (2,4);
insert into playlists_musicas (playlist_id, musica_id) values (2,10);
insert into playlists_musicas (playlist_id, musica_id) values (2,23);
insert into playlists_musicas (playlist_id, musica_id) values (2,24);
insert into playlists_musicas (playlist_id, musica_id) values (2,30);
insert into playlists_musicas (playlist_id, musica_id) values (2,31);
insert into playlists_musicas (playlist_id, musica_id) values (2,35);
insert into playlists_musicas (playlist_id, musica_id) values (2,36);
insert into playlists_musicas (playlist_id, musica_id) values (2,77);
insert into playlists_musicas (playlist_id, musica_id) values (2,78);
insert into playlists_musicas (playlist_id, musica_id) values (2,84);
insert into playlists_musicas (playlist_id, musica_id) values (2,85);
insert into playlists_musicas (playlist_id, musica_id) values (2,89);
insert into playlists_musicas (playlist_id, musica_id) values (2,90);

-- playlist Rock Nacional
insert into playlists_musicas (playlist_id, musica_id) values (3,37);
insert into playlists_musicas (playlist_id, musica_id) values (3,38);
insert into playlists_musicas (playlist_id, musica_id) values (3,39);
insert into playlists_musicas (playlist_id, musica_id) values (3,40);
insert into playlists_musicas (playlist_id, musica_id) values (3,41);
insert into playlists_musicas (playlist_id, musica_id) values (3,42);
insert into playlists_musicas (playlist_id, musica_id) values (3,43);
insert into playlists_musicas (playlist_id, musica_id) values (3,44);
insert into playlists_musicas (playlist_id, musica_id) values (3,45);
insert into playlists_musicas (playlist_id, musica_id) values (3,46);
insert into playlists_musicas (playlist_id, musica_id) values (3,91);
insert into playlists_musicas (playlist_id, musica_id) values (3,92);
insert into playlists_musicas (playlist_id, musica_id) values (3,93);
insert into playlists_musicas (playlist_id, musica_id) values (3,94);
insert into playlists_musicas (playlist_id, musica_id) values (3,95);
insert into playlists_musicas (playlist_id, musica_id) values (3,96);
insert into playlists_musicas (playlist_id, musica_id) values (3,97);
insert into playlists_musicas (playlist_id, musica_id) values (3,98);
insert into playlists_musicas (playlist_id, musica_id) values (3,99);
insert into playlists_musicas (playlist_id, musica_id) values (3,100);

-- playlist Rock Gaúcho
insert into playlists_musicas (playlist_id, musica_id) values (4,47);
insert into playlists_musicas (playlist_id, musica_id) values (4,48);
insert into playlists_musicas (playlist_id, musica_id) values (4,49);
insert into playlists_musicas (playlist_id, musica_id) values (4,50);
insert into playlists_musicas (playlist_id, musica_id) values (4,51);
insert into playlists_musicas (playlist_id, musica_id) values (4,52);
insert into playlists_musicas (playlist_id, musica_id) values (4,53);
insert into playlists_musicas (playlist_id, musica_id) values (4,54);
insert into playlists_musicas (playlist_id, musica_id) values (4,55);
insert into playlists_musicas (playlist_id, musica_id) values (4,56);
insert into playlists_musicas (playlist_id, musica_id) values (4,57);
insert into playlists_musicas (playlist_id, musica_id) values (4,58);
insert into playlists_musicas (playlist_id, musica_id) values (4,59);
insert into playlists_musicas (playlist_id, musica_id) values (4,60);
insert into playlists_musicas (playlist_id, musica_id) values (4,61);
insert into playlists_musicas (playlist_id, musica_id) values (4,62);
insert into playlists_musicas (playlist_id, musica_id) values (4,63);
insert into playlists_musicas (playlist_id, musica_id) values (4,64);
insert into playlists_musicas (playlist_id, musica_id) values (4,65);
insert into playlists_musicas (playlist_id, musica_id) values (4,66);
insert into playlists_musicas (playlist_id, musica_id) values (4,101);
insert into playlists_musicas (playlist_id, musica_id) values (4,102);
insert into playlists_musicas (playlist_id, musica_id) values (4,103);
insert into playlists_musicas (playlist_id, musica_id) values (4,104);
insert into playlists_musicas (playlist_id, musica_id) values (4,105);
insert into playlists_musicas (playlist_id, musica_id) values (4,106);
insert into playlists_musicas (playlist_id, musica_id) values (4,107);
insert into playlists_musicas (playlist_id, musica_id) values (4,108);
insert into playlists_musicas (playlist_id, musica_id) values (4,109);
insert into playlists_musicas (playlist_id, musica_id) values (4,110);
insert into playlists_musicas (playlist_id, musica_id) values (4,111);
insert into playlists_musicas (playlist_id, musica_id) values (4,112);
insert into playlists_musicas (playlist_id, musica_id) values (4,113);
insert into playlists_musicas (playlist_id, musica_id) values (4,114);
insert into playlists_musicas (playlist_id, musica_id) values (4,115);
insert into playlists_musicas (playlist_id, musica_id) values (4,116);
insert into playlists_musicas (playlist_id, musica_id) values (4,117);
insert into playlists_musicas (playlist_id, musica_id) values (4,118);
insert into playlists_musicas (playlist_id, musica_id) values (4,119);
insert into playlists_musicas (playlist_id, musica_id) values (4,120);
