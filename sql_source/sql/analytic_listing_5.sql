EXPLAIN PLAN
  SET STATEMENT_ID = 'an5'
FOR
SELECT department_id dept, job_id job , first_name || ' ' || last_name name , salary, dept_rank
  FROM (SELECT department_id, job_id, first_name, last_name, salary,
               DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) dept_rank
          FROM employees e
) WHERE dept_rank <= 5
ORDER BY dept, dept_rank DESC;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an5'));

