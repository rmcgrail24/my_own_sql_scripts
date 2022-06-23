-------------------------------------------------------------------------------
--
-- Script:	fixed_table_columns.sql
-- Purpose:	to generate a description of the fixed table columns
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

prompt Spooling output to: fixed_table_columns.lst

set pagesize 0
set termout off
set echo off

spool fixed_table_columns.tmp
select 
--  'prompt describe ' || name,
  'describe SYS.X_' || substr(name,2)
from
  sys.v_$fixed_table
where
  name like 'X$%'
order by
  name
/
spool off
set echo on
spool fixed_table_columns
@fixed_table_columns.tmp
spool off
set echo off

host rm -f fixed_table_columns.tmp	-- for Unix
host del fixed_table_columns.tmp	-- for others
set termout on
set pagesize 24
