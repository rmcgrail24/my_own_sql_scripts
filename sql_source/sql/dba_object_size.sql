set linesize 156;
set pagesize 66;

column source_size format 999,999,999
column parsed_size format 999,999,999
column code_size format 999,999,999
column error_size format 999,999,999

break on report
compute sum label Total of source_size parsed_size code_size error_size on report

ttitle center '***** DBA_OBJECT_SIZE View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT name,
       type,
       source_size,
       parsed_size,
       code_size,
       error_size
  FROM dba_object_size
 WHERE type IN ('TYPE', 'TYPE BODY', 'VIEW',
                'PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY',
                'JAVA SOURCE', 'JAVA CLASS', 'JAVA RESOURCE')
ORDER BY name;

clear columns
ttitle off

