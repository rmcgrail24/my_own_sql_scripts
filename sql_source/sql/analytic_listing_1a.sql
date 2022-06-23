EXPLAIN PLAN
  SET STATEMENT_ID = 'an1a'
FOR
SELECT department_id, first_name, last_name,
               MAX(salary) OVER (PARTITION By department_id) dept_max_sal, salary
  FROM employees e;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an1a'));

