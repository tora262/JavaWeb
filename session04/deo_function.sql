SELECT ABS(-10) AS gia_tri_tuyet_doi;
SELECT ROUND(2.6);
SELECT ROUND(2.1);

SELECT FLOOR(2.6);

SELECT CEIL(2.1);
SELECT 5 DIV 2;

SELECT COUNT(1) AS total FROM orders;

SELECT 
	MIN(total_price_order.total_price) min_total_price
FROM (
	SELECT
		SUM(p.PRICE * od.ORDER_QTY) AS total_price
	FROM orders o
	LEFT JOIN order_detail od ON od.ORDER_ID = o.ID
	INNER JOIN product p ON od.PRODUCT_ID = p.ID
	GROUP BY o.ID
) AS total_price_order;

SELECT
	GROUP_CONCAT(product_distinct.unit_price)
FROM (
	SELECT DISTINCT unit_price FROM product
) product_distinct;

SELECT * FROM ORDER_DETAIL
WHERE ORDER_ID IN (
	SELECT ID FROM orders
);

SELECT
	FORMAT(price, "###,###")
FROM product 
WHERE ID = 1;

SELECT
*
FROM product
WHERE UPPER(NAME) LIKE UPPER('%may giat%');

SELECT NOW();
SELECT YEAR(CURRENT_TIMESTAMP());
SELECT MONTHNAME(NOW());
SELECT DAYNAME(NOW());
SELECT CURDATE();

SELECT * FROM orders
WHERE DATE_FORMAT(order_date, '%y%m%d') >= CURDATE();

SELECT
	DATEDIFF(now(), order_date) AS datediff
FROM orders;

SELECT DATE_SUB(now(), INTERVAL -50 DAY);
SELECT DATE_SUB(now(), INTERVAL 10 YEAR);
SELECT DAYOFYEAR(now());
SELECT DATE_ADD(now(), INTERVAL -50 DAY);

SELECT LAST_DAY(now());

SELECT
	IF(STATUS, 'ACTIVE', 'BLOCK')
FROM customers;

SELECT
	NAME,
	IF(price > 10, "High cost", "Low cost")
FROM PRODUCT;

SELECT
	(CASE
		WHEN price <= 10 THEN "LOW"
        WHEN price < 100 AND price > 10 THEN "MEDIUM"
        ELSE "HIGH"
	END) AS level
FROM PRODUCT;

SELECT IFNULL(total_price, 0) AS total_price from orders;



