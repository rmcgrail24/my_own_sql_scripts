DECLARE
  object_no   INTEGER;
  row_id      ROWID;
BEGIN
  SELECT ROWID INTO row_id FROM regions
    WHERE region_id = 1;
  object_no := DBMS_ROWID.ROWID_OBJECT(row_id);
  DBMS_OUTPUT.PUT_LINE('The obj. # is '|| object_no);
end;
/
