CREATE VIEW sales_view_2 AS
SELECT
 prod_name product, country_name country, channel_id channel,
 SUBSTR(calendar_quarter_desc, 6,2) quarter,
 SUM(amount_sold) amount_sold, SUM(quantity_sold) quantity_sold 
FROM sales, times, customers, countries, products
WHERE sales.time_id = times.time_id AND
  sales.prod_id = products.prod_id AND
  sales.cust_id = customers.cust_id AND
  customers.country_id = countries.country_id
GROUP BY prod_name, country_name, channel_id,
 SUBSTR(calendar_quarter_desc, 6, 2);
