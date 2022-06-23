ttitle center '***** ALL_TAB_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
column grantee format a20 hea "Grantee"
column onwer format a20 hea "Owner"
column table_name hea "Table Name"
set hea off

SELECT grantor || ' granted the ' || privilege || ' privilege on the ' || table_schema || '.' || table_name || ' table to ' || grantee
       || ' with' || DECODE(grantable,'YES',' the GRANT option.','NO','out the GRANT option.')
  FROM all_tab_privs
WHERE grantor = 'SYS'
  AND grantee = 'OE';
  AND rownum < 31
--ORDER BY grantor, grantee, privilege
/
clear columns
set hea on
ttitle off

