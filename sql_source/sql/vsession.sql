column process format a7
column client_identifier format a20

ttitle center '***** V$SESSION View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT sid,
       serial#,
       username,
       client_identifier,
--       command,
       status,
       schemaname,
       osuser,
       process
  FROM v$session;

clear columns
ttitle off

