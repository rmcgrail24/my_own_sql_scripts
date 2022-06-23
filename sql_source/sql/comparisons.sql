SELECT * FROM employees
where salary > all (0, 300, 900, 1100);

SELECT * FROM employees WHERE salary > 0;
SELECT * FROM employees WHERE salary > ALL (0, 6000);
SELECT * FROM employees WHERE salary > ALL (0, 6000, NULL);
SELECT * FROM employees WHERE salary > ALL (0,6000,(SELECT NULL FROM dual));
SELECT * FROM employees WHERE salary > ANY (0, 6000);
SELECT * FROM employees WHERE salary > ANY (0, 6000, NULL);
SELECT * FROM employees WHERE salary > NULL;

SELECT NULL FROM dual;

SELECT * FROM employees WHERE salary > 0;
SELECT * FROM employees WHERE salary > 0 AND salary > 6000;
SELECT * FROM employees WHERE salary > 0 AND salary > 6000 AND salary > NULL;
SELECT * FROM employees WHERE salary > 0 OR salary > 6000;
SELECT * FROM employees WHERE salary > 0 OR salary > 6000 OR salary > NULL;
SELECT * FROM employees WHERE salary > NULL;

