SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year, sales
FROM   sales_view
WHERE  country='Italy'
MODEL     RETURN UPDATED ROWS  
  PARTITION BY (country) 
  DIMENSION BY (prod, year)
  MEASURES (sale sales) 
  RULES  (
    sales['Mouse Pad', FOR year FROM 2005 TO 2012 INCREMENT 1] =
      1.2 * sales[cv(prod), 2001]  )
ORDER BY country, prod, year
/
