SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year, sales, growth
FROM   sales_view
WHERE   country='Italy'
MODEL     RETURN UPDATED ROWS  
  PARTITION BY (country) 
  DIMENSION BY (prod, year)
  MEASURES (sale sales, 0 growth)
  RULES  (
    growth[prod in ('Bounce','Y Box','Mouse Pad'), year between 1998 and 2001] =
      100* (sales[cv(prod), cv(year)] - 
      sales[cv(prod), cv(year) -1] ) /  
      sales[cv(prod), cv(year) -1] )
ORDER BY country, prod, year
/
