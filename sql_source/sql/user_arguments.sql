column arg_obj_name new_value obj_name noprint
column referenced_owner format a20
column referenced_name format a40

ttitle center '***** Arguments Passed to ' obj_name  ' *****' -
       right 'Page: ' format 99 sql.pno

SELECT a.object_name arg_obj_name,
       package_name,
       argument_name,
       position,
       sequence,
       data_level,
       data_type,
       in_out
  FROM user_arguments a 
 WHERE a.object_name = UPPER('&object_name')
ORDER BY a.object_name, position;

clear breaks
clear columns
ttitle off

