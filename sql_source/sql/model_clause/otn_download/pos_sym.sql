SELECT SUBSTR(country,1,20) country, 
       SUBSTR(prod,1,15) prod, year,   sales
FROM   sales_view  WHERE country IN  ('Italy','Japan') 
  MODEL  RETURN UPDATED ROWS
    PARTITION BY (country) 
    DIMENSION BY (prod, year)
    MEASURES (sale sales)
    RULES ( 
      sales['Bounce', 2002] = sales['Bounce', year = 2001] ,  
      --positional notation:  can insert new cell
      sales['Y Box', year>2000] = sales['Y Box', 1999],   
      --symbolic notation: can update existing cell
      sales['2_Products', 2005] = 
           sales['Bounce', 2001] + sales['Y Box', 2000]  )
      --positional notation:  permits insert of new cells 
      --for new product
ORDER BY country, prod, year
/
