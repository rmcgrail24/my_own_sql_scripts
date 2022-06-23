column deferrable hea 'Deferrable?'
column deferred hea 'Deferred?'
column validated hea 'Validated?'
column invalid format a8 hea 'Invalid?'

--repheader page center 'USER CONSTRAINTS'
ttitle center '***** USER_CONSTRAINTS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT constraint_name,
       constraint_type,
       table_name,
       status,
       deferrable,
       deferred,
       validated,
       index_name,
       invalid
  FROM user_constraints
ORDER By constraint_name;

clear columns
ttitle off
--repheader off

