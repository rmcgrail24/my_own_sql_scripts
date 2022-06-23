CREATE TABLE emps
(
  empno     NUMBER,
  ename     VARCHAR2(25),
  salary    NUMBER,
  deptno    NUMBER(4,0)
);

INSERT INTO emps
    SELECT employee_id, last_name, salary, department_id
      FROM  employees;

COMMIT;

