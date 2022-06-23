select 'Employee ' || employee_id || ' quit as ' || job_id || ' on ' ||
       to_char(end_date, 'fmDay "the "ddth "of" Month YYYY') "Quitting Date"
from job_history
order by end_date
/
