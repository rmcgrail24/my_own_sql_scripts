select department_id
, first_name || ' ' || last_name name
, salary
from (select department_id, first_name, last_name,
             max(salary) over (partition by department_id) dept_max_sal
             , salary
        from employees e)
where salary = dept_max_sal
/
