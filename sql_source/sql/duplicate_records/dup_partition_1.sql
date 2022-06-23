SELECT e.*,
       count(*) OVER (PARTITION BY empno ORDER BY empno) ct
  FROM emp e;

SELECT *
  FROM (SELECT e.*,
               count(*) OVER (PARTITION BY empno ORDER BY empno) ct
                         FROM emp e)
 WHERE ct > 1;