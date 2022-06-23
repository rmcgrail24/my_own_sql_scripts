column username format a22
column account_status format a16

ttitle center '***** DBA_USERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2
 
SELECT username,
       user_id,
--       created,
       account_status,
--       lock_date,
--       expiry_date,
       default_tablespace,
       temporary_tablespace
--       profile
  FROM dba_users
ORDER BY username;

--clear columns
--ttitle off
