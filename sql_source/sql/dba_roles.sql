ttitle center '***** DBA_ROLES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM dba_roles
ORDER BY role;

ttitle off

