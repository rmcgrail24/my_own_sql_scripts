select first_name
, last_name
, department_id
, salary
from (select first_name, last_name, department_id, salary,
             max(salary) over (partition by department_id) dep_max_sal
        from employees)
where salary = dep_max_sal;