-------------------------------------------------------------------------------
--
-- Script:	shared_pool_spare_free.sql
-- Purpose:	to check how much spare free memory remains in the perm chunk
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
  avg(v.value)  shared_pool_size,
  greatest(avg(s.ksmsslen) - sum(p.ksmchsiz), 0)  spare_free,
  to_char(
    100 * greatest(avg(s.ksmsslen) - sum(p.ksmchsiz), 0) / avg(v.value),
    '99999'
  ) || '%' wastage
from
  sys.x_$ksmss s,
  sys.x_$ksmsp p,
  sys.v_$parameter v
where
  p.ksmchcom = 'free memory' and
  s.ksmssnam = 'free memory' and
  v.name = 'shared_pool_size'
/
