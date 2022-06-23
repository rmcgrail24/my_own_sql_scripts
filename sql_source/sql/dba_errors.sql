column name new_value obj_name noprint
column owner format a20
column text format a60

ttitle center '***** ALL_ERRORS View *****' -
       right 'Page: ' format 99 sql.pno -
       skip center 'for ' obj_name skip 2
 
break on name skip page on type on owner

SELECT owner,
       name,
       type,
       line,
       position,
       text
  FROM all_dependencies
 WHERE name = UPPER('&name')
   AND owner != 'SYS'
ORDER BY name, owner;

clear breaks
clear columns
ttitle off

