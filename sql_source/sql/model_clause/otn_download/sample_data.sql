CREATE VIEW sales_view AS
   SELECT country_name country, prod_name prod, calendar_year year,
          SUM(amount_sold) sale, COUNT(amount_sold) cnt
   FROM   sales, times, customers, countries, products
   WHERE  sales.time_id = times.time_id AND
          sales.prod_id = products.prod_id 
   AND    sales.cust_id = customers.cust_id
   AND    customers.country_id = countries.country_id
   GROUP BY country_name, prod_name, calendar_year
/
