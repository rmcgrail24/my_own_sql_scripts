COLUMN country FORMAT a20
COLUMN prod FORMAT a20

SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year, sales
FROM   sales_view
WHERE   country='Italy'
  MODEL  RETURN UPDATED ROWS
    PARTITION BY (country) 
    DIMENSION BY (prod, year)
    MEASURES (sale sales)
    RULES  (
      sales['Bounce', 2000] = 10 )
ORDER BY country, prod, year
/
