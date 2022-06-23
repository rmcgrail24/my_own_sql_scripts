SELECT c, i, y, m, r, nr
  FROM book_sales s
      PARTITION BY (s.country, s.isbn)
      RIGHT OUTER JOIN month mo ON (s.month = mo.m AND s.year = mo.y)
 WHERE mo.y IN (2002, 2003)
MODEL
   PARTITION BY (s.country c)
   DIMENSION BY (s.isbn i, mo.y y, mo.m m)
   MEASURES (s.net_revenue r, CAST(NULL AS NUMBER) nr)
   RULES (
      --Generate monthly sales for missing months (densification)
      nr[ANY, ANY, ANY]
         = CASE WHEN r[CV(), CV(), CV()] IS NOT NULL
              THEN r[CV(), CV(), CV()]
              ELSE ROUND(AVG(r)[CV(), CV(), m BETWEEN 1 AND 12],2)
           END
   )
ORDER BY c, i, y, m;

