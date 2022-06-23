/*
To change the result set or the values of variables in the query, you must close and reopen the cursor with the input variables set to their new values.
However, you can use a different INTO list on separate fetches with the same cursor.
Each fetch retrieves another row and assigns values to the target variables, as shown in this example.
*/
DECLARE
   CURSOR c1 IS SELECT last_name FROM employees ORDER BY last_name;
   name1 employees.last_name%TYPE;
   name2 employees.last_name%TYPE;
   name3 employees.last_name%TYPE;
BEGIN
   OPEN c1;
   FETCH c1 INTO name1;  -- this fetches first row
   FETCH c1 INTO name2;  -- this fetches second row
   FETCH c1 INTO name3;  -- this fetches third row
   CLOSE c1;
END;
/
