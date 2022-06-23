ttitle center '***** DBA_SEGMENTS Count *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
break on report
compute sum label Total of count(1) blocks on report

SELECT segment_type, COUNT(1)
  FROM dba_segments
GROUP BY segment_type
ORDER BY segment_type;

ttitle off

