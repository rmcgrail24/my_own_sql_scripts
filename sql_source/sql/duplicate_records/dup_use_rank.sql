DELETE FROM emp
 WHERE rowid IN (SELECT rid
                   FROM (SELECT rowid rid, 
                                RANK() OVER (PARTITION BY empno ORDER BY empno) rn
                           FROM emp)
                  WHERE rn > 1);

