SELECT dbms_advisor.get_task_report(task_name)
  FROM dba_advisor_tasks
 WHERE task_id = (SELECT MAX(t.task_id)
                    FROM dba_advisor_tasks T JOIN dba_advisor_log l ON (t.task_id = l.task_id)
                   WHERE t.advisor_name = 'SPM Evolve Advisor'
                     AND l.status = 'COMPLETED');
