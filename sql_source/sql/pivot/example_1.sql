SELECT * FROM
  (SELECT product, channel, amount_sold
   FROM sales_view_2
   ) S PIVOT (SUM(amount_sold)
   FOR CHANNEL IN (3 AS DIRECT_SALES, 4 AS INTERNET_SALES, 
                   5 AS CATALOG_SALES, 9 AS TELESALES))
ORDER BY product;
