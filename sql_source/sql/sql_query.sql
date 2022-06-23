DECLARE
   v_col_name      all_tab_columns.column_name%TYPE;
   v_select_stmt   VARCHAR2(1000) := 'SELECT';
   v_column_name   VARCHAR2(1000);
   v_first_column  BOOLEAN := TRUE;
   f1              UTL_FILE.FILE_TYPE;

   CURSOR c1 IS SELECT column_name
                  FROM all_tab_columns
                 WHERE table_name = UPPER('&table_name');
BEGIN
   OPEN c1;
   begin
        NULL;
      f1 := UTL_FILE.FOPEN('/tmp','select_statement.sql','W',256);
   exception
      WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Cannot open file!');
   end;
   LOOP
      FETCH c1 INTO v_col_name;
      EXIT WHEN c1%NOTFOUND;
      IF v_first_column THEN
         v_column_name := 'SELECT ' || v_col_name || ',';
         v_first_column := FALSE;
      ELSE
         v_column_name := v_col_name || ',';
      END IF;
--      UTL_FILE.PUT_LINE(f1,v_column_name);
   END LOOP;
--   UTL_FILE.FCLOSE(f1);
   CLOSE c1;
   DBMS_OUTPUT.PUT_LINE('Successfully created SELECT statement!');
EXCEPTION
--   WHEN INVALID_PATH THEN
--      DBMS_OUTPUT.PUT_LINE('File location is invalid!');
--   WHEN INVALID_MODE THEN
--      DBMS_OUTPUT.PUT_LINE('The open_mode parameter in FOPEN is invalid!');
--   WHEN INVALID_FILEHANDLE THEN
--      DBMS_OUTPUT.PUT_LINE('File handle is invalid!');
--   WHEN WRITE_ERROR THEN
--      DBMS_OUTPUT.PUT_LINE('Operating system error occurred during the write operation!');
--   WHEN FILE_OPEN THEN
--      DBMS_OUTPUT.PUT_LINE('The requested operation failed because the file is open!');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Other error!');
END;
/

