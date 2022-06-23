column creation_date hea "Creation|Date"

ttitle center '***** V$ACTIVE_SERVICES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT service_id,
       name,
       name_hash,
       creation_date,
       goal
  FROM v$active_services
ORDER BY name;
clear columns
ttitle off

