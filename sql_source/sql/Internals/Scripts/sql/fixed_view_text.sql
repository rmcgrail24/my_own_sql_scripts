-------------------------------------------------------------------------------
--
-- Script:	fixed_view_text.sql
-- Purpose:	to extract the view text for the V$ views
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

prompt Spooling output to: fixed_view_text.lst

set termout off
set pagesize 0
set linesize 2048

spool fixed_view_text
select
  'create view ' || view_name || ' as ' || view_definition || ';'
from
  sys.v_$fixed_view_definition
order by
  view_name
/
spool off
set termout on
set pagesize 24
set linesize 80

