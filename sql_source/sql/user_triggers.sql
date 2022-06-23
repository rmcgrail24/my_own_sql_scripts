column column_name format a50

ttitle center '***** USER_TRIGGERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT trigger_name,
       base_object_type,
--       column_name,
       trigger_type,
       action_type,
       table_name,
       status
  FROM user_triggers
ORDER BY table_name, trigger_name;

clear columns
ttitle off

