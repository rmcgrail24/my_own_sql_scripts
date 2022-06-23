repheader page center 'ALL CATALOG'
ttitle center '***** ALL_CATALOG View *****' -
       right 'Page: ' format 999 sql.pno skip 2

SELECT *
  FROM all_catalog
ORDER By table_name;

ttitle off
repheader off

