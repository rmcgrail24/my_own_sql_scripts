DECLARE
  v_owner     all_tables.owner%TYPE;
  v_table_name     all_tables.table_name%TYPE;
BEGIN
  v_owner := UPPER('&owner');
  v_table_name := UPPER('&table_name');
  dbms_stats.gather_table_stats(v_owner, v_table_name);
END;
/
