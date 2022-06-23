/*
  || Reference event arributes via the
  || provided public synonyms.
*/
DROP TABLE log_create;

CREATE TABLE log_create
(object_type VARCHAR2(30),
 object_name VARCHAR2(30));

CREATE OR REPLACE TRIGGER after_create
AFTER CREATE ON SCHEMA
DECLARE
  /*-- the BAD way with direct referencing */
  v_type VARCHAR2(30) := DICTIONARY_OBJ_TYPE;
  v_name VARCHAR2(30) := DICTIONARY_OBJ_NAME;
BEGIN
  /*-- the GOOD way; via the synonyms */
  INSERT INTO log_create
  VALUES(ORA_DICT_OBJ_TYPE,
         ORA_DICT_OBJ_NAME);
  INSERT INTO log_create
  VALUES(v_type,
         v_name);
END;
/
