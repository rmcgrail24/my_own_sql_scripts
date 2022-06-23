column name new_value obj_name noprint
column owner format a20
column referenced_owner format a20
column referenced_name format a40

ttitle center '***** ALL_DEPENDENCIES View *****' -
       right 'Page: ' format 99 sql.pno -
       skip center 'for ' obj_name skip 2
 
break on name skip page on type on referenced_owner on referenced_type skip 1

SELECT owner,
       name,
       type,
       referenced_owner,
       referenced_name,
       referenced_type
  FROM all_dependencies
 WHERE name = UPPER('&name')
   AND referenced_owner != 'SYS'
ORDER BY name, owner, referenced_owner, referenced_type, referenced_name;

clear breaks
clear columns
ttitle off

