-------------------------------------------------------------------------------
--
-- Script:	resource_waits.sql
-- Purpose:	to show the total waiting time for resource types
-- Version:	prior to 8.0 (does not check for OPS)
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

column average_wait format 9999990.00

select
  substr(e.event, 1, 40)  event,
  e.time_waited,
  e.time_waited / (
    e.total_waits - decode(e.event, 'latch free', 0, e.total_timeouts)
  )  average_wait
from
  sys.v_$system_event  e
where
  e.event = 'buffer busy waits' or
  e.event = 'enqueue' or
  e.event = 'free buffer waits' or
  e.event = 'latch free' or
  e.event = 'log buffer space' or
  e.event = 'parallel query qref latch' or
  e.event = 'pipe put' or
  e.event = 'write complete waits' or
  e.event like 'library cache%' or
  e.event like 'log file switch%' or
  e.event = 'row cache lock'
union all
select
  'non-routine log file syncs',
  round(e.average_wait * greatest(e.total_waits - s.value, 0)),
  e.average_wait
from
  sys.v_$system_event e,
  sys.v_$sysstat s
where
  e.event = 'log file sync' and
  s.name = 'user commits'
order by
  2 desc
/

@reset_sqlplus
