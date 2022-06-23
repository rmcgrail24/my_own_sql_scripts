SELECT c, i, y, m, r, nr
  FROM book_sales s
 WHERE s.year IN (2002, 2003)
MODEL
   PARTITION BY (country c)
   DIMENSION BY (isbn i, year y, month m)
   MEASURES (s.net_revenue r, CAST(NULL AS NUMBER) nr)
   RULES (
      --Generate monthly sales for missing months (densification)
      nr[FOR I IN (SELECT isbn FROM book),
         FOR y FROM 2002 TO 2003 INCREMENT 1,
         FOR m FROM 1 TO 12 INCREMENT 1]
         = CASE WHEN r[CV(), CV(), CV()] IS PRESENT
              THEN r[CV(), CV(), CV()]
              ELSE ROUND(AVG(r)[CV(), CV(), m BETWEEN 1 AND 12],2)
           END
   )
ORDER BY c, i, y, m;

