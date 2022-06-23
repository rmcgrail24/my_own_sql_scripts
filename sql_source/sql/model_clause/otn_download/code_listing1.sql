SELECT c, i, y, m, r
  FROM book_sales s
 WHERE s.year IN (2002, 2003)
MODEL
    PARTITION BY (country c)
    DIMENSION BY (isbn i, year y, month m)
    MEASURES (s.net_revenue r)
    RULES (
       r['1-56592-948-9',2004,1] = ROUND(
          ((r['1-56592-948-9',2003,1] - r['1-56592-948-9',2002,1])
            / r['1-56592-948-9',2002,1]) * r['1-56592-948-9',2003,1]
          + r['1-56592-948-9',2003,1],2))
ORDER BY c, i, y, m;

