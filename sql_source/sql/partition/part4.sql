select department_id dept
, job_id
, first_name || ' ' || last_name name
, salary
, dept_max_sal
from (select department_id, job_id, first_name, last_name,
             max(salary) over (partition by job_id) job_max_sal
             , salary
             , max(salary) over (partition by department_id) dept_max_sal
        from employees e)
where salary = job_max_sal
/
