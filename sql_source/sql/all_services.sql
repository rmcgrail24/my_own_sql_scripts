ttitle center '***** ALL_SERVICES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT service_id,
       name,
       name_hash,
       creation_date,
       goal
  FROM all_services
ORDER BY name;

ttitle off

