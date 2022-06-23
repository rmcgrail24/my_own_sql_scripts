select mod(6, 2) from dual;

select mod(5, 3) from dual;

select mod(7, 35) from dual;

select trunc(2.75), trunc(2.79, 1), trunc (2.75, -1), trunc(-2.75), trunc(-2.79, 1), trunc(-2.75, -1), trunc(249.75, -1)
from dual;

select trunc(2.75), trunc(2.79, 1), trunc (2.75, -1), floor(2.75), ceil(2.75), round(2.75), trunc(-2.75), trunc(-2.79, 1), trunc(-2.75, -1), trunc(249.75, -1),
         floor(-2.75), ceil(-2.75), round(-2.75)
from dual;


/*
 * The formula for Oracle's implementation of the MOD function is:
 * MOD(x,y) = x - (y * TRUNC(X/Y))
*/
select mod(11, 4), mod(11, -4), mod(-11, 4), mod(-11, -4) from dual;

/*
 * The formula for Oracle's implementation of the REMAINDER function is:
 * REMAINDER(x,y) = x - (y * FLOOR(X/Y))
 *
 * Remember that the FLOOR function returns the greatest integer
 * less than or equal to a given integer
*/
select remainder(11, 4), remainder(11, -4), remainder(-11, 4), remainder(-11, -4) from dual;

select 25/7, floor(25/7), trunc(25/7), 7 * floor(25/7), 7 * trunc(25/7), 25 - 7 * floor(25/7), 25 - 7 * trunc(25/7), mod(25,7) from dual;

select -25/7, floor(-25/7), trunc(-25/7), 7 * floor(-25/7), 7 * trunc(-25/7), -25 - 7 * floor(-25/7), -25 - 7 * trunc(-25/7), mod(-25,7) from dual;

select 25/-7, floor(25/-7), trunc(25/-7), -7 * floor(25/-7), -7 * trunc(25/-7), 25 - (-7) * floor(25/-7), 25 - (-7) * trunc(25/-7), mod(25,-7) from dual;

select -25/-7, floor(-25/-7), trunc(-25/-7), -7 * floor(-25/-7), -7 * trunc(-25/-7), -25 - (-7) * floor(-25/-7), -25 - (-7) * trunc(-25/-7), mod(-25,-7) from dual;

select mod(5.2, 3), remainder(5.2, 3) from dual;

select mod(7.7, 3), remainder(7.7, 3) from dual;


select first_name, last_name, employee_id, mod(employee_id, 4) Team#
from employees
where employee_id between 100 and 111
order by employee_id;
