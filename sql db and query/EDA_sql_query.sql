--Maven Pizza Exploratory Data Analyis in SQL

--How many customers do we have each day?
SELECT DATE(date) AS order_date, COUNT(DISTINCT order_id) AS customer_count
FROM all_pizza_data
GROUP BY DATE(date)
ORDER BY DATE(date);

--Average Customer Count by Day of Week in Descending Order
SELECT DATE_PART('dow', date) AS day_of_week, AVG(order_count) AS average_order_count
FROM (
  SELECT DATE(date) AS date, COUNT(DISTINCT order_id) AS order_count
  FROM all_pizza_data
  GROUP BY DATE(date)
) AS subquery
GROUP BY day_of_week
ORDER BY average_order_count DESC;

--Peak Hours
SELECT EXTRACT(HOUR FROM "time") AS hour, COUNT(DISTINCT order_id) AS order_count
FROM all_pizza_data
GROUP BY hour
ORDER BY hour;

--How many pizzas are typically in an order
SELECT AVG(quantity) AS average_pizzas_per_order
FROM all_pizza_data;

--Top 5 Best Selling Pizzas
SELECT name AS pizza_name, SUM(quantity) AS total_quantity_sold
FROM all_pizza_data
GROUP BY name
ORDER BY total_quantity_sold DESC
LIMIT 5;

--5 Worst Selling Pizzas
SELECT name AS pizza_name, SUM(quantity) AS total_quantity_sold
FROM all_pizza_data
GROUP BY name
ORDER BY total_quantity_sold ASC
LIMIT 5;

--How much money made this year
SELECT SUM(quantity * price) AS total_revenue
FROM all_pizza_data;

--How many customers per season
SELECT
  CASE 
    WHEN EXTRACT(MONTH FROM date) IN (3, 4, 5) THEN 'Spring'
    WHEN EXTRACT(MONTH FROM date) IN (6, 7, 8) THEN 'Summer'
    WHEN EXTRACT(MONTH FROM date) IN (9, 10, 11) THEN 'Fall'
    WHEN EXTRACT(MONTH FROM date) IN (12, 1, 2) THEN 'Winter'
  END AS season,
  COUNT(DISTINCT order_id) AS customer_count
FROM all_pizza_data
GROUP BY season;

--Revenue Per Month
SELECT DATE_TRUNC('month', date) AS month, SUM(quantity * price) AS monthly_revenue
FROM all_pizza_data
GROUP BY month
ORDER BY month;