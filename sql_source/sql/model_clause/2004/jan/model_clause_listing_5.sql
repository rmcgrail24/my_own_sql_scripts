SELECT c, i, y, m, r, nr
  FROM book_sales s
      PARTITION BY (s.country, s.isbn)
      RIGHT OUTER JOIN month mo ON (s.month = mo.m AND s.year = mo.y)
 WHERE mo.y IN (2002, 2003, 2004)
MODEL
   REFERENCE money ON
       (SELECT country, to_us
          FROM currency)
       DIMENSION BY (country) MEASURES (to_us) 
   PARTITION BY (s.country c)
   DIMENSION BY (s.isbn i, mo.y y, mo.m m)
   MEASURES (s.net_revenue r, CAST(NULL AS NUMBER) nr, s.country cc)
   RULES (
      --Generate monthly sales for missing months (densification)
      nr[ANY, ANY, ANY]
         = CASE WHEN r[CV(), CV(), CV()] IS NOT NULL
              THEN r[CV(), CV(), CV()]
              ELSE ROUND(AVG(r)[CV(), CV(), m BETWEEN 1 AND 12],2)
           END,
      --Project 2003's Q2 to Q3 trend into Q4
      nr[ANY, 2003, m BETWEEN 10 AND 12]
         = ROUND((((SUM(nr)[CV(), 2003, m BETWEEN 7 AND 9]
         - SUM(nr)[CV(), 2003, m BETWEEN 4 AND 6])
         / SUM(nr)[CV(), 2003, m BETWEEN 4 AND 6])
         * SUM(nr)[CV(), 2003, m BETWEEN 7 AND 9]
         + SUM(nr)[CV(), 2003, m BETWEEN 7 AND 9])/3,2),
      --Project 2004 sales
      nr[ANY, 2004, ANY] = ROUND(
         ((nr[CV(), 2003, CV()] - nr[CV(), 2002, CV()])
          / nr[CV(), 2002, CV()] * nr[CV(), 2003, CV()])
         + nr[CV(), 2003, CV()], 2),
      --Convert all 2004 monetary values to U.S. dollars
      nr[ANY, 2004, ANY]
         = ROUND(nr[CV(), CV(), CV()]
         * money.to_us[cc[CV(), CV(), CV()]], 2)
   )
ORDER BY c, i, y, m;

