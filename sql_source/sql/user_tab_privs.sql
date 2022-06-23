ttitle center '***** USER_TAB_PRIVS View *****' -
       right 'Page: ' format 99 sql.pno skip 2



column grantee format a20

column owner format a20

column grantor format a20

column privilege format a20



SELECT owner,

       table_name,

       grantor,

       grantee,

       privilege,

       grantable,

       hierarchy

  FROM user_tab_privs

ORDER BY grantee;



clear columns


ttitle off

