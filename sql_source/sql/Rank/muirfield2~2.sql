select first_name
, last_name
, department_id
, max(salary)
from employees
group by first_name, last_name, department_id
order by department_id, max(salary) desc;