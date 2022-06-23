ttitle center '***** INDEX_STATS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT name,
       height,
       blocks,
       lf_rows,
       del_lf_rows,
       distinct_keys,
       most_repeated_key
  FROM index_stats
ORDER BY name;

ttitle off

