-- Exemplo de uso de cross join

create database secdb;

create table funcionario (
	id int primary key,
	nome varchar(300) not null,
	funcao varchar(100)
);

create table permissao (
	id int primary key,
	nome varchar(300) not null,
	tipo varchar(100) -- leitura, gravação, apagar, copiar, mover
);

create table permissao_funcionario (
	funcionario_id int,
	permissao_id int,
	primary key (funcionario_id, permissao_id),
	foreign key (funcionario_id) references funcionario(id),
	foreign key (permissao_id) references permissao(id)
);

insert into funcionario (id, nome, funcao) values (1, 'João Silva', 'Analista');
insert into funcionario (id, nome, funcao) values (2, 'Maria Oliveira', 'Desenvolvedor');
insert into funcionario (id, nome, funcao) values (3, 'Pedro Santos', 'Gerente de Projeto');
insert into funcionario (id, nome, funcao) values (4, 'Ana Costa', 'Administrador');

insert into permissao (id, nome, tipo) values (1, 'Cliente', 'leitura');
insert into permissao (id, nome, tipo) values (2, 'Fornecedor', 'gravação');
insert into permissao (id, nome, tipo) values (3, 'Produto', 'apagar');
insert into permissao (id, nome, tipo) values (4, 'Pedido de Venda', 'copiar');
insert into permissao (id, nome, tipo) values (5, 'Pedido de Compra', 'mover');
insert into permissao (id, nome, tipo) values (6, 'Fatura', 'leitura');
insert into permissao (id, nome, tipo) values (7, 'Nota Fiscal', 'gravação');
insert into permissao (id, nome, tipo) values (8, 'Remessa', 'apagar');
insert into permissao (id, nome, tipo) values (9, 'Devolução', 'copiar');
insert into permissao (id, nome, tipo) values (10, 'Recebimento', 'mover');
insert into permissao (id, nome, tipo) values (11, 'Relatório Financeiro', 'leitura');
insert into permissao (id, nome, tipo) values (12, 'Contas a Pagar', 'gravação');
insert into permissao (id, nome, tipo) values (13, 'Contas a Receber', 'apagar');
insert into permissao (id, nome, tipo) values (14, 'Folha de Pagamento', 'copiar');
insert into permissao (id, nome, tipo) values (15, 'Inventário', 'mover');
insert into permissao (id, nome, tipo) values (16, 'Ordem de Produção', 'leitura');
insert into permissao (id, nome, tipo) values (17, 'Centro de Custo', 'gravação');
insert into permissao (id, nome, tipo) values (18, 'Projeto', 'apagar');
insert into permissao (id, nome, tipo) values (19, 'Contrato', 'copiar');
insert into permissao (id, nome, tipo) values (20, 'Campanha de Marketing', 'mover');
insert into permissao (id, nome, tipo) values (21, 'Contabilidade', 'leitura');
insert into permissao (id, nome, tipo) values (22, 'Transação Bancária', 'gravação');
insert into permissao (id, nome, tipo) values (23, 'Orçamento', 'apagar');
insert into permissao (id, nome, tipo) values (24, 'Ativo Fixo', 'copiar');
insert into permissao (id, nome, tipo) values (25, 'Recurso Humano', 'mover');
insert into permissao (id, nome, tipo) values (26, 'Turno de Trabalho', 'leitura');
insert into permissao (id, nome, tipo) values (27, 'Avaliação de Desempenho', 'gravação');
insert into permissao (id, nome, tipo) values (28, 'Benefício', 'apagar');
insert into permissao (id, nome, tipo) values (29, 'Adiantamento Salarial', 'copiar');
insert into permissao (id, nome, tipo) values (30, 'Frequência', 'mover');
insert into permissao (id, nome, tipo) values (31, 'Departamento', 'leitura');
insert into permissao (id, nome, tipo) values (32, 'Treinamento', 'gravação');
insert into permissao (id, nome, tipo) values (33, 'Proposta', 'apagar');
insert into permissao (id, nome, tipo) values (34, 'Cotação', 'copiar');
insert into permissao (id, nome, tipo) values (35, 'Estimativa de Custos', 'mover');
insert into permissao (id, nome, tipo) values (36, 'Lista de Materiais', 'leitura');
insert into permissao (id, nome, tipo) values (37, 'Ordem de Compra', 'gravação');
insert into permissao (id, nome, tipo) values (38, 'Chamado de Suporte', 'apagar');
insert into permissao (id, nome, tipo) values (39, 'Pedido de Reembolso', 'copiar');
insert into permissao (id, nome, tipo) values (40, 'Requisição de Material', 'mover');
insert into permissao (id, nome, tipo) values (41, 'Protocolo de Atendimento', 'leitura');
insert into permissao (id, nome, tipo) values (42, 'Meta de Vendas', 'gravação');
insert into permissao (id, nome, tipo) values (43, 'Escala de Trabalho', 'apagar');
insert into permissao (id, nome, tipo) values (44, 'Registro de Qualidade', 'copiar');
insert into permissao (id, nome, tipo) values (45, 'Medição de Serviço', 'mover');
insert into permissao (id, nome, tipo) values (46, 'Projeto de Engenharia', 'leitura');
insert into permissao (id, nome, tipo) values (47, 'Política de Desconto', 'gravação');
insert into permissao (id, nome, tipo) values (48, 'Nível de Serviço', 'apagar');
insert into permissao (id, nome, tipo) values (49, 'Plano de Manutenção', 'copiar');
insert into permissao (id, nome, tipo) values (50, 'Auditoria Interna', 'leitura');

insert into permissao_funcionario (funcionario_id, permissao_id)
select f.id, p.id from funcionario f
cross join permissao p;

select * from permissao_funcionario; 
