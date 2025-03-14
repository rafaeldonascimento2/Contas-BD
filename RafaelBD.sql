/*Com base no modelo - Vendas, construa as sentenças sql ou métodos para as solicitações abaixo:
(1.0 ponto) Listar todos os produtos (Código, descrição e categoria) em ordem crescente de código.
(1.0 ponto) Listar os clientes (Código, nome, cidade) somente do estado de “SP” ordenado por cidade em ordem alfabética e posteriormente por nome cliente em ordem alfabética também.
(1.0 ponto) Listar o nome de todos os funcionários e o nome de seus respectivos supervisores.
(1.0 ponto) Listar todos os pedidos (Código e Data) em que tenham um determinado produto que seja passado por parâmetro.
(1.0 ponto) Listar os 10 produtos (Código produto, descrição e descrição da categoria) mais vendidos nos últimos 180 dias.
(1.0 ponto) Construa uma View contendo todos os dados de clientes e seus respectivos endereços.
(1.0 ponto) Construa uma função que recupere o valor total do pedido.
(1.0 ponto) Construa uma procedure que receba como parâmetro o código da categoria e um percentual. A rotina deverá acrescer o valor do produtos produtos de uma determinada categoria com o percentual de acréscimo recebido por parâmetro.
*/
--1
SELECT p.codigo AS "Código",
p.descricao AS "Descrição",
p.categoria AS "Categoria"
FROM produto p ORDER BY p.codigo ASC;
--2
SELECT c.codigo AS "Código",
c.nome AS "Nome",
e.cidade AS "Cidade"
FROM cliente c
JOIN endereco e ON c.codigo = e.cliente
WHERE e.estado = 'SP'
ORDER BY e.cidade ASC, c.nome ASC;
--3
SELECT f1.nome AS "Funcionário", f2.nome AS "Supervisor"
FROM funcionario f1
LEFT JOIN funcionario f2 ON f1.supervisor = f2.codigo;

--4
SELECT p.codigo AS "Código do Pedido", p.datapedido AS
"Data do Pedido"
FROM pedido p
JOIN item i ON p.codigo = i.pedido
WHERE i.produto = 13;
--5
SELECT
p.codigo AS "Código do Produto",
p.descricao AS "Descrição do Produto",
c.descricao AS "Descrição da Categoria",
COUNT(i.produto) AS "Quantidade Vendida"
FROM
produto p
JOIN
item i ON p.codigo = i.produto
JOIN
pedido pd ON i.pedido = pd.codigo
JOIN
categoria c ON p.categoria = c.codigo
WHERE
pd.datapedido >= SYSDATE - 180
GROUP BY
p.codigo, p.descricao, c.descricao
ORDER BY
COUNT(i.produto) DESC
FETCH FIRST 10 ROWS ONLY;

--6
CREATE OR REPLACE VIEW Cliente_Endereco_View AS
SELECT
c.codigo AS Cliente_Codigo,
c.nome AS Cliente_Nome,
c.telefone AS Cliente_Telefone,
e.logradouro AS Endereco_Logradouro,
e.numero AS Endereco_Numero,
e.cidade AS Endereco_Cidade,
e.estado AS Endereco_Estado
FROM
cliente c
JOIN
endereco e ON c.codigo = e.cliente;
--7
CREATE OR REPLACE FUNCTION
Calcula_Valor_Total_Pedido(pedido_codigo NUMBER) RETURN
NUMBER
IS
total_valor NUMBER := 0;
BEGIN
SELECT SUM(p.preco * i.quantidade)
INTO total_valor
FROM produto p
JOIN item i ON p.codigo = i.produto
WHERE i.pedido = pedido_codigo;
RETURN total_valor;
END Calcula_Valor_Total_Pedido;
--8
CREATE OR REPLACE PROCEDURE
Acresecenta_Percentual_Categoria(
categoria_codigo NUMBER,
percentual_acrescimo NUMBER
)
IS
BEGIN
UPDATE produto
SET preco = preco * (1 + percentual_acrescimo / 100)
WHERE categoria = categoria_codigo;
END Acresecenta_Percentual_Categoria;