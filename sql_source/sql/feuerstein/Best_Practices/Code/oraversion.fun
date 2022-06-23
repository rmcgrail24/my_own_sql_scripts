drop package oraversion;

CREATE OR REPLACE FUNCTION oraversion
   RETURN VARCHAR2
IS
   retval VARCHAR2 (100);
BEGIN
   SELECT SUBSTR (version, 1, 3)
     INTO retval
     FROM product_component_version
    WHERE UPPER (product) LIKE 'ORACLE7%'
       OR UPPER (product) LIKE 'PERSONAL ORACLE%'
       OR UPPER (product) LIKE 'ORACLE8%';
   RETURN retval;
EXCEPTION
   WHEN OTHERS
   THEN
      RETURN NULL;
END;
/   
