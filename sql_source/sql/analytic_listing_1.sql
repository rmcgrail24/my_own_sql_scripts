EXPLAIN PLAN
  SET STATEMENT_ID = 'an1'
FOR
SELECT department_id dept , first_name || ' ' || last_name name , salary
  FROM (SELECT department_id, first_name, last_name,
               MAX(salary) OVER (PARTITION By department_id) dept_max_sal, salary
          FROM employees e
) WHERE salary = dept_max_sal;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an1'));

