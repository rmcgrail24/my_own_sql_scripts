select department_id
, job_id
, first_name
, last_name
, salary
, dept_rank
from (select department_id
, job_id
, first_name
, last_name
, salary
, dense_rank() over (partition by department_id
               order by salary desc) dept_rank
from employees)
where dept_rank <= 5
order by department_id, dept_rank desc;
