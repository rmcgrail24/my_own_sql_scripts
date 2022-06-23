SELECT TO_CHAR(end_date, 'YYYY') "Quitting Year",
       job_id,
       COUNT(*) "Number of Employees"
  FROM job_history
GROUP BY TO_CHAR(end_date, 'YYYY'), job_id
ORDER BY COUNT(*) DESC;

SELECT EXTRACT(YEAR FROM end_date) "Quitting Year",
       job_id,
       COUNT(*) "Number of Employees"
  FROM job_history
GROUP BY EXTRACT(YEAR FROM end_date), job_id
ORDER BY COUNT(*) DESC;
