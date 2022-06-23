--column last_name hea 'LAST NAME'
--column salary hea 'MONTHLY SALARY' format $99,999
--column commission_pct hea 'COMMISSION %' format 90.90

--input
clear buffer
prompt Enter a valid Employee ID
prompt For example 145, 206
accept enumber number prompt 'Employee ID: '

select first_name, last_name, salary
  from emp_details_view
 where employee_id=&enumber;

