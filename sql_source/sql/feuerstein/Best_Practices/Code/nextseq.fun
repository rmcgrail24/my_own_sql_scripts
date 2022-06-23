/* Formatted by PL/Formatter v3.1.2.1 on 2001/01/20 14:42 */

CREATE OR REPLACE FUNCTION nextseq (
   seq_in         IN   VARCHAR2,
   increment_in   IN   INTEGER := 1
)
   RETURN INTEGER
IS
   seq_string   VARCHAR2 (200)
      := 'SELECT ' || seq_in || '.' ||
            'NEXTVAL nextseq FROM dual WHERE ROWNUM = 1';
   cur          INTEGER;
   fdbk         INTEGER;
   retval       INTEGER;
BEGIN
   cur := DBMS_SQL.open_cursor;

   FOR seq_count IN 1 .. increment_in
   LOOP
      DBMS_SQL.parse (cur, seq_string, DBMS_SQL.native);
      DBMS_SQL.define_column (cur, 1, retval);
      fdbk := DBMS_SQL.execute_and_fetch (cur);

      IF fdbk = 1
      THEN
         DBMS_SQL.column_value (cur, 1, retval);
      END IF;
   END LOOP;

   DBMS_SQL.close_cursor (cur);
   RETURN retval;
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_SQL.close_cursor (cur);
      DBMS_OUTPUT.put_line ('Error executing NextSeq: ' || seq_string);
      DBMS_OUTPUT.put_line (SQLERRM);
      RETURN NULL;
END;
/

