SELECT * 
  FROM (
    SELECT f.*, 
           count(*) OVER (PARTITION BY title, uk_release_date) ct
      FROM films f
   )
 WHERE ct > 1;
