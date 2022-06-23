--set define off

SELECT dbms_metadata.get_ddl(UPPER('&object_type')
                           , UPPER('&object_name')
--                           , UPPER('schema')    -- default NULL
--                           , UPPER('version')   -- default 'COMPATIBLE'
--                           , UPPER('model')     -- default 'ORACLE'
--                           , UPPER('transform') -- default 'DDL'
                           ) ddl
  FROM dual;

--set define on

