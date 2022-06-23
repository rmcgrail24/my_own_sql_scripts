-------------------------------------------------------------------------------
--
-- Script:	all_parameters.sql
-- Purpose:	to show all parameter values (including hidden ones)
-- For:		7.3
--
-- Copyright:	(c) 1999 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

set linesize 132

column name format a42
column value format a64

select
  x.ksppinm  name,
  y.ksppstvl  value,
  y.ksppstdf  isdefault,
  decode(bitand(y.ksppstvf,7),1,'MODIFIED',4,'SYSTEM_MOD','FALSE')  ismod, 
  decode(bitand(y.ksppstvf,2),2,'TRUE','FALSE')  isadj 
from 
  sys.x_$ksppi x, 
  sys.x_x$ksppcv y 
where 
  x.indx = y.indx 
order by
  translate(x.ksppinm, ' _', ' ')
/

@reset_sqlplus
