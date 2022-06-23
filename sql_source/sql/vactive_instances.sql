repheader page center 'ALL INSTANCES'
ttitle center '***** ALL_INSTANCES View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT *
  FROM all_instancess;

ttitle off
repheader off

