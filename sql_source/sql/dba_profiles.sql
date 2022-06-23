break on profile skip 1;

ttitle center '***** DBA_PROFILES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 

SELECT *
  FROM dba_profiles
ORDER BY profile, resource_name;

clear breaks
ttitle off

