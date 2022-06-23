column object_name format a40

ttitle center "***** ALL_PROCEDURES View *****" skip 2

SELECT object_name,
       procedure_name,
       object_id,
       subprogram_id,
       object_type,
--       deterministic,
       authid
  FROM all_procedures
 WHERE owner = UPPER('&owner')
ORDER BY object_name;

clear columns
ttitle off

