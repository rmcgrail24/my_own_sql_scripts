EXPLAIN PLAN
  SET STATEMENT_ID = 'an6'
FOR
SELECT department_id dept, job_id, first_name || ' ' || last_name name, salary, dept_rank, hire_date,
       CASE WHEN salary < LEAD(salary) OVER (PARTITION BY department_id ORDER BY hire_date)
               THEN 'No'
               ELSE 'Yes'
       END seniority_salary
  FROM (SELECT department_id, job_id, first_name, last_name, hire_date, salary,
               DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) dept_rank
          FROM employees
       )
 WHERE dept_rank <= 5
ORDER BY dept, dept_rank DESC;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an6'));

