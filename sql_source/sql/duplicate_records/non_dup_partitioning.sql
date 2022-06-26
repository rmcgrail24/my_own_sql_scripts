-- Find the fourth through seventh top salaries in each department

SELECT department_id, first_name, last_name, salary
FROM
(
SELECT department_id, first_name, last_name, salary,
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) rn
 FROM employees
)
WHERE 3 < rn and rn <= 7
ORDER BY department_id, salary DESC, last_name;