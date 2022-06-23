ttitle center '***** USER_TAB_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
column grantee format a20 hea "Grantee"
column onwer format a20 hea "Owner"
column table_name hea "Table Name"
set hea off

SELECT utp.grantor || ' granted the ' || utp.privilege || ' privilege on the ' || ao.object_name || ' ' || LOWER(ao.object_type)
       || ' to ' || utp.grantee || ' with' || DECODE(utp.grantable,'YES',' the GRANT option.','NO','out the GRANT option.')
  FROM user_tab_privs utp JOIN all_objects ao ON (utp.table_name=ao.object_name)
ORDER BY grantor, utp.grantee, utp.privilege;

clear columns
set hea on
ttitle off

