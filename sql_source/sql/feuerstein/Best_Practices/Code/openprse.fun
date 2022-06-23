CREATE OR REPLACE FUNCTION open_and_parse ( 
   dynsql_in IN VARCHAR2, 
   dbms_mode_in IN INTEGER := NULL) 
RETURN INTEGER
IS
   dyncur INTEGER;
BEGIN
   dyncur := DBMS_SQL.OPEN_CURSOR;
   
   DBMS_SQL.PARSE (dyncur, dynsql_in, 
      NVL (dbms_mode_in, DBMS_SQL.NATIVE));

   RETURN dyncur;
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_SQL.CLOSE_CURSOR (dyncur);
      DBMS_OUTPUT.PUT_LINE (SQLERRM);
      DBMS_OUTPUT.PUT_LINE (dynsql_in);
      DBMS_OUTPUT.PUT_LINE (dynsql_in);
      RETURN NULL;
END;
/
