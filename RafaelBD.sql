-- CRIAR TABELAS
create table CARGO
(
CODIGO number not null,
DESCRICAO varchar2(100) not null
);


create table COLABORADOR
(
MATRICULA number not null,
NOME varchar2(100) not null,
CARGO number
);

create table CONTACORRENTE
(
NUMERO number not null,
CLIENTE number not null,
GERENTE number not null,
DATAABERTURA date not null,
DATAENCERRAMENTO DATE 
);

create table CONTACORRENTE_PRODUTO
(
ITEM number not null,
CONTA number not null,
PRODUTO number not null,
CONTRATACAO date not null,
ENCERRAMENTO DATE, 
COLABORADOR number not null
);


create table PRODUTO
(
CODIGO number not null,
DESCRICAO varchar2(100) not null,
VALOR number not null
);


create table CLIENTE
(
CODIGO number not null,
NOME varchar2(100) not null
);


create table CLIENTE_JURIDICA
(
CLIENTE number not null,
RAZAOSOCIAL varchar2(100) not null,
CNPJ varchar2(14) not null,
IE varchar2(10) NOT null
);

create table CLIENTE_FISICA
(
CLIENTE number not null,
SEXO number not null,
DTNASCIMENTO date not null,
CPF varchar2(11) not NULL
);


create table ENDERECO
(
ITEM number not null,
CLIENTE number not null,
LOGRADOURO varchar2(100) not null,
BAIRRO varchar2(100) not null,
NUMERO varchar2(20),
CEP varchar2(9) not null,
CIDADE varchar2(100) not null,
UF varchar2(2) not null,
PAIS varchar2(100) not null,
TIPO number not null
);

create table TIPO_ENDERECO
(
CODIGO number not null,
DESCRICAO varchar2(100) not null
);

-- CONSTRAINTS
-- PRIMARY KEY
alter table CARGO add
constraint PK_CARGO primary key (CODIGO) using index tablespace TBS_RAFA04;
alter table COLABORADOR add
constraint PK_COLABORADOR primary key (MATRICULA) using index tablespace TBS_RAFA04;
alter table CONTACORRENTE add
constraint PK_CONTACORRENTE primary key (NUMERO) using index tablespace TBS_RAFA04;
alter table CONTACORRENTE_PRODUTO add
constraint PK_CONTACORRENTE_PROD primary key (ITEM) using index tablespace TBS_RAFA04;
alter table PRODUTO add
constraint PK_PRODUTO primary key (CODIGO) using index tablespace TBS_RAFA04;
alter table CLIENTE add
constraint PK_CLIENTE primary key (CODIGO) using index tablespace TBS_RAFA04;
alter table CLIENTE_JURIDICA add
constraint PK_CLIENTEJUR primary key (CLIENTE) using index tablespace TBS_RAFA04;
alter table CLIENTE_FISICA add
constraint PK_CLIENTEFIS primary key (CLIENTE) using index tablespace TBS_RAFA04;
alter table ENDERECO add
constraint PK_ENDERECO primary key (ITEM,CLIENTE) using index tablespace TBS_RAFA04;
alter table TIPO_ENDERECO add
constraint PK_TIPOENDERECO primary key (CODIGO) using index tablespace TBS_RAFA04;
-- FOREIGN KEY

alter table COLABORADOR add
constraint FK_COLABORADOR_CARGO foreign key (CARGO) references CARGO(CODIGO);
alter table CONTACORRENTE add
constraint FK_CONTACORRENTE_COLAB foreign key (GERENTE) references COLABORADOR(MATRICULA);
alter table CONTACORRENTE add
constraint FK_CONTACORRENTE_CLIENTE foreign key (CLIENTE) references CLIENTE(CODIGO);
alter table CONTACORRENTE_PRODUTO add
constraint FK_CCP_CC foreign key (CONTA) references CONTACORRENTE(NUMERO);
alter table CONTACORRENTE_PRODUTO add
constraint FK_CCP_COLAB foreign key (COLABORADOR) references COLABORADOR(MATRICULA);
alter table CONTACORRENTE_PRODUTO add
constraint FK_CCP_PROD foreign key (PRODUTO) references PRODUTO(CODIGO);
alter table CLIENTE_JURIDICA add
constraint FK_CJUR_CLI foreign key (CLIENTE) references CLIENTE(CODIGO);
alter table CLIENTE_FISICA add
constraint FK_CFIS_CLI foreign key (CLIENTE) references CLIENTE(CODIGO);
alter table ENDERECO add
constraint FK_END_CLI foreign key (CLIENTE) references CLIENTE(CODIGO);
alter table ENDERECO add
constraint FK_END_TPEND foreign key (TIPO) references TIPO_ENDERECO(CODIGO);

