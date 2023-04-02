/* 1. How many customers do we have eah day on average? */
SELECT 
    COUNT(order_id) / COUNT(DISTINCT date) AS AvgCustomersPerDay
FROM
    orders;

/* 2. How many pizzas are typically in an order? Do we have any bestsellers? */
SELECT 
    COUNT(order_details_id) / COUNT(DISTINCT order_id) AS PizzasPerOrder
FROM
    order_details;
    
-- Bestsellers
SELECT 
    pizza_id, COUNT(pizza_id) AS Pizza
FROM
    order_details
GROUP BY 1
ORDER BY 2 DESC;

/* 3. Are there any peak hours? */
SELECT 
    HOUR(time) AS Hour, COUNT(order_id) AS Orders
FROM
    orders
GROUP BY 1
ORDER BY 2 DESC;

/* 4. Are there any crest hours */
SELECT 
    HOUR(time) AS Hour, COUNT(order_id) AS Orders
FROM
    orders
GROUP BY 1
ORDER BY 2;

/* 5. Are there any peak days? */
-- Order by day of Month 
SELECT 
    Day(date) AS Day, COUNT(order_id) AS Orders
FROM
    orders
GROUP BY 1
ORDER BY 2 DESC;

-- Day with most sales
SELECT 
    date, COUNT(order_id) AS NumberOfOrders
FROM
    orders
GROUP BY 1
ORDER BY 2 DESC;

/* 6. Are there any creast days? */
-- Day with least sales
SELECT 
    date, COUNT(order_id) AS NumberOfOrders
FROM
    orders
GROUP BY 1
ORDER BY 2;

/* 7. Which pizza generated the most revenue? The least? */
SELECT 
    order_details.pizza_id,
    price * COUNT(order_details.pizza_id) AS Revenue
FROM
    order_details
        LEFT JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY 1 , price
ORDER BY 2 DESC;

/* How much money did we make this year? */
SELECT 
    ROUND(SUM(price * quantity),2) AS Revenue
FROM
    order_details
        LEFT JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

-- Tables 
SELECT *
FROM order_details;

SELECT *
FROM orders;

SELECT *
FROM pizzas;

SELECT *
FROM pizza_types;
