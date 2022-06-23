SELECT   SUBSTR(country,1,20) country, year, localsales, dollarsales
FROM     sales_view
WHERE    country IN  ('Canada','Brazil')
GROUP BY country, year
MODEL  RETURN UPDATED ROWS 
  REFERENCE conv_refmodel  ON  (
    SELECT country, exchange_rate FROM dollar_conv)
    DIMENSION BY (country c) 
    MEASURES (exchange_rate er) IGNORE NAV
  REFERENCE growth_refmodel ON  ( 
    SELECT country, year, growth_rate FROM growth_rate)
    DIMENSION BY (country c, year y) 
    MEASURES (growth_rate gr) IGNORE NAV
  MAIN  main_model 
    DIMENSION BY (country, year) 
    MEASURES (SUM(sale) sales, 0 localsales, 0  dollarsales) IGNORE NAV
    RULES  (
      localsales[FOR country IN ('Brazil', 'Canada'), 2002] = 
        sales[cv(country), 2001] *
        (100 + gr[cv(country), cv(year)])/100  ,
      dollarsales[FOR country IN ('Brazil', 'Canada'),2002] = 
        sales[cv(country), 2001] *
        (100 + gr[cv(country), cv(year)])/100  *
        er[cv(country)]
    )
/
