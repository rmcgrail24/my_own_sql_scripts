-------------------------------------------------------------------------------
--
-- Script:	lock_element_lwm.sql
-- Purpose:	to find the low-water mark of the lock element free list
--
-- Copyright:	(c) 1999 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

select
  l.inst_id, l.lwm
from
  sys.x_$kclfx  l
/
