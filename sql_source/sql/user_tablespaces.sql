set linesize 156

column pct_increase format 9,999,999 heading 'Pct|Increase'
column force_logging heading 'F/L'
column extent_management heading 'Extent|Management'
column allocation_type format a10 heading 'Allocation|Type'
column segment_space_management format a7 heading 'Segment|Space|Mgmt'
column initial_extent format 999,999,999,999
column block_size format 999,999
column next_extent format 999,999,999,999
column min_extents format 999,999,999,999
column max_extents format 999,999,999,999

break on report
compute sum label Total of block_size on report

ttitle center '***** USER_TABLESPACES View *****' -
       right 'Page: ' format 99 sql.pno skip 2

SELECT tablespace_name,
       block_size, 
--       initial_extent, 
--       next_extent, 
--       min_extents, 
       max_extents, 
--       pct_increase, 
       status, 
       retention, 
       contents, 
       logging, 
       force_logging, 
       extent_management,
       segment_space_management, 
       allocation_type, 
       bigfile 
  FROM user_tablespaces 
ORDER BY tablespace_name;

clear breaks
clear columns
clear computes
ttitle off

