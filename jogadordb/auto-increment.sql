-- *******************************************************************
-- ***** Criando e dando manutenção em campos de auto-incremento *****
-- *******************************************************************

-- Criando uma tabela com campo serial (auto-incremento)
create table jogador (
	jogador_id serial,
	nome varchar (300)
);

-- Serial não é um tipo, mas sim uma macro que irá criar o campo como tipo int (ou variações), gerar uma sequência, definir essa sequência com default do campo e torná-lo o dono da sequência

-- O comando acima faz o seguinte nos bastidores (com o mesmo efeito):

-- drop table jogador -- descomente e rode um drop na tabela se for executar os comandos abaixo para recriar a tabela
create sequence public.jogador_jogador_id_seq;

create table jogador (
	jogador_id integer not null default nextval('public.jogador_jogador_id_seq'),
	nome varchar (300)
);

alter sequence public.jogador_jogador_id_seq owned by jogador.jogador_id;

-- Diferentes formas de inserir valores default (incluindo serial) na tabela
insert into jogador default values;
insert into jogador (nome) values ('Tulio Maravilha');
insert into jogador (jogador_id, nome) values (default, 'Roberto Carlos');

-- Para saber o nome da sequence associada ao campo;
select pg_get_serial_sequence('jogador','jogador_id');

-- Para o último valor usado pela sequence;
select currval(pg_get_serial_sequence('jogador','jogador_id'));

-- Cuidado ao inserir valores manualmente em campos sequence. A sequence não é automaticamente atualizada e isso pode gerar problemas de duplicidade futuramente, se o campo for único.
insert into jogador (jogador_id, nome) values (4, 'Vinicius Junior');
insert into jogador (jogador_id, nome) values (default, 'Enner Valencia'); -- Funciona, pois jogador_id não foi definido como primary key. Mas agora há duas tuplas com valor 4 em jogador_id.

-- Para alterar o valor da sequence
alter sequence public.jogador_jogador_id_seq restart with 5; 

insert into jogador (jogador_id, nome) values (default, 'Pedro Geromel');
insert into jogador (jogador_id, nome) values (default, 'Diego Costa');

-- deletar uma tupla não muda o valor da sequence. O valor apagado também não é reaproveitado pela sequence. Porém, pode ser incluído na mão.
delete from jogador where jogador_id  = 6;
-- Inserir um novo jogar, coloca ele com id 7.
insert into jogador (jogador_id, nome) values (default, 'Neymar Junior');

-- Valores de uma sequencia pode ser definidos como negativos
alter table jogador add column numero_sorteio int; -- cria uma nova coluna em jogador
create sequence public.jogador_numero_sorteio_seq owned by jogador.numero_sorteio start with 1000 maxvalue 1000 increment by -1; -- cria a sequencia que define o máximo valor em 1000, começa em 1000 e vai decrementando em -1
alter table jogador alter column numero_sorteio set default nextval ('public.jogador_numero_sorteio_seq '); -- set como default do campo

update jogador set nome = 'Jonathan Caleri' where jogador_id = 1; -- troca o nome do jogador 1
insert into jogador (nome) values ('Endrick Felipe Moreira de Sousa'); -- insere Endrick com numero_sorteio = 1000
insert into jogador (nome) values ('Claudio Caçapa'); -- insere Claudio Caçapa com numero_sorteio = 999

-- Valores min e max definem a faixa de uso da sequence. Default de min e máx são os valores suportados pelo tipo (smallint, int, bigint, etc)
-- Se a sequence for negativa, é preciso 
alter table jogador add column numero_aposta int; -- cria uma nova coluna em jogador
create sequence public.jogador_numero_aposta_seq owned by jogador.numero_aposta increment by 2 minvalue 100 maxvalue 1000 start with 100; -- cria a sequencia que define o mínimo valor em 100 e máximo 1000, começando em 100 e incrementando de 2 em 2
alter table jogador alter column numero_aposta set default nextval ('public.jogador_numero_aposta_seq '); -- set como default do campo
insert into jogador (nome) values ('Sérgio Chulapa'); -- insere Sérgio Chulapa com numero_aposta = 100
insert into jogador (nome) values ('Gabriel Martinelli'); -- insere Gabriel Martinelli com numero_aposta = 102. Ao tentar inserir um jogador com sequencia 1001 dará erro.


-- Alterar a sequencia de um campo para outra sequencia
create sequence public.jogador_numero_aposta_seq2 owned by jogador.numero_aposta increment by 3 minvalue 100 maxvalue 1000 start with 500; -- cria uma nova sequence
alter table jogador alter column numero_aposta set default nextval ('public.jogador_numero_aposta_seq2'); -- set como default do campo a nova sequence
insert into jogador (nome) values ('Lucas Paquetrá'); -- insere Lucas Paquetrá com numero_aposta = 500
insert into jogador (nome) values ('Pablo Maia '); -- insere Pablo Maia  com numero_aposta = 503


-- Usando nextval para preencher o valor de campos que ficaram com null
alter sequence public.jogador_numero_sorteio_seq restart 1; -- reinicia a sequencia
 -- atualiza os registros usando nextval
update jogador set numero_sorteio = nextval ('public.jogador_numero_sorteio_seq') where nome = 'Tulio Maravilha';
update jogador set numero_sorteio = nextval ('public.jogador_numero_sorteio_seq') where nome = 'Roberto Carlos'; 
update jogador set numero_sorteio = nextval ('public.jogador_numero_sorteio_seq') where nome = 'Vinicius Junior'; 
update jogador set numero_sorteio = nextval ('public.jogador_numero_sorteio_seq') where nome = 'Enner Valencia'; 
update jogador set numero_sorteio = nextval ('public.jogador_numero_sorteio_seq') where nome = 'Pedro Geromel'; 
-- set o campo como not null
alter table jogador alter column numero_sorteio set not null;
-- perceba que o uso de nextval atualiza o valor da sequence
select currval(pg_get_serial_sequence('jogador','numero_sorteio'));

-- Mostrando os registros de jogador
select * from jogador;