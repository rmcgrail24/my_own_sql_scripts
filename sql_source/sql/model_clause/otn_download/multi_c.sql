SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year, sales
FROM   sales_view
WHERE  country='Italy'
  MODEL   RETURN UPDATED ROWS
    PARTITION BY (country) 
    DIMENSION BY (prod, year)
    MEASURES (sale sales)
    RULES (
      sales['Bounce', 2005] = 
       100 + max(sales)['Bounce', year BETWEEN 1998 AND 2002]  )
ORDER BY country, prod, year
/