-- check
alter table CLIENTE_FISICA add
constraint CK_CLIENTE_SEXO check (SEXO in (0,1));

-------- insert
insert into cargo(codigo, descricao) values (1,'Gerente 1');
insert into cargo(codigo, descricao) values (2,'Gerente 2');
insert into cargo(codigo, descricao) values (3,'Gerente 3');
insert into cargo(codigo, descricao) values (4,'Gerente 4');
insert into cargo(codigo, descricao) values (5,'Gerente 5');
insert into cargo(codigo, descricao) values (6,'Gerente 6');
insert into cargo(codigo, descricao) values (7,'Gerente 7');
insert into cargo(codigo, descricao) values (8,'Gerente 8');
insert into cargo(codigo, descricao) values (9,'Gerente 9');
insert into cargo(codigo, descricao) values (10,'Gerente 10');

insert into colaborador(matricula,nome,cargo) values(1, 'Funcionario 1', 1);
insert into colaborador(matricula,nome,cargo) values(2, 'Funcionario 2', 10);
insert into colaborador(matricula,nome,cargo) values(3, 'Funcionario 3', 2);
insert into colaborador(matricula,nome,cargo) values(4, 'Funcionario 4', 1);
insert into colaborador(matricula,nome,cargo) values(5, 'Funcionario 5', 2);
insert into colaborador(matricula,nome,cargo) values(6, 'Funcionario 6', 3);
insert into colaborador(matricula,nome,cargo) values(7, 'Funcionario 7', 1);
insert into colaborador(matricula,nome,cargo) values(8, 'Funcionario 8', 4);
insert into colaborador(matricula,nome,cargo) values(9, 'Funcionario 9', 8);
insert into colaborador(matricula,nome,cargo) values(10, 'Funcionario 10', 9);

insert into tipo_endereco(codigo, descricao) values (1,'Tipo 1');
insert into tipo_endereco(codigo, descricao) values (2,'Tipo 2');
insert into tipo_endereco(codigo, descricao) values (3,'Tipo 3');
insert into tipo_endereco(codigo, descricao) values (4,'Tipo 4');
insert into tipo_endereco(codigo, descricao) values (5,'Tipo 5');
insert into tipo_endereco(codigo, descricao) values (6,'Tipo 6');
insert into tipo_endereco(codigo, descricao) values (7,'Tipo 7');
insert into tipo_endereco(codigo, descricao) values (8,'Tipo 8');
insert into tipo_endereco(codigo, descricao) values (9,'Tipo 9');
insert into tipo_endereco(codigo, descricao) values (10,'Tipo 10');

insert into produto(codigo,descricao,valor) values(1,'PRD 1',10);
insert into produto(codigo,descricao,valor) values(2,'PRD 2',13);
insert into produto(codigo,descricao,valor) values(3,'PRD 3',10);
insert into produto(codigo,descricao,valor) values(4,'PRD 4',4);
insert into produto(codigo,descricao,valor) values(5,'PRD 5',22);
insert into produto(codigo,descricao,valor) values(6,'PRD 6',10);
insert into produto(codigo,descricao,valor) values(7,'PRD 7',8);
insert into produto(codigo,descricao,valor) values(8,'PRD 8',4);
insert into produto(codigo,descricao,valor) values(9,'PRD 9',9);
insert into produto(codigo,descricao,valor) values(10,'PRD 1',10);

