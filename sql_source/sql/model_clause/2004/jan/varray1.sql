DECLARE
-- Associative array indexed by string:

  TYPE population IS TABLE OF NUMBER  -- Associative array type
    INDEX BY VARCHAR2(64);

  city_population  population;        -- Associative array variable
  i                VARCHAR2(64);

BEGIN
  -- Add new elements to associative array:

  city_population('Smallville')  := 2000;
  city_population('Midland')     := 750000;
  city_population('Megalopolis') := 1000000;

  -- Change value associated with key 'Smallville':

  city_population('Smallville') := 2001;

  -- Print associative array:

  i := city_population.FIRST;

  WHILE i IS NOT NULL LOOP
    DBMS_Output.PUT_LINE('Population of ' || i || ' is ' || TO_CHAR(city_population(i)));
    i := city_population.NEXT(i);
  END LOOP;
END;
/

