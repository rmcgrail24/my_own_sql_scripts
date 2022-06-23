-------------------------------------------------------------------------------
--
-- Script:	keep_sys_packages.sql
-- Purpose:	to mark key packages for keeping in the pool
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

execute sys.dbms_shared_pool.keep('SYS.STANDARD', 'P');
execute sys.dbms_shared_pool.keep('SYS.DBMS_STANDARD', 'P');
execute sys.dbms_shared_pool.keep('SYS.DBMS_OUTPUT', 'P');
execute sys.dbms_shared_pool.keep('SYS.DBMS_UTILITY', 'P');
