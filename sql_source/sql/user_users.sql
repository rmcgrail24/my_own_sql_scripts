--column username format a16
column account_status format a16

ttitle center '***** USES_USERS View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT username,
       user_id,
--       created,
       account_status,
       lock_date,
       expiry_date,
       default_tablespace,
       temporary_tablespace
  FROM user_users;

clear columns
ttitle off

