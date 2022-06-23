DECLARE
   TYPE NumList IS TABLE OF NUMBER;
   n NumList := NumList(10,20,30,40,50,60,70,80,90,100);
   TYPE NickList IS TABLE OF VARCHAR2(64) INDEX BY VARCHAR2(32);
   nicknames NickList;
BEGIN
   n.DELETE(2);    -- deletes element 2 
   n.DELETE(3,6);  -- deletes elements 3 through 6 
   n.DELETE(7,7);  -- deletes element 7 
   n.DELETE(6,3);  -- does nothing since 6 > 3
   n.DELETE;      -- deletes all elements
   nicknames('Bob') := 'Robert';
   nicknames('Buffy') := 'Esmerelda';
   nicknames('Chip') := 'Charles';
   nicknames('Dan') := 'Daniel';
   nicknames('Fluffy') := 'Ernestina';
   nicknames('Rob') := 'Robert';
-- following deletes element denoted by this key
   nicknames.DELETE('Chip');
-- following deletes elements with keys in this alphabetic range
   nicknames.DELETE('Buffy','Fluffy'); 
END;
/

