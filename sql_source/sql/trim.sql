column tr1 hea "Trimmed|Leading Zero"
column tr2 hea "Better|Trimmed"

SELECT employee_id,
       hire_date,
       TO_CHAR(TRIM(LEADING 0 FROM hire_date)) tr1,
       TO_CHAR(hire_date, 'fmmm/dd/yy') tr2,
       TO_CHAR(hire_date,'Month fmdd, yyyy')
  FROM employees
 WHERE department_id = 60
ORDER BY employee_id;

clear columns

