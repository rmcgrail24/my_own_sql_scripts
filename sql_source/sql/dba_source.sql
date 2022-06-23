column line format a100;

ttitle center '***** DBA_SOURCE View *****' -
       right 'Page: ' format 99 sql.pno skip -

SELECT line,
       text
  FROM dba_source
 WHERE LOWER(name) = LOWER('&name')
   AND LOWER(owner) = LOWER('&owner')
ORDER BY line
/
clear columns
ttitle off

