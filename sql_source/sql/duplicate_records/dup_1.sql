SELECT empno, count(*)
  FROM emp
GROUP BY empno
HAVING count(*) > 1
ORDER BY empno;

SELECT empno, emp_name, count(*)
  FROM emp
GROUP BY empno, emp_name
HAVING count(*) > 1
ORDER BY empno;

SELECT empno, emp_name, salary, count(*)
  FROM emp
GROUP BY empno, emp_name, salary
HAVING count(*) > 1
ORDER BY empno;

