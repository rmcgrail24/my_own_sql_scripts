select department_id dept
, job_id
, first_name || ' ' || last_name name
, salary
, dept_rank
, hire_date
, case when salary < lead (salary) over (partition by department_id order by hire_date)
     then 'No'
     else 'Yes'
  end seniority_salary
from (select department_id, job_id, first_name, last_name, hire_date, salary
             , dense_rank () over (partition by department_id order by salary desc) dept_rank
        from employees)
where dept_rank <= 5
order by dept, dept_rank desc
/
