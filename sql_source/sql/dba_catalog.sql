repheader page center 'DBA CATALOG'
ttitle center '***** DBA_CATALOG View *****' -
       right 'Page: ' format 999 sql.pno skip 2

SELECT *
  FROM dba_catalog
ORDER By table_name;

ttitle off
repheader off

