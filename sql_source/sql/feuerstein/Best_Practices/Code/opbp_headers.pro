/* Formatted by PL/Formatter v3.1.2.1 on 2001/01/26 23:30 */

CREATE OR REPLACE PROCEDURE opbp_headers
IS
   files PLVtab.vc2000_table;
   indx PLS_INTEGER;
BEGIN
   xfile.getdircontents ('e:\opbp\code', files);
   indx := files.FIRST;

   LOOP
      EXIT WHEN indx IS NULL;

      IF SUBSTR (UPPER (files (indx)), -3) NOT IN ('DOC', 'AVA')
      THEN
         fid := xfile.fopen ('e:\opbp\code', files (indx), 'R');

         LOOP
            xfile.get_line (fid, lines (NVL (lines.LAST, 0) + 1), eof);
            EXIT WHEN eof;
         END LOOP;

         xfile.fclose (fid);
         fid := xfile.fopen ('e:\opbp\code', files (indx), 'W');
         xfile.put_line (fid,
            'REM Oracle PL/SQL Best Practices (O''Reilly and Associates)'
         );
         xfile.put_line (fid, 'REM by Steven Feuerstein');

         FOR indx IN lines.FIRST .. lines.LAST
         LOOP
            xfile.put_line (fid, lines (indx));
         END LOOP;
      END IF;

      indx := files.NEXT (indx);
   END LOOP;
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line ('Error ' || TO_CHAR (SQLCODE) || ': ' || SQLERRM);
      RAISE;
END;




