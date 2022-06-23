column arg_obj_name new_value obj_name noprint
column referenced_owner format a20
column referenced_name format a40

ttitle center '***** Arguments Passed to ' obj_name  ' *****' -
       right 'Page: ' format 99 sql.pno

break on owner skip 1

SELECT owner,
       a.object_name arg_obj_name,
       package_name,
       argument_name,
       position,
       sequence,
       data_type,
       in_out
  FROM all_arguments a 
 WHERE a.object_name = UPPER('&object_name')
ORDER BY owner, a.object_name, position;

clear breaks
clear columns
ttitle off

