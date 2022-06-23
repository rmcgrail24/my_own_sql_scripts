-------------------------------------------------------------------------------
--
-- Script:	session_times.sql
-- Purpose:	to report the time used and waiting for a session
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

accept Session prompt "Please enter the SID for the session: "

select
  e.event,
  e.time_waited
from
  v$session_event  e
where
  e.sid = &Session
union all
select
  n.name,
  s.value
from
  v$statname  n,
  v$sesstat  s
where
  s.sid = &Session and
  n.statistic# = s.statistic# and
  n.name = 'CPU used by this session'
order by
  2 desc
/

@reset_sqlplus
