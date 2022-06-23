ttitle center '***** DBA_TAB_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

column grantee format a20
column owner format a20
column grantor format a20
column privilege format a20
column grantable format a10 hea 'Grantable?'

SELECT owner,
       table_name,
       grantor,
       grantee,
       privilege,
       grantable,
       hierarchy
  FROM dba_tab_privs
 WHERE grantee = UPPER('&grantee');

clear columns
ttitle off 

