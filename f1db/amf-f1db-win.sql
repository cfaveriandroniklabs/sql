-- Questão 1

--Crie um banco de dados de nome f1;
create database f1;
--Renomeie o banco de dados para f1db;
alter database f1 rename to f1db;
--Apague o banco de dados f1db;
drop database f1db with (force);
--Crie o banco de dados de nome f1db a partir do template template0;
create database f1db template template0;
--Crie um esquema chamado core;
create schema core;
--Coloque o esquema core como padrão (default);
set search_path to core, public;
--Crie uma tabela no esquema core chamada team contendo os seguintes dados:

create table core.team (
 	team_id serial primary key, 
    name varchar(255) not null, 
    country varchar(255) not null
);
   
--Crie uma tabela no esquema core chamada pilot contendo os seguintes dados:
create table core.pilot (
	pilot_id serial primary key, 
	name varchar(255) not null, 
	birth_date date, 
	country varchar(255) not null, 
	team_id int not null,
	foreign key (team_id) references team(team_id)
);

--Crie uma tabela no esquema core chamada race contendo os seguintes dados:
create table core.race (
	race_id serial primary key, 
	season_year int not null, 
	qualification_date date, 
	race_date date, 
	total_laps int, 
	country varchar(255), 
	city varchar(255)
);

--Crie uma tabela no esquema core chamada race_time contendo os seguintes dados:
create table race_time (
	race_id int, 
	pilot_id int, 
	lap int, 
	time_miliseconds int not null,
	primary key (race_id, pilot_id, lap),
	foreign key (race_id) references race(race_id),
 	foreign key (pilot_id) references pilot(pilot_id)
);

-- Inserindo dados na tabela core.team para todas as equipes de Fórmula 1 da temporada atual
copy core.team (team_id, name, country) from '/tmp/f1teams.csv' csv header delimiter ';';

-- Inserindo pilotos na tabela core.pilot para todas as equipes de Fórmula 1 da temporada atual
copy core.pilot (pilot_id, name, birth_date, country, team_id) from '/tmp/f1pilots.csv' csv header delimiter ';';

-- Inserindo corridas na tabela core.corridas 
copy core.race (race_id, season_year, qualification_date, race_date, total_laps, country, city) from '/tmp/csv/f1races.csv' csv header delimiter ';';

-- Inserindo tempo das corridas na tabela core.race_time 
copy core.race_time (race_id, pilot_id, lap, time_miliseconds) from '/tmp/csv/f1races_time.csv' csv header delimiter ';';


-- Questão 2
-- Uma lista contendo o nome de todos os pilotos de fórmula 1.
select p.name from pilot p;

-- Uma lista contendo o nome de todos os pilotos de fórmula 1 da Espanha ou da Finlândia.
select p.name from pilot p
where p.country = 'Espanha' or p.country = 'Finlândia';
	-- Versão Alternativa 1
	select p.name from pilot p
	where p.country in ('Espanha', 'Finlândia');

--Uma lista contendo o nome de  todas as escuderias (team) de fórmula 1.
select t.name from team t;

-- Uma lista contendo o nome de todos os pilotos que têm menos de 30 anos e o nome de suas escuderias (team).
-- Dica use as funções age para determinar a idade e extrair o ano com a função extract (year from...). Pesquise!
select p.name, t.name  
from pilot p inner join team t
on p.team_id = t.team_id 
where extract (year from age(current_date, p.birth_date)) < 30; 

--Uma lista contendo o nome de todos os pilotos, da cidade e do país onde já correram (sem repetição)
select distinct p.name, r.country, r.city
from pilot p 
inner join race_time ra on ra.pilot_id = p.pilot_id
inner join race r on ra.race_id = r.race_id;

-- Uma lista contendo o nome do piloto, o nome da escuderia, a cidade e o país de cada corrida, 
-- o número da volta e o seu tempo de cada corrida no ano de 2022 (season_year).
select distinct p.name as "Pilot", t.name "Team", r.city, r.country, ra.lap, ra.time_miliseconds 
from pilot p 
inner join team t on p.team_id = t.team_id
inner join race_time ra on ra.pilot_id = p.pilot_id
inner join race r on ra.race_id = r.race_id;

-- Uma lista contendo o nome do piloto, o nome da escuderia, a cidade e o país de cada corrida, 
-- o número da volta mais lenta e da volta mais rápida.
select distinct p.name as "Pilot", t.name "Team", r.city, r.country, min(ra.time_miliseconds), max(ra.time_miliseconds)
from pilot p 
inner join team t on p.team_id = t.team_id
inner join race_time ra on ra.pilot_id = p.pilot_id
inner join race r on ra.race_id = r.race_id
group by p.name, t.name, r.city, r.country;

-- Questão 3
-- Apague os tempos da primeira volta das corridas de 2021 (tabela race_time) de todos os pilotos;
delete from race_time rt where rt.lap = 1 and rt.race_id in (select r.race_id from race r where r.season_year = 2021);

-- Some o tempo de todas as voltas em milissegundos para todos os pilotos em que a escuderia é da França 
-- no grande prêmio da Itália do ano de 2021.
select sum(rt.time_miliseconds) from race_time rt
inner join race r on r.race_id = rt.race_id 
inner join pilot p on p.pilot_id = rt.pilot_id 
inner join team t on t.team_id = p.team_id 
where t.country = 'França' 
and   r.country = 'Itália'
and   r.season_year = 2021;

-- Acrescente uma coluna na tabela race para indicar o nome do autódromo (racetrack: varchar(255) not null)
alter table race add column racetrack varchar(255) not null default '';

-- Apague todos os registros de todas as tabelas.

delete from race_time;
delete from race;
delete from pilot;
delete from team;

-- Apague todas as tabelas.
drop table race_time, race, pilot, team;

--Apague o banco de dados.
drop database f1db with(force);




