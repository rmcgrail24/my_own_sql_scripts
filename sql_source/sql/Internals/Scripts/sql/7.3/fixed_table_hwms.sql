-------------------------------------------------------------------------------
--
-- Script:	fixed_table_hwms.sql
-- Purpose:	to find the high water marks for the fixed tables
-- For:		7.3 only
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-------------------------------------------------------------------------------
@reset_sqlplus

prompt Fixed Table High-Water-Marks Since Instance Startup
prompt ===================================================

column table_name heading "TABLE|NAME"
column parameter heading "PARAMETER|NAME"
column setting heading "CURRENT|SETTING"
column hwm heading "HIGH WATER|MARK"
column usage heading "PERCENT|   USED" format a7

select
  'x$ksqeq' table_name,
  '_enqueue_locks' parameter,
  count(*) setting,
  count(decode(ksqlkctim, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ksqlkctim, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$ksqeq
union all
select
  'x$ktadm' table_name,
  'dml_locks' parameter,
  count(*) setting,
  count(decode(ksqlkctim, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ksqlkctim, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$ktadm
union all
select
  'x$ksqrs' table_name,
  'enqueue_resources' parameter,
  count(*) setting,
  count(decode(ksqrsflg, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ksqrsflg, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$ksqrs
union all
select
  'x$kturd' table_name,
  'max_rollback_segments' parameter,
  count(*) setting,
  count(decode(kturdext, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(kturdext, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$kturd
union all
select
  'x$ksupr' table_name,
  'processes' parameter,
  count(*) setting,
  count(decode(ksspaflg, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ksspaflg, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$ksupr
union all
select
  'x$ksuse' table_name,
  'sessions' parameter,
  count(*) setting,
  count(decode(ksuseflg, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ksuseflg, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$ksuse
union all
select
  'x$kdnssf' table_name,
  'temporary_table_locks' parameter,
  count(*) setting,
  count(decode(ksqlkctim, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ksqlkctim, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$kdnssf
union all
select
  'x$ktcxb' table_name,
  'transactions' parameter,
  count(*) setting,
  count(decode(ktcxbflg, 0, null, 0)) hwm,
  to_char(
    100 * count(decode(ktcxbflg, 0, null, 0)) / count(*),
    '99999'
  ) || '%' usage
from
  sys.x_$ktcxb
/

prompt
@reset_sqlplus
