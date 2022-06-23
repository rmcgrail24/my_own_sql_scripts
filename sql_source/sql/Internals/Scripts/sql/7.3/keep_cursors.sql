-------------------------------------------------------------------------------
--
-- Script:	keep_cursors.sql
-- Purpose:	to mark oft reused cursors for keeping in the pool
-- For:		7.3
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-- Synopsis:	sqlplus / @keep_cursors <execution count>
--
-- Description:	This keeps all shared cursors that have been executed at least
--		as often as the execution count specified.
--
-------------------------------------------------------------------------------
@reset_sqlplus

declare
  cursor reused_cursors is
    select
      address || ',' || decode(sign(hash_value), -1, hash_value + power(2, 32), hash_value)
    from
      sys.v_$sqlarea
    where
      executions > &1;
  cursor_string varchar2(30);
begin
  open reused_cursors;
  loop
    fetch reused_cursors into cursor_string;
    exit when reused_cursors%notfound;   
    sys.dbms_shared_pool.keep(cursor_string, 'C');
  end loop;
end;   
/
