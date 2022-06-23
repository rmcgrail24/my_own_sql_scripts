column bytes format 999,999,999

column blocks format 999,999

column dropped format a8 hea 'Dropped?'



break on report


compute sum label Total of bytes on repor

t

ttitle center '***** USER_TS_QUOTAS View *****' -
       right 'Page: ' format 99 sql.pno skip 2




SELECT tablespace_name,

       bytes,

       max_bytes,

       blocks,

       max_blocks,

       dropped

  FROM user_ts_quotas;



clear breaks

clear columns


ttitle off

