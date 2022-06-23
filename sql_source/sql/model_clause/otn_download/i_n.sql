SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year, sales
FROM   sales_view
WHERE  country='Italy'
MODEL     IGNORE NAV  RETURN UPDATED ROWS  
  PARTITION BY (country) 
  DIMENSION BY (prod, year)
  MEASURES (sale sales)
  RULES  (
    sales['Mouse Pad', 2005] = 
    sales['Mouse Pad', 1999] + sales['Mouse Pad', 2004])
ORDER BY country, prod, year;
