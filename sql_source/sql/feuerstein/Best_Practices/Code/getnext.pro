CREATE OR REPLACE PROCEDURE get_next_line (
   file_in    IN       UTL_FILE.file_type,
   line_out   OUT      VARCHAR2,
   eof_out    OUT      BOOLEAN
)
IS
BEGIN
   UTL_FILE.GET_LINE (file_in, line_out);
   eof_out := FALSE;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      line_out := NULL;
      eof_out := TRUE;
END;
/
