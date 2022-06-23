select d.department_id
, d.department_name
, (select count(*) from employees e where e.department_id = d.department_id) "Count"
, d.manager_id
, d.location_id
from departments d
order by d.department_name
/
