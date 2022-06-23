-------------------------------------------------------------------------------
--
-- Script:	create_xviews.sql
-- Purpose:	to create views on the x$ tables
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-- Comment:	Must be executed as SYS via SQL*Plus.
--
-------------------------------------------------------------------------------

set feedback off
set pagesize 0
set termout off
set echo off

spool create_xviews.tmp
select 
  'create or replace view X_$' || substr(name, 3) ||
  ' as select * from ' || name || ';'
from
  sys.v_$fixed_table
where
  name like 'X$%'
/
spool off

set termout on
set echo on
@create_xviews.tmp
set echo off

set termout off
host rm -f create_xviews.tmp	-- for Unix
host del create_xviews.tmp	-- for others
set termout on
set pagesize 24
