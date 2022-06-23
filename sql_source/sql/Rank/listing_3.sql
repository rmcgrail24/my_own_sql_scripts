select department_id
, job_id
, first_name
, last_name
, salary
, dept_max_sal
from (select department_id
, first_name
, last_name
, job_id
, salary
, max(salary) over (partition by job_id) job_max_sal
, max(salary) over (partition by department_id) dept_max_sal
from employees)
where salary = job_max_sal;
