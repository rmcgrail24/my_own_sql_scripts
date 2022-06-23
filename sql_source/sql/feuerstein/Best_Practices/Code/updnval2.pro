CREATE OR REPLACE PROCEDURE updnumval (
   tab_in IN VARCHAR2,
   namecol_in IN VARCHAR2,
   numcol_in IN VARCHAR2,
   name_in IN VARCHAR2,
   val_in IN NUMBER)
IS
   cur PLS_INTEGER;
   fdbk PLS_INTEGER;
BEGIN
   cur := open_and_parse (
      'UPDATE ' || tab_in     || 
        ' SET ' || numcol_in  || ' = ''' || val_in || '''' || 
      ' WHERE ' || namecol_in || ' LIKE ''' || name_in || '''');

   fdbk := DBMS_SQL.EXECUTE (cur);

   DBMS_SQL.CLOSE_CURSOR (cur);
END;
/

