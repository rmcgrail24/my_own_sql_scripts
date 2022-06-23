select department_id
, first_name
, last_name
, salary
from (select first_name
, last_name
, department_id
, salary
, max(salary) over (partition by department_id) dept_max_sal
from employees)
where salary = dept_max_sal;
