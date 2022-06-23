select department_id dept
, job_id
, first_name || ' ' || last_name name
, salary
, dept_rank
from (select department_id, job_id, first_name, last_name, salary
             , rank () over (partition by department_id order by salary desc) dept_rank
        from employees)
where dept_rank <= 5
order by dept, dept_rank desc
/
