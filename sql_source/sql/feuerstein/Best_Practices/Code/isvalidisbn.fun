/* This first version returns NULL with NULL input. */

CREATE OR REPLACE FUNCTION is_valid_isbn (
   isbn_in IN VARCHAR2
)
   RETURN BOOLEAN
-- Ten digits separated by 4 hyphens
IS
   l_isbn book.isbn%TYPE;
BEGIN
   l_isbn :=
           TRANSLATE (isbn_in,  'A-',  'A');

   -- Is the remaining length 10 and does it
   -- convert implicitly to a number, indicating
   -- that there were no invalid characters in
   -- the ISBN?
   
   RETURN (      LENGTH (l_isbn) = 10
             AND l_isbn + 0 = l_isbn
          );
EXCEPTION WHEN OTHERS THEN RETURN FALSE;
END;
/

/* Version of function that returns FALSE if input is NULL */

CREATE OR REPLACE FUNCTION is_valid_isbn (
   isbn_in IN VARCHAR2)
   RETURN BOOLEAN
IS
   l_isbn book.isbn%TYPE;
   retval BOOLEAN := FALSE;
BEGIN
   IF isbn_in IS NOT NULL
   THEN
      -- Remove all hyphens
      l_isbn := TRANSLATE (isbn_in,  'A-',  'A');
      
      -- Is the remaining length 10 and does it
      -- convert implicitly to a number, indicating
      -- that there were no invalid characters in
      -- the ISBN?
      
      retval := (LENGTH (l_isbn) = 10
                   AND l_isbn + 0 = l_isbn);
   END IF;

   RETURN retval;
EXCEPTION WHEN OTHERS THEN RETURN FALSE;
END;
/
