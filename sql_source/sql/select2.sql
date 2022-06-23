DECLARE
   v1              VARCHAR2(32767);
   fh              UTL_FILE.FILE_TYPE;
   l_table_name    all_tab_columns.table_name%TYPE := 'EMPLOYEE_SALARIES';
   l_column_name    all_cons_columns.column_name%TYPE;
   l_owner         all_tab_columns.owner%TYPE := 'HR';
   l_order_by_clause  VARCHAR2(100) := 'ORDER BY';
   l_loop_counter  PLS_INTEGER := 1;
   l_column_count  PLS_INTEGER;
   TYPE ColumnList IS TABLE OF all_tab_columns.column_name%TYPE;
   column_names    ColumnList;
 
 --  CURSOR c1 (l_table_name all_tab_columns.table_name%TYPE) IS
   CURSOR c1 IS
      SELECT column_name
        FROM all_tab_columns
       WHERE table_name = UPPER(l_table_name)
         AND owner = l_owner;
 
   CURSOR c2 IS
       SELECT acc.column_name
         FROM all_constraints ac JOIN all_cons_columns acc USING (constraint_name)
        WHERE ac.table_name = l_table_name
          AND ac.owner = l_owner
          AND ac.constraint_type = 'P'
        ORDER BY acc.position;

BEGIN
--   DBMS_OUTPUT.PUT_LINE('The table name is ' || l_table_name || ', the owner is ' || l_owner);
   SELECT COUNT(column_name)
     INTO l_column_count
     FROM all_tab_columns
    WHERE table_name = l_table_name
      AND owner = l_owner;

   column_names := ColumnList(' ');

--   OPEN c1(l_table_name);
   OPEN c1;
   FETCH c1 BULK COLLECT INTO column_names;	
   CLOSE c1;

   fh := UTL_FILE.FOPEN('utl_file_dir','s2.tmp','W');
   DBMS_OUTPUT.PUT_LINE('SELECT ' || LOWER(column_names(1)) ||',');
   FOR i IN 2 .. l_column_count-1
   LOOP
      DBMS_OUTPUT.PUT_LINE(LPAD(' ',7,CHR(31)) || LOWER(column_names(i)) ||',');
   END LOOP; 
   DBMS_OUTPUT.PUT_LINE(LPAD(' ',7,CHR(31)) || LOWER(column_names(l_column_count)));

   DBMS_OUTPUT.PUT_LINE(LPAD(' ',2,CHR(31)) || 'FROM ' || LOWER(l_table_name));

   OPEN c2;
   LOOP
      FETCH c2 INTO l_column_name;
      EXIT WHEN c2%NOTFOUND;
      IF l_loop_counter = 1 THEN
         l_order_by_clause := l_order_by_clause || ' ' || LOWER(l_column_name);
      ELSE
         l_order_by_clause := l_order_by_clause || ', ' || LOWER(l_column_name);
      END IF;
      l_loop_counter := l_loop_counter + 1;
   END LOOP;
   CLOSE c2;

   DBMS_OUTPUT.PUT_LINE(l_order_by_clause || ';');
--   UTL_FILE.FCLOSE(fh);

--EXCEPTION
--  WHEN OTHERS THEN
--     NULL;
END;
/

