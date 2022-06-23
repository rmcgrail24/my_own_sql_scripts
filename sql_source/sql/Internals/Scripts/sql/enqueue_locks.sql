-------------------------------------------------------------------------------
--
-- Script:	enqueue_locks.sql
-- Purpose:	to display enqueue locks held and wanted in order
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

column resource format a20
break on resource

select
  type || '-' || id1 || '-' || id2  "RESOURCE",
  sid,
  decode(
    lmode,
    1, '      N',
    2, '     SS',
    3, '     SX',
    4, '      S',
    5, '    SSX',
    6, '      X'
  )  holding,
  decode(
    request,
    1, '      N',
    2, '     SS',
    3, '     SX',
    4, '      S',
    5, '    SSX',
    6, '      X'
  )  wanting,
  ctime  seconds
from
  sys.v_$lock
order by
  type || '-' || id1 || '-' || id2,
  ctime desc
/

@reset_sqlplus
