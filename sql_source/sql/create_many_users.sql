DECLARE
   l_lower_limit   PLS_INTEGER := 0;
   l_upper_limit   PLS_INTEGER := 10;
BEGIN
   FOR username_idx IN l_lower_limit .. l_upper_limit
   LOOP
      DBMS_OUTPUT.put_line('CREATE USER rm' || LPAD(TO_CHAR(username_idx), 6, '0')) 
                                     || IDENTIFIED BY rm' || LPAD(TO_CHAR(username_idx), 6, '0'));
   END LOOP;
END;
/
