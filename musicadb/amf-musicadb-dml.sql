-- Insert into table usando nome dos campos
insert into albuns values (63,'Lapadas do Povo',1997,31);
-- Insert into table Sem o nome dos campos
insert into bandas (banda_id, nome, ano_criacao, genero) values (31,'Raimundos',1987,'Rock Nacional');
-- Insert usando valor default por omissão
insert into bandas (banda_id, nome, ano_criacao) values (32,'Skank',1991);
-- Insert usando valor default explicitamente
drop table usuarios;
create table usuarios (
	usuario_id serial, 
	nome varchar(300) not null, 
	status int check (status in (1,2,3)), -- 1=Ativo, 2=Inativo, 3=Excluído
	login varchar(100) not null,
	senha varchar (255) default '12345',
	primary key (usuario_id)
);

-- Insert usando valor default
insert into usuarios (usuario_id, nome, status, login, senha) values (default, 'Francisco De Paula', 1, 'f.paula', default);
-- Insert usando valor null
insert into bandas (banda_id, nome, ano_criacao, genero) values (33,'Saxon',1977, null);
-- Inserindo dados a partir de um select
	-- Crie uma playlist chamada Todas as minhas músicas
	insert into playlists (playlist_id, nome) values (5, 'Todas as minhas músicas');
	-- Insira todas as músicas na tabela playlist musicas
	insert into playlists_musicas (playlist_id, musica_id)
	select 5 as playlist_id,  musica_id from musicas; 
	-- Verifique se as musicas foram inseridas na playlist
	select * from playlists_musicas where playlist_id = 5;

-- Create table user

insert into usuarios (nome, status, login) values ('Uncle Fester', 1, 'u.fester');
select * from usuarios;

select * from albuns;
select * from bandas;
