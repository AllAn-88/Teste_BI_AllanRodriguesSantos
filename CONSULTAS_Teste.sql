
/*Listar todos Clientes que não tenham realizado uma compra*/

SELECT C.first_name
FROM customers C
LEFT JOIN orders O on C.customer_id = O.customer_id
WHERE O.order_id IS NULL


--Listar os Produtos que não tenham sido comprados
SELECT P.product_name
FROM products P
LEFT JOIN order_items OI on P.product_id = OI.product_id
WHERE OI.order_id IS NULL


--Listar os Produtos sem Estoque;
SELECT P.product_name
FROM stocks S
LEFT JOIN products P on S.product_id = P.product_id
WHERE S.quantity IS NULL


--Agrupar a quantidade de vendas que uma determinada Marca por Loja.
SELECT 
B.brand_name, 
S.store_name, 
COUNT(O.order_id) as vendas
FROM stores S
INNER JOIN orders O on S.store_id = O.store_id
INNER JOIN order_items OI on O.order_id = OI.order_id
INNER JOIN products P on OI.product_id = P.product_id
INNER JOIN brands B on P.brand_id = B.brand_id
GROUP BY
B.brand_name, 
S.store_name


--Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT S.first_name
FROM staffs S
LEFT JOIN orders O on S.staffs_id = O.staffs_id
WHERE O.order_id IS NULL