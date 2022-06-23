SELECT   SUBSTR(country,1,20) country, year, localsales, dollarsales
FROM     sales_view
WHERE    country IN ( 'Canada', 'Brazil')
GROUP BY country, year
MODEL  RETURN UPDATED ROWS 
  REFERENCE conv_refmodel ON (
    SELECT country, exchange_rate AS er FROM dollar_conv)
    DIMENSION BY (country) MEASURES (er) IGNORE NAV
  MAIN  main_model     
    DIMENSION BY (country, year)
    MEASURES (SUM(sale) sales, 0  localsales, 0 dollarsales) IGNORE NAV
    RULES  (
      /* assuming that sales in  Canada grow by 22% */
      localsales['Canada', 2005] = sales[cv(country), 2001] * 1.22,
        dollarsales['Canada', 2005] = sales[cv(country), 2001] * 1.22 *
        conv_refmodel.er['Canada'],
      /* assuming that economy in Brazil grows by 34% */
      localsales['Brazil', 2005] = sales[cv(country), 2001] * 1.34,
      dollarsales['Brazil', 2005] = sales['Brazil', 2001] * 1.34 * er['Brazil']
    );
