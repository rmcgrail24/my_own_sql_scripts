select first_name
, last_name
, department_id
, salary
from (select first_name, last_name, department_id, max(salary) salary
        from employees
      group by first_name, last_name, department_id)
order by department_id;