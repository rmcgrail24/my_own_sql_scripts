column deferrable hea 'Deferrable?'
column deferred hea 'Deferred?'
column validated hea 'Validated?'
column generated hea 'Generated?'
column invalid format a8 hea 'Invalid?'
column bad hea 'Bad?'
column reply hea 'Reply?'

--repheader page center 'DBA CONSTRAINTS'
ttitle center '***** DBA_CONSTRAINTS View *****' -
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
  FROM dba_constraints
ORDER By constraint_name;

clear columns
ttitle off
--repheader off

