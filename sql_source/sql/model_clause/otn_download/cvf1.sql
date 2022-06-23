SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year, sales
FROM   sales_view
WHERE  country='Italy'
  MODEL   RETURN UPDATED ROWS
    PARTITION BY (country) 
    DIMENSION BY (prod, year)
    MEASURES (sale sales)
    RULES (
      sales['Bounce', year BETWEEN 1995 AND 2002] =
        sales['Mouse Pad', cv(year)] + 
        0.2 * sales['Y Box', cv(year)])
ORDER BY country, prod, year
/
