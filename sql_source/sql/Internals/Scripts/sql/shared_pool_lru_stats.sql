-------------------------------------------------------------------------------
--
-- Script:	shared_pool_lru_stats.sql
-- Purpose:	to check the shared pool lru stats
-- For:		8.0 and higher
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

column kghlurcr heading "RECURRENT|CHUNKS"
column kghlutrn heading "TRANSIENT|CHUNKS"
column kghlufsh heading "FLUSHED|CHUNKS"
column kghluops heading "PINS AND|RELEASES"
column kghlunfu heading "ORA-4031|ERRORS"
column kghlunfs heading "LAST ERROR|SIZE"

select
  kghlurcr,
  kghlutrn,
  kghlufsh,
  kghluops,
  kghlunfu,
  kghlunfs
from
  sys.x_$kghlu
where
  inst_id = userenv('Instance')
/

@reset_sqlplus
