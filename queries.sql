-- Display in descending order of seniority the male employees whose net salary (salary + commission) is greater than or equal to 8000. 
-- The resulting table should include the following columns: Employee Number, First Name and Last Name (using LPAD or RPAD for formatting), Age, and Seniority.

WITH employee_gross_salary AS (
    SELECT 
        employee_number as employee_number, 
        rpad(first_name, 10) as first_name, 
        lpad(last_name, 10) as last_name, 
        EXTRACT('YEAR' FROM AGE(CURRENT_DATE, birth_date)) as Age, 
        position as Seniority, 
        salary + commission AS total_salary 
    FROM employees
)
SELECT * FROM employee_gross_salary 
WHERE total_salary >= 8000 
ORDER BY
    CASE Seniority
        WHEN 'Vice President' THEN 1
        WHEN 'Sales Manager' THEN 2
        WHEN 'Sales Assistant' THEN 3
        WHEN 'Sales Representative' THEN 4
    END;

-- Display products that meet the following criteria: 
--     (C1) quantity is packaged in bottle(s), 
--     (C2) the third character in the product name is 't' or 'T', 
--     (C3) supplied by suppliers 1, 2, or 3, 
--     (C4) unit price ranges between 70 and 200, and 
--     (C5) units ordered are specified (not null). 
-- The resulting table should include the following columns: product number, product name, supplier number, units ordered, and unit price.

SELECT * FROM products 
WHERE
    quantity LIKE '%bottle%' 
AND
    product_name ~ '^.{2}[t|T]'
AND
    supplier_number IN (1,3) 
AND
    unit_price BETWEEN 70 AND 200 
AND
    units_on_order IS NOT NULL;


-- Display customers who reside in the same region as supplier 1, meaning they share the same country, city, and the last three digits of the postal code. 
-- The query should utilize a single subquery. The resulting table should include all columns from the customer table.

WITH supplier_regions AS (
	SELECT 
        supplier_number, 
        country, city, 
        RIGHT(postal_code, 3) AS p_code 
    FROM suppliers 
	WHERE 
        supplier_number = 1
)
SELECT * FROM customers 
WHERE 
    RIGHT(postal_code, 3) = (SELECT p_code FROM supplier_regions)
AND 
    city = (SELECT city FROM supplier_regions)
AND 
    country = (SELECT country FROM supplier_regions);

-- For each order number between 10998 and 11003, do the following:  
    -- Display the new discount rate, which should be 
        -- 0% if the total order amount before discount (unit price * quantity) is between 0 and 2000, 
        -- 5% if between 2001 and 10000, 
        -- 10% if between 10001 and 40000, 
        -- 15% if between 40001 and 80000, and 
        -- 20% otherwise.
    -- Display the message 
        -- "apply old discount rate" if the order number is between 10000 and 10999, and 
        -- "apply new discount rate" otherwise. 
-- The resulting table should display the columns: order number, new discount rate, and discount rate application note.

WITH NEW_DISCOUNT_RATE AS (
    SELECT
        ORDER_NUMBER,
        CASE
            WHEN (UNIT_PRICE * QUANTITY) BETWEEN 0 AND 2000 THEN '0%'
            WHEN (UNIT_PRICE * QUANTITY) BETWEEN 2001 AND 10000 THEN '5%'
            WHEN (UNIT_PRICE * QUANTITY) BETWEEN 10001 AND 40000 THEN '10%'
            WHEN (UNIT_PRICE * QUANTITY) BETWEEN 40001 AND 80000 THEN '15%'
            ELSE '20%'
        END AS NEW_DISCOUNT_RATE,
        
        CASE 
            WHEN ORDER_NUMBER BETWEEN 10000 AND 10999 THEN 'apply old discount rate'
            ELSE 'apply new discount rate'
        END AS DISCOUNT_RATE_APPLICATION_NOTE
    FROM 
        ORDER_DETAILS
    WHERE 
        ORDER_NUMBER BETWEEN 10998 AND 11003
)
SELECT * FROM NEW_DISCOUNT_RATE;


