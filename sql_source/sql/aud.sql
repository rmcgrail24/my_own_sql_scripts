column sqltext format a50

SELECT sessionid,
--       entryid,
       statement,
--       timestamp#,
       userid,
--       sqlbind,
       sqltext
  FROM aud$
 WHERE sqlbind IS NOT NULL;

clear columns

