select plan_table_output from table(dbms_xplan.display());

explain plan for
select /*+ full(e) */employee_id
  from employees e;

explain plan for
select /*+ full(e) */ employee_id,
       phone_number
  from employees e
where employee_id in (200,201,202,203,204,205,206);


explain plan for
select /*+ full(e) */
employee_id,
       phone_number
  from employees e
where employee_id > 199;


explain plan for
select /*+ index_desc(e emp_emp_id_pk) */ employee_id,
       phone_number
  from employees e
where employee_id in (200,201,202,203,204,205,206);

SELECT *
  FROM (SELECT department_name, SUM(salary) dept_total
          FROM employees e, departments d
         WHERE e.department_id = d.department_id
        GROUP BY department_name)
 WHERE dept_total > (SELECT avg
                       FROM (SELECT SUM(dept_total)/COUNT(*) avg
                               FROM (SELECT department_name, SUM(salary) dept_total
                                       FROM employees e, departments d
                                      WHERE e.department_id = d.department_id
                                     GROUP BY department_name)
                            )
                    )
ORDER BY department_name;

WITH dept_costs AS (
      SELECT department_name, SUM(salary) dept_total
        FROM employees e, departments d
       WHERE e.department_id = d.department_id
      GROUP BY department_name),
   avg_cost AS (
      SELECT SUM(dept_total)/COUNT(*) avg
       FROM dept_costs)
SELECT * FROM dept_costs
 WHERE dept_total >
      (SELECT avg FROM avg_cost)
ORDER BY department_name;

