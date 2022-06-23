column spid format a6
column traceid format a25
column pum hea 'PGA|Used|Memory (M)' format 990.999
--column pga_used_mem format 999,999,999 hea 'PGA|Used|Memory'
column pam hea 'PGA|Allocated|Memory (M)' format 990.999
--column pga_alloc_mem format 999,999,999 hea 'PGA|Allocated|Memory'
column pmm hea 'PGA|Maximum|Memory (M)' format 990.999
--column pga_max_mem format 999,999,999 hea 'PGA|Maximum|Memory'

ttitle center '***** V$PROCESS Veiw' skip 2

break on report
compute sum label Total of pum on report
compute sum of pam on report
compute sum of pmm on report

SELECT pid,
       spid,
       serial#,
       program,
       background,
       traceid,
       pga_used_mem / (1024*1024) "PUM",
       pga_alloc_mem / (1024*1024) "PAM",
       pga_max_mem / (1024*1024) "PMM"
  FROM v$process;

clear breaks
clear columns
clear computes
ttitle off

