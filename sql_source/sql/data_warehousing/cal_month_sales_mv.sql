CREATE MATERIALIZED VIEW cal_month_sales_mv
BUILD IMMEDIATE
REFRESH FORCE
ENABLE QUERY REWRITE AS
SELECT  t.calendar_month_desc, SUM(s.amount_sold) AS dollars
  FROM sales s, times t
 WHERE s.time_id = t.time_id
GROUP BY t.calendar_month_desc;
