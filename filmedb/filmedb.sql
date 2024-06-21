-- Questão 1
create database filmedb;

create table sala (
	numero_sala int, 
	descricao varchar(100) not null, 
	capacidade int not null default 100,
	primary key (numero_sala),
	check (capacidade < 300)
);

create table diretor (
	cod_diretor int, 
	nome varchar(255) not null,
	primary key (cod_diretor)
);

create table filme (
	cod_filme int, 
	nome varchar(150) not null, 
	ano_lancamento int not null, 
	categoria varchar(50) not null, 
	cod_diretor int,
	primary key (cod_filme),
	foreign key (cod_diretor) references diretor(cod_diretor)
);


create table salafilme (
	numero_sala int, 
	cod_filme int, 
	data date not null, 
	horario int not null,
	primary key (numero_sala, cod_filme),
	foreign key (numero_sala) references sala(numero_sala),
	foreign key (cod_filme) references filme(cod_filme)
);


create table premio (
	cod_premio int, 
	nome varchar(255) not null, 
	ano int not null, 
	cod_filme int,
	primary key (cod_premio),
	foreign key (cod_filme) references filme(cod_filme)
);


-- Questão 2
insert into sala (numero_sala, descricao, capacidade) values (1, 'sala imax', 150);
insert into sala (numero_sala, descricao, capacidade) values (2, 'sala plus', 120);
insert into sala (numero_sala, descricao, capacidade) values (3, 'sala standard', 200);
insert into sala (numero_sala, descricao, capacidade) values (4, 'sala 3d', 180);
insert into sala (numero_sala, descricao, capacidade) values (5, 'sala 4dx', 250);

insert into diretor (cod_diretor, nome) values (1, 'fabio meirelles');
insert into diretor (cod_diretor, nome) values (2, 'christopher nolan');
insert into diretor (cod_diretor, nome) values (3, 'quentin tarantino');
insert into diretor (cod_diretor, nome) values (4, 'martin scorsese');
insert into diretor (cod_diretor, nome) values (5, 'kathryn bigelow');

insert into filme (cod_filme, nome, ano_lancamento, categoria, cod_diretor) values (1, 'cidade de deus', 2002, 'aventura', 1);
insert into filme (cod_filme, nome, ano_lancamento, categoria, cod_diretor) values (2, 'inception', 2010, 'sci-fi', 2);
insert into filme (cod_filme, nome, ano_lancamento, categoria, cod_diretor) values (3, 'pulp fiction', 1994, 'drama', 3);
insert into filme (cod_filme, nome, ano_lancamento, categoria, cod_diretor) values (4, 'the wolf of wall street', 2013, 'biografia', 4);
insert into filme (cod_filme, nome, ano_lancamento, categoria, cod_diretor) values (5, 'the hurt locker', 2008, 'guerra', 5);

insert into salafilme (numero_sala, cod_filme, data, horario) values (1, 1, '2024-07-03', 1900);
insert into salafilme (numero_sala, cod_filme, data, horario) values (2, 2, '2024-07-02', 2000);
insert into salafilme (numero_sala, cod_filme, data, horario) values (3, 3, '2024-07-01', 2100);
insert into salafilme (numero_sala, cod_filme, data, horario) values (4, 4, '2024-07-06', 2200);
insert into salafilme (numero_sala, cod_filme, data, horario) values (5, 5, '2024-07-15', 2300);

insert into premio (cod_premio, nome, ano, cod_filme) values (1, 'oscar de melhores efeitos visuais', 2005, 1);
insert into premio (cod_premio, nome, ano, cod_filme) values (2, 'oscar de melhor fotografia', 2011, 2);
insert into premio (cod_premio, nome, ano, cod_filme) values (3, 'palma de ouro de cannes', 1994, 3);
insert into premio (cod_premio, nome, ano, cod_filme) values (4, 'globo de ouro de melhor ator - comédia', 2014, 4);
insert into premio (cod_premio, nome, ano, cod_filme) values (5, 'oscar de melhor filme', 2010, 5);

-- Questão 3
update sala set capacidade = 242 where numero_sala = 3;

-- Questão 4
update salafilme set numero_sala = 5 where data = '2024-07-01' and horario = 2100;

-- Questão 5
alter table salafilme add constraint ck_data check (data > now());
alter table salafilme add constraint ck_horario check (horario >= 0000 and horario <= 2359);

-- Questão 6
create table ator (
	cod_ator int,
	nome varchar (100),
	sobrenome varchar (100),
	nome_artistico varchar (100),
	primary key (cod_ator)
);

create table atorfilme (
	cod_ator int,
	cod_filme int,
	primary key (cod_ator, cod_filme),
	foreign key (cod_ator) references ator,
	foreign key (cod_filme) references filme
	
);

-- Questão 7
select cod_filme, nome, ano_lancamento, categoria, cod_diretor into filme_a from filme f
where f.nome like 'F%' and f.ano_lancamento >= 2000 and f.ano_lancamento <=2010;

-- Questão 8
update salafilme set data = '2024-06-14', horario = '1500', cod_filme = 2 where numero_sala in (1,2);

-- Questão 9
delete from filme_a where cod_filme not in (select cod_filme from salafilme where data >= now());


-- Questão 10 
drop table sala cascade;
drop table diretor cascade;
drop table filme cascade;
drop table salafilme cascade;
drop table premio cascade;
drop table ator cascade;
drop table atorfilme cascade;
drop database filmedb with (force);
