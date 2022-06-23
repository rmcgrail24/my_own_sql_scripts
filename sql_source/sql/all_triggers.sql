ttitle center '***** ALL_TRIGGERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT owner,
       trigger_name,
       base_object_type,
       trigger_type,
       action_type,
       table_name,
       status
  FROM all_triggers
ORDER BY table_name, trigger_name;

ttitle off

