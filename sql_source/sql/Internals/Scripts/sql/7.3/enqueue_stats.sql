-------------------------------------------------------------------------------
--
-- Script:	enqueue_stats.sql
-- Purpose:	to display enqueue statistics
-- For:		up to 7.3
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

select
  q.ksqsttyp type,
  q.ksqstget gets,
  q.ksqstwat waits
from
  sys.x_$ksqst  q
where
  q.ksqstget > 0
/
