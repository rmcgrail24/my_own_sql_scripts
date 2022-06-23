column db_link format a30
column host format a60

ttitle center "***** DBA_DB_LINKS View *****" skip 2

SELECT owner,
       db_link,
       username,
       host
--       created
  FROM dba_db_links
ORDER BY db_link;

clear columns
ttitle off

