DECLARE
  err_msg VARCHAR2(120);
BEGIN
  dbms_output.enable (1000000);
  FOR err_num IN 10000..19999
    LOOP
      err_msg := SUBSTR(SQLERRM(-err_num), 1, 120);
      IF err_msg NOT LIKE '%Message '||err_num||' not found%' THEN
        dbms_output.put_line (err_msg);
      END IF;
    END LOOP;
END;