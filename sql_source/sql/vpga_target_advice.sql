column pga_target_for_estimate format 9,999,999,999
column estd_extra_bytes_rw format 9,999,999,999

SELECT pga_target_for_estimate,
       pga_target_factor,
       estd_extra_bytes_rw
  FROM v$pga_target_advice;

