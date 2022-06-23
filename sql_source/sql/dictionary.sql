repheader page center 'DATA DICTIONARY'
ttitle center '***** DICTIONARY View *****' -
       right 'Page: ' format 99 sql.pno skip 2

column comments format a80

SELECT *
  FROM dictionary
ORDER By table_name;

clear columns
ttitle off
repheader off

