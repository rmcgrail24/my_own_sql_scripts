/* Formatted by PL/Formatter v3.0.5.0 on 2000/06/28 11:16 */

SET LINESIZE 120
SET PAGESIZE 99
COLUMN refs_table FORMAT A40
COLUMN table_referenced FORMAT A40
BREAK ON refs_table SKIP 1

SELECT owner || '.' || name refs_table,
       referenced_owner || '.' || referenced_name table_referenced
  FROM all_dependencies
 WHERE owner LIKE UPPER ('&1')
   AND TYPE IN (
                  'PACKAGE',
                  'PACKAGE BODY',
                  'PROCEDURE',
                  'FUNCTION'
               )
   AND referenced_type IN ('TABLE', 'VIEW')
 ORDER BY owner,
          name,
          referenced_owner,
          referenced_name;