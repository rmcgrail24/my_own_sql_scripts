column deferrable hea 'Deferrable?'
column deferred hea 'Deferred?'
column validated hea 'Validated?'
column invalid format a8 hea 'Invalid?'

--repheader page center 'ALL CONSTRAINTS'
ttitle center '***** ALL_CONSTRAINTS View *****' -
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
  FROM all_constraints
 WHERE table_name = UPPER('&table_name')
ORDER By constraint_name;

clear columns
ttitle off
--repheader off

