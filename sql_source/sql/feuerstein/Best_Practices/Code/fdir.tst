/* Formatted by PL/Formatter v3.1.2.1 on 2001/01/21 11:38 */

INSERT INTO dir
     VALUES (1, 'LIBMEM', 'c:\temp');
INSERT INTO dir
     VALUES (4, 'LIBMEM', 'e:\demo');
COMMIT;

CREATE OR REPLACE PROCEDURE showfirst
IS
   fid      UTL_FILE.file_type;
   l_line   VARCHAR2 (100);
BEGIN
   fid := fdir.fopen ('LIBMEM', 'fdir.txt');
   UTL_FILE.get_line (fid, l_line);
   pl (l_line);
   UTL_FILE.fclose (fid);
END;
/

SET serveroutput on

BEGIN
   fdir.setphase (fdir.c_dev);
   showfirst;
END;
/

BEGIN
   fdir.setphase (fdir.c_prod);
   showfirst;
END;
/





