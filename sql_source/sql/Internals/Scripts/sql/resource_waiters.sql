-------------------------------------------------------------------------------
--
-- Script:	resource_waiters.sql
-- Purpose:	to show the sessions that have waited for a certain event
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

accept Event prompt "Please enter the event name: "

column program format a30

select
  e.sid,
  s.program,
  e.time_waited,
  e.time_waited / (
    e.total_waits - decode(e.event, 'latch free', 0, e.total_timeouts)
  )  average_wait
from
  sys.v_$session_event  e,
  sys.v_$session  s
where
  e.event = '&Event' and
  s.sid = e.sid
union all
select
  0,
  'All Disconnected Sessions',
  y.time_waited - n.time_waited,
  y.average_wait
from
  sys.v_$system_event  y,
  (
  select
    sum(time_waited)  time_waited
  from
    sys.v_$session_event
  where
    event = '&Event'
  )  n
where
  y.event = '&Event'
order by
  3 desc
/

@reset_sqlplus
