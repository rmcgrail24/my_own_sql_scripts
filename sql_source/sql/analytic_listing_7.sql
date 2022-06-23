EXPLAIN PLAN
  SET STATEMENT_ID = 'an7'
FOR
SELECT department_id dept, job_id, first_name || ' ' || last_name name, salary, dept_rank, hire_date,
       CASE WHEN salary < LEAD(salary) OVER (PARTITION BY department_id ORDER BY hire_date)
               THEN 'No'
               ELSE 'Yes'
       END seniority_salary,
       moving_average
  FROM (SELECT department_id, job_id, first_name, last_name, hire_date, salary,
               DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) dept_rank,
               ROUND(AVG(salary) OVER (ORDER BY hire_date
                                       RANGE BETWEEN hire_date - ADD_MONTHS(hire_date, -6) PRECEDING
                                                 AND ADD_MONTHS(hire_date, 6) - hire_date FOLLOWING)) moving_average
          FROM employees
       )
 WHERE dept_rank <= 5
ORDER BY dept, dept_rank DESC;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an7'));

