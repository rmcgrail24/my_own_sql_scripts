select job_id
, first_name || ' ' || last_name name
, salary
from (select job_id, first_name, last_name,
             max(salary) over (partition by job_id) job_max_sal
             , salary
        from employees e)
where salary = job_max_sal
/
