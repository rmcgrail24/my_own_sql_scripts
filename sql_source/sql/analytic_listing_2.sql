EXPLAIN PLAN
  SET STATEMENT_ID = 'an2'
FOR
SELECT job_id job , first_name || ' ' || last_name name , salary
  FROM (SELECT job_id, first_name, last_name,
               MAX(salary) OVER (PARTITION By job_id) job_max_sal, salary
          FROM employees e
) WHERE salary = job_max_sal;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an2'));

