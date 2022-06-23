column line format a100;

ttitle center '***** ALL_SOURCE View *****' -
       right 'Page: ' format 99 sql.pno skip -

SELECT line,
       text
  FROM all_source
 WHERE LOWER(name) = LOWER('&name')
ORDER BY line
/
clear columns
ttitle off

