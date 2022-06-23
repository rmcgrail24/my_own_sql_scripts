column synonym_name format a30
column table_owner format a30
column table_name format a30
column db_link format a30

ttitle center '***** USER_SYNONYMS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT synonym_name,
--     table_owner,
       table_name
--     db_link,
--     origin_con_id
  FROM user_synonyms
ORDER BY synonym_name;

clear columns
ttitle off

