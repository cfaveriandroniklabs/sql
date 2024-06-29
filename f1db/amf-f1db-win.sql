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

drop table if exists core.team cascade;
drop table if exists core.pilot cascade;
drop table if exists core.race cascade;
drop table if exists core.race_time cascade;

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
copy core.team (team_id, name, country) from 'd:\temp\f1teams.csv' csv header delimiter ';';

-- Inserindo pilotos na tabela core.pilot para todas as equipes de Fórmula 1 da temporada atual
copy core.pilot (pilot_id, name, birth_date, country, team_id) from 'd:\temp\f1pilots.csv' csv header delimiter ';';
select * from pilot;
-- Inserindo corridas na tabela core.corridas 
copy core.race (race_id, season_year, qualification_date, race_date, total_laps, country, city) from 'd:\temp\f1races.csv' csv header delimiter ';';
select * from core.race order by race_id;

-- Inserindo tempo das corridas na tabela core.race_time 
copy core.race_time (race_id, pilot_id, lap, time_miliseconds) from 'd:\temp\f1races_time.csv' csv header delimiter ';';
select * from core.race_time;

select t.name, p.name, r.season_year, r.country, i.lap, i.time_miliseconds 
from team t
inner join pilot p on p.team_id = t.team_id
inner join race_time i on i.pilot_id = p.pilot_id
inner join race r on r.race_id = i.race_id;




