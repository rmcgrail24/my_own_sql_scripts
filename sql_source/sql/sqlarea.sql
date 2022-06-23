SELECT sql_id,
       sql_text
  FROM v$sqlarea
 WHERE rownum < 4;

