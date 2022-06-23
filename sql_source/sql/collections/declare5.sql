DECLARE TYPE name_rec
  IS RECORD ( first_name VARCHAR2(20), last_name VARCHAR2(25));
   TYPE names IS VARRAY(250) OF name_rec;
BEGIN
   NULL;
END;
/