insert into cliente(codigo, nome) values (1,'Cliente 1');
insert into cliente(codigo, nome) values (2,'Cliente 2');
insert into cliente(codigo, nome) values (3,'Cliente 3');
insert into cliente(codigo, nome) values (4,'Cliente 4');
insert into cliente(codigo, nome) values (5,'Cliente 5');
insert into cliente(codigo, nome) values (6,'Cliente 6');
insert into cliente(codigo, nome) values (7,'Cliente 7');
insert into cliente(codigo, nome) values (8,'Cliente 8');
insert into cliente(codigo, nome) values (9,'Cliente 9');
insert into cliente(codigo, nome) values (10,'Cliente 10');

insert into cliente_fisica(cliente,sexo,dtnascimento,cpf) values(1,0,'01/02/1982','11111111111');
insert into cliente_fisica(cliente,sexo,dtnascimento,cpf) values(3,1,'11/05/1975','22222222222');
insert into cliente_fisica(cliente,sexo,dtnascimento,cpf) values(5,0,'02/10/1969','33333333333');
insert into cliente_fisica(cliente,sexo,dtnascimento,cpf) values(7,1,'21/08/1998','44444444444');
insert into cliente_fisica(cliente,sexo,dtnascimento,cpf) values(9,0,'03/06/1967','55555555555');

insert into cliente_juridica(cliente,razaosocial,cnpj,ie) values(2,'RAZ JUR 2','66666666666666','666666');
insert into cliente_juridica(cliente,razaosocial,cnpj,ie) values(4,'RAZ JUR 4','77777777777777','777777');
insert into cliente_juridica(cliente,razaosocial,cnpj,ie) values(6,'RAZ JUR 6','88888888888888','888888');
insert into cliente_juridica(cliente,razaosocial,cnpj,ie) values(8,'RAZ JUR 8','99999999999999','999999');
insert into cliente_juridica(cliente,razaosocial,cnpj,ie) values(10,'RAZ JUR 10','00000000000000','000000');

insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(1,1,'Rua 1','Bairro 1','N1','14000-001','CIDADE 1','SP','BRASIL',7);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(2,2,'Rua 2','Bairro 2','N2','14000-002','CIDADE 2','SP','BRASIL',3);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(3,3,'Rua 3','Bairro 3','N3','14000-003','CIDADE 3','SP','BRASIL',7);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(4,4,'Rua 4','Bairro 4','N4','14000-004','CIDADE 4','SP','BRASIL',5);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(5,5,'Rua 5','Bairro 5','N1','14000-001','CIDADE 1','SP','BRASIL',2);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(6,6,'Rua 1','Bairro 1','N1','14000-001','CIDADE 1','SP','BRASIL',4);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(7,7,'Rua 1','Bairro 1','N1','14000-001','CIDADE 1','SP','BRASIL',3);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(8,8,'Rua 1','Bairro 1','N1','14000-001','CIDADE 1','SP','BRASIL',1);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(9,9,'Rua 5','Bairro 1','N1','14000-006','CIDADE 5','SP','BRASIL',2);
insert into endereco
(item, cliente, logradouro, bairro, numero, cep, cidade, uf, pais, tipo)
values
(10,10,'Rua 10','Bairro 9','N9','14000-009','CIDADE 9','SP','BRASIL',1);

insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(1, 1, 1, sysdate - 12, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(2, 2, 7, sysdate - 23, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(3, 3, 1, sysdate - 45, sysdate);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(4, 4, 3, sysdate - 3, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(5, 5, 2, sysdate - 8, sysdate - 2);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(6, 6, 4, sysdate - 5, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(7, 7, 4, sysdate - 90, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(8, 8, 6, sysdate - 1, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(9, 9, 5, sysdate - 2, null);
insert into contacorrente
(numero, cliente, gerente, dataabertura, dataencerramento)
values
(10, 10, 3, sysdate - 10, null);

--------------------------

insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(1, 9, 2, sysdate, null, 1);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(2, 4, 1, sysdate, null, 4);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(3, 1, 1, sysdate, null, 8);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(4, 3, 7, sysdate, null, 1);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(5, 6, 6, sysdate, null, 9);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(6, 8, 2, sysdate, null, 7);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(7, 7, 3, sysdate, null, 3);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(8, 3, 10, sysdate, null, 4);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(9, 2, 9, sysdate, null, 2);
insert into contacorrente_produto
(item, conta, produto, contratacao, encerramento, colaborador)
values
(10, 1, 8, sysdate, null, 1);

--1 Listar Código, Nome e Cargo de todos colaboradores;
SELECT*FROM colaborador;

--2 Listar Código, Nome dos colaboradores de matrícula par, ordenado por nome ascendente;
SELECT c.MATRICULA, c.NOME
FROM COLABORADOR c
WHERE MOD(c.MATRICULA, 2) = 0
ORDER BY NOME ASC;

--3 Listar os colaboradores, Nome e Função, que efetuaram venda de produto nos últimos 30 dias;
SELECT c.NOME, cg.DESCRICAO AS CARGO
FROM COLABORADOR c
JOIN CARGO cg ON c.CARGO = cg.CODIGO
JOIN CONTACORRENTE_PRODUTO cp ON c.MATRICULA = cp.COLABORADOR
WHERE cp.CONTRATACAO >= SYSDATE - 30;

--4 Listar as Contas ( Número, Nome Gerente) dos clientes pessoa física
SELECT c.numero, co.nome
FROM CONTACORRENTE c
JOIN CLIENTE_FISICA cf ON cf.cliente=c.numero 
JOIN colaborador co ON co.matricula=c.gerente;

--5 Listar Clientes (Codigo, Nome) de uma determinada cidade recebida por parâmetro;
SELECT c.codigo, c.nome
FROM cliente c
JOIN ENDERECO e ON e.cliente=c.codigo
WHERE e.cidade = 'CIDADE 9' ;

--6 Listar a quantidade de produtos por conta corrente;
SELECT cc.NUMERO AS NUMERO_CONTA, COUNT(cp.ITEM) AS QUANTIDADE_DE_PRODUTOS
FROM CONTACORRENTE cc
JOIN CONTACORRENTE_PRODUTO cp ON cc.NUMERO = cp.CONTA
GROUP BY cc.NUMERO;

--7 Listar os 5 funcionários (Nome, Descrição Cargo) que mais venderam produtos;
SELECT c.NOME, cg.DESCRICAO AS DESCRICAO_CARGO, COUNT(cp.ITEM) AS QUANTIDADE_VENDIDA
FROM COLABORADOR c
JOIN CARGO cg ON c.CARGO = cg.CODIGO
JOIN CONTACORRENTE_PRODUTO cp ON c.MATRICULA = cp.COLABORADOR
GROUP BY c.NOME, cg.DESCRICAO
ORDER BY QUANTIDADE_VENDIDA DESC
FETCH FIRST 5 ROWS ONLY;

--8 Listar as contas (Número de contas e Nome Clientes) que possuem apenas um produto contratado;
SELECT cc.NUMERO AS NUMERO_CONTA, cl.NOME AS NOME_CLIENTE
FROM CONTACORRENTE cc
JOIN CONTACORRENTE_PRODUTO cp ON cc.NUMERO = cp.CONTA
JOIN CLIENTE cl ON cc.CLIENTE = cl.CODIGO
GROUP BY cc.NUMERO, cl.NOME
HAVING COUNT(cp.ITEM) = 1;

--9 Quantidade de Endereços por cidade;
SELECT CIDADE, COUNT(ITEM) AS QUANTIDADE_DE_ENDERECOS
FROM ENDERECO
GROUP BY CIDADE;

--10  Listar Clientes (Nome, Nome da Cidade e Estado) ordenando por Nome ascendente, estado descendente e cidade ascendente.
SELECT cl.NOME AS NOME_CLIENTE, en.CIDADE, en.UF
FROM CLIENTE cl
JOIN ENDERECO en ON cl.CODIGO = en.CLIENTE
ORDER BY NOME_CLIENTE ASC, UF DESC, CIDADE ASC;
