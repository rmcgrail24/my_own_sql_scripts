ttitle center '***** DBA_VIEWS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT view_name,
       owner,
       text_length,
       view_type,
       superview_name
  FROM dba_views
ORDER BY view_name;

clear columns
ttitle off

