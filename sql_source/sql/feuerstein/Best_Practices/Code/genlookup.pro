CREATE OR REPLACE PROCEDURE genlookup (tab IN VARCHAR2, col IN VARCHAR2)
IS
   l_ltab   VARCHAR2 (100) := LOWER (tab);
   l_lcol   VARCHAR2 (100) := LOWER (col);
BEGIN
   pl ('CREATE OR REPLACE FUNCTION ' || l_ltab || '_row_for (');
   pl ('   ' || l_lcol || '_in IN ' || l_ltab || '.' || l_lcol || '%TYPE)');
   pl ('   RETURN ' || l_ltab || '%ROWTYPE');
   pl ('IS');
   pl ('   retval  ' || l_ltab || '%ROWTYPE;');
   pl ('BEGIN');
   pl ('   SELECT * INTO retval');
   pl ('     FROM ' || l_ltab);
   pl ('    WHERE ' || l_lcol || ' = ' || l_lcol || '_in;');
   pl ('   RETURN retval;');
   pl ('EXCEPTION');
   pl ('   WHEN NO_DATA_FOUND THEN');
   pl ('      RETURN NULL;');
   pl ('   WHEN OTHERS THEN');
   pl ('      err.log;');
   pl ('END ' || l_ltab || '_row_for;');
   pl ('/');
END;
/
