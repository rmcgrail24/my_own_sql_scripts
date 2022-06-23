-------------------------------------------------------------------------------
--
-- Script:	reserved_pool_hwm.sql
-- Purpose:	to get the hwm of reserved pool usage
-- For:		8.0
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus
define stopper = 48	-- for 8.0

prompt Reserved Pool High-Water-Mark Since Instance Startup
prompt ====================================================

select
  sum(r.ksmchsiz) - &stopper  reserved_size,
  sum(
    r.ksmchsiz -
    decode(h.kghlunfu, 0, decode(r.indx, 1, r.ksmchsiz, 0), 0)
  ) - &stopper  high_water_mark,
  to_char(
    100 * (sum(
	     r.ksmchsiz -
	     decode(h.kghlunfu, 0, decode(r.indx, 1, r.ksmchsiz, 0), 0)
	   ) - 48
	  ) / (sum(r.ksmchsiz) - &stopper),
    '99999'
  ) || '%'  "  USAGE"
from
  sys.x_$kghlu  h,
  sys.x_$ksmspr  r
where
  h.inst_id = userenv('Instance') and
  r.inst_id = userenv('Instance')
/

prompt
