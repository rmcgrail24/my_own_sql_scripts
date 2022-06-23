EXPLAIN PLAN
  SET STATEMENT_ID = 'an3'
FOR
SELECT department_id dept, job_id job , first_name || ' ' || last_name name , salary, dept_max_sal
  FROM (SELECT department_id, job_id, first_name, last_name,
               MAX(salary) OVER (PARTITION By job_id) job_max_sal, salary,
               MAX(salary) OVER (PARTITION By department_id) dept_max_sal
          FROM employees e
) WHERE salary = job_max_sal;

SELECT plan_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an3'));

