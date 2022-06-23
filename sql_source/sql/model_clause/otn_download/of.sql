SELECT year, sales
FROM sales_view
WHERE country='Italy' AND prod='Bounce' 
MODEL
  DIMENSION BY (year ) 
  MEASURES (  sale  sales) 
  RULES SEQUENTIAL ORDER  (
    sales[ANY] ORDER BY year DESC= sales[cv(year)-1]
  )
ORDER BY year
/
