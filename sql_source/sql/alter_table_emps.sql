ALTER TABLE emps ADD (hired DATE);

ALTER TABLE emps MODIFY (hired DEFAULT SYSDATE);

INSERT INTO emps (empno, ename) VALUES(99, 'Newman');

SELECT hired, COUNT(1)
  FROM emps
GROUP BY hired;

