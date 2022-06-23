column pga_used_mem format 999,999,999 hea 'PGA|Used|Memory'
column pga_alloc_mem format 999,999,999 hea 'PGA|Allocated|Memory'
column pga_max_mem format 999,999,999 hea 'PGA|Maximum|Memory'

prompt Returns a list of network processes

SELECT pid,
       spid,
       serial#,
       program,
       background,
       pga_used_mem,
       pga_alloc_mem,
       pga_max_mem
  FROM v$process
 WHERE addr NOT IN (SELECT paddr FROM v$bgprocess);

clear columns