-- Display suppliers of beverage products. The resulting table should display the columns: supplier number, company, address, and phone number.

WITH supplier_details AS (
	SELECT 
		category_code, 
		supplier_number
	FROM products
	WHERE category_code = 1
)
SELECT 
	supplier_number, 
	company, 
	address, 
	phone 
FROM suppliers
WHERE supplier_number IN (SELECT supplier_number FROM supplier_details);

-- Display customers from Berlin who have ordered at most 1 (0 or 1) dessert product. The resulting table should display the column: customer code.

SELECT DISTINCT 
    c.customer_code 
FROM customers c
JOIN 
    orders o ON o.customer_code = c.customer_code
JOIN 
    order_details od ON od.order_number = o.order_number
JOIN 
    products p ON p.product_ref = od.product_ref
JOIN 
    categories ct ON p.category_code = p.category_code
WHERE 
    c.city = 'Berlin'
AND 
    ct.category_code = 3
GROUP BY c.customer_code
HAVING 
	COUNT(
        CASE WHEN od.order_number > 1 THEN 1 ELSE 0 END
    ) >= 1;

-- Display customers 
    -- who reside in France 
    -- and the total amount of orders they placed every Monday in April 1998 (considering customers who haven't placed any orders yet). 
-- The resulting table should display the columns: customer number, company name, phone number, total amount, and country.

WITH customer_order_details AS (
    SELECT DISTINCT
        c.customer_code,
        c.company,
        c.phone,
        c.country,
        COUNT(o.order_number) AS num_of_orders,
		REPLACE(TO_CHAR(o.order_date, 'Day'), ' ', '') AS day,
		REPLACE(TO_CHAR(o.order_date, 'Month'), ' ', '') AS month,
        EXTRACT('Year' FROM(o.order_date)) AS year 
    FROM customers c 
    LEFT JOIN 
        orders o
    ON o.customer_code = c.customer_code
    GROUP BY
        c.customer_code, day, month, year
)
SELECT * FROM customer_order_details
WHERE
	country = 'France'
AND 
	day = 'Monday'
AND
	month = 'April'
AND
	year = 1998;

-- Display customers who have ordered all products. The resulting table should display the columns: customer code, company name, and telephone number.

SELECT DISTINCT
	c.customer_code, 
	s.company, 
	s.phone as company_phone
FROM orders o
INNER JOIN 
    customers c 
ON c.customer_code = o.customer_code
INNER JOIN 
    order_details od 
ON o.order_number = od.order_number
INNER JOIN 
    products p 
ON od.product_ref = p.product_ref
INNER JOIN 
    suppliers s 
ON p.supplier_number = s.supplier_number
ORDER BY 
    c.customer_code;


-- Display for each customer from France the number of orders they have placed. The resulting table should display the columns: customer code and number of orders.

SELECT DISTINCT
	c.customer_code, 
    COUNT(o.order_number) AS num_of_orders
FROM orders o
INNER JOIN 
    customers c 
ON c.customer_code = o.customer_code
WHERE 
    c.country = 'France'
GROUP BY c.customer_code
ORDER BY c.customer_code;

-- Display 
--     the number of orders placed in 1996, 
--     the number of orders placed in 1997, and 
--     the difference between these two numbers. 
-- The resulting table should display the columns: orders in 1996, orders in 1997, and Difference.

WITH order_count AS (
SELECT 
	CASE 
        WHEN EXTRACT('year' FROM(order_date)) = 1996 THEN COUNT(order_number) ELSE 0 END AS orders_1996,
	CASE 
        WHEN EXTRACT('year' FROM(order_date)) = 1997 THEN COUNT(order_number) ELSE 0 END AS orders_1997
FROM orders
GROUP BY order_date
)
SELECT 
	SUM(orders_1996) AS orders_in_1996,
	SUM(orders_1997) AS orders_in_1997,
	SUM(orders_1997) - SUM(orders_1996) AS difference
FROM order_count;










