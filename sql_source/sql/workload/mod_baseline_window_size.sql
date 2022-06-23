DECLARE
   v_window_size            NUMBER := 30;
   v_dbid                   NUMBER DEFAULT NULL;
BEGIN
   DBMS_WORKLOAD_REPOSITORY.MODIFY_BASELINE_WINDOW_SIZE(window_size => v_window_size);
--                                                                 v_dbid)

   DBMS_OUTPUT.PUT_LINE('The modified baseline window size is ' || v_window_size);
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Attempt at modifyin the baseline window size failed!');
END;
/

