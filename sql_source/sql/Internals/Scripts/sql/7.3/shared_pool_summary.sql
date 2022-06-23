-------------------------------------------------------------------------------
--
-- Script:	shared_pool_summary.sql
-- Purpose:	to get an overview of chunks in the shared pool
-- For:		to 7.3
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-- Warning:	This script queries x$ksmsp which causes it to take the
--		shared pool latch for a fairly long time.
--		Think twice before running this script on a large system
--		with potential shared pool problems -- you may make it worse.
--
-------------------------------------------------------------------------------
@reset_sqlplus

select
  ksmchcom  contents,
  count(*)  chunks,
  sum(decode(ksmchcls, 'recr', ksmchsiz))  recreatable,
  sum(decode(ksmchcls, 'freeabl', ksmchsiz))  freeable,
  sum(ksmchsiz)  total
from
  sys.x_$ksmsp
where
  ksmchcls not like 'R%'
group by
  ksmchcom
/
