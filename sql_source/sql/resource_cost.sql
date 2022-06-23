ttitle center '***** RESOURCE_COST View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM resource_cost
ORDER BY resource_name;

clear columns
ttitle off

