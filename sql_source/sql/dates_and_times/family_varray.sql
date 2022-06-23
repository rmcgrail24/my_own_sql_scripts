DROP TABLE family;
DROP TYPE first_names_t;
DROP TYPE child_names_t;

CREATE TYPE first_names_t IS VARRAY (2) OF VARCHAR2(100);
/
CREATE TYPE child_names_t IS VARRAY (1) OF VARCHAR2(100);
/
CREATE TABLE family (
   surname   VARCHAR2(1000),
   parent_names first_names_t,
   children_names child_names_t);

DECLARE
   parents       first_names_t := first_names_t();
   children      child_names_t := child_names_t ();
BEGIN
   parents.EXTEND(2);
   parents(1) := 'Samuel';
   parents(2) := 'Charina';
--
   children.EXTEND;
   children(1) := 'Feather';

--
   INSERT INTO family (surname, parent_names, children_names)
               VALUES ('Assurty', parents, children);
END;
/
SELECT * FROM family
/

