{\rtf1\ansi\deff0{\fonttbl{\f0\fnil\fcharset0 Courier New;}}
{\*\generator Msftedit 5.41.21.2510;}\viewkind4\uc1\pard\lang1033\f0\fs22 column plsql_code_type format a30\par
column plsql_warnings format a30\par
\par
ttitle center '***** USER_PLSQL_OBJECT_SETTINGS View *****' -\par
       right 'Page: ' format 99 sql.pno skip 2\par
 \par
SELECT owner,\par
       name,\par
       type,\par
       plsql_optimize_level,\par
       plsql_code_type\par
--       plsql_warnings\par
  FROM all_plsql_object_settings\par
ORDER By name;\par
\par
clear columns\par
ttitle off\par
\par
\par
}
 