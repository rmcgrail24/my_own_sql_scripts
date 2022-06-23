-------------------------------------------------------------------------------
--
-- Script:	keep_schema.sql
-- Purpose:	to an entire schema for keeping
-- For:		7.3 and 8.0
--
-- Copyright:	(c) 1998 Ixora Pty Ltd
-- Author:	Steve Adams
--
-- Synopsis:	sqlplus / @keep_schema <schema name>
--
-------------------------------------------------------------------------------
@reset_sqlplus

declare
  cursor candidate_objects is
    select
      object_name,
      decode(object_type,
	'PACKAGE',	'P',
	'PROCEDURE',	'P',
	'FUNCTION',	'P',
	'SEQUENCE',	'Q'
      )
    from
      sys.dba_objects
    where
      owner = upper('&1') and
      object_type in (
	'PACKAGE',
	'PROCEDURE',
	'FUNCTION',
	'SEQUENCE',
	'TRIGGER'
      );
  object_name varchar2(128);
  object_type char(1);
begin
  open candidate_objects;
  loop
    fetch candidate_objects into object_name, object_type;
    exit when candidate_objects%notfound;   
    sys.dbms_shared_pool.keep('&1' || '.' || object_name, object_type);
  end loop;
end;   
/

