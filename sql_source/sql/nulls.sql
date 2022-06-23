/*
DROP TABLE dept_m;

CREATE TABLE dept_m
(deptno number not null,
 dname  varchar2(30) not null,
 loc    varchar2(30) not null
);

INSERT INTO dept_m VALUES (10, 'HQ', 'UTRECHT');
INSERT INTO dept_m VALUES (20, 'SALES', 'MUNISING');
INSERT INTO dept_m VALUES (30, 'MANUFACTURING', 'NOVOSIBIRSK');
COMMIT;

DROP TABLE emp_m;

CREATE TABLE emp_m
(empno  number not null,
 ename  varchar2(30) not null,
 job    varchar2(30),
 mgr    number,
 sal    number,
 comm   number,
 deptno number
);

INSERT INTO emp_m VALUES (100, 'NORGAARD', 'PRESIDENT', NULL, 5000, NULL, 10);
INSERT INTO emp_m VALUES (122, 'LEWIS', 'SALESREP', 120, 5000, NULL, NULL);
INSERT INTO emp_m VALUES (199, 'GENNICK', NULL, NULL, 2200, NULL, 10);
INSERT INTO emp_m VALUES (111, 'DE HAAN', 'CLERK', 110, 2200, NULL, NULL);
INSERT INTO emp_m VALUES (112, 'MILLSAP', 'SALESREP', 110, 1250, 1400, 20);
INSERT INTO emp_m VALUES (110, 'ADAMS', 'MANAGER', 100, NULL, 1700, 20);
INSERT INTO emp_m VALUES (120, 'KOLK', 'MANAGER', 100, 2450, NULL, 10);
INSERT INTO emp_m VALUES (113, 'MCDONALD', 'SALESREP', 110, 1500, NULL, 20);
INSERT INTO emp_m VALUES (121, 'WOOD', 'CLERK', 120, 1300, NULL, 10);
INSERT INTO emp_m VALUES (130, 'MORLE', 'CLERK', 100, NULL, NULL, 10);
COMMIT;

--Code Listing 2: Null in, null out, and the result of COALESCE
prompt SELECT empno, ename, sal, sal + 1000 FROM emp_m;
SELECT empno, ename, sal, sal + 1000 FROM emp_m;

prompt SELECT empno, ename, sal, COALESCE(sal, 0) + 1000 FROM emp_m;
SELECT empno, ename, sal, COALESCE(sal, 0) + 1000 FROM emp_m;

--Code Listing 3: WHERE comm = comm is not equal
prompt SELECT * FROM emp_m WHERE comm = comm;
SELECT * FROM emp_m WHERE comm = comm;

--Code Listing 4: Outer joins generate nulls
prompt SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
prompt   FROM emp_m e RIGHT OUTER JOIN dept_m d ON  e.deptno = d.deptno;
SELECT e.empno, e.ename, e.deptno, d.deptno, d.dname
  FROM emp_m e RIGHT OUTER JOIN dept_m d ON  e.deptno = d.deptno;

--Code Lisging 5: SUM(A+B) is not the same as SUM(A) + SUM(B)
prompt Code Lisging 5: SUM(A+B) is not the same as SUM(A) + SUM(B)
prompt SELECT SUM(sal + comm), SUM(sal) + SUM(comm) FROM emp_m;
SELECT SUM(sal + comm), SUM(sal) + SUM(comm) FROM emp_m;

--Code Listing 6: Who has no subordinates?
prompt Code Listing 6: Who has no subordinates?
SELECT e1.ename
 FROM  emp_m e1
 WHERE e1.empno NOT IN (SELECT e2.mgr FROM emp_m e2);

SELECT e1.ename
 FROM  emp_m e1
 WHERE EXISTS (SELECT e2.* FROM emp_m e2 WHERE e2.mgr = e1.empno);

--Code Listing 7: Aggregate functions and the empty set
prompt Code Listing 7: Aggregate functions and the empty set
SELECT COUNT(empno), AVG(empno), SUM(empno), MAX(empno), MIN(empno)
  FROM emp_m
 WHERE 1 = 2;
*/
--Code Listing 8: Who has a higher salary?
prompt Code Listing 8: Who has a higher salary?
SELECT e1.ename
  FROM emp_m e1
 WHERE e1.sal > (SELECT MAX(e2.sal)
                   FROM emp_m e2
                  WHERE e2.deptno = 10
                    AND e2.job = 'SALESREP');

SELECT e1.ename
  FROM emp_m e1
 WHERE e1.sal > ALL (SELECT e2.sal
                   FROM emp_m e2
                  WHERE e2.deptno = 10
                    AND e2.job = 'SALESREP');

