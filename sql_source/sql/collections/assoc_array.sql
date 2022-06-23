DECLARE
  TYPE sum_multiples IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
  n  PLS_INTEGER := 5;   -- number of multiples to sum for display
  sn PLS_INTEGER := 10;  -- number of multiples to sum
  m  PLS_INTEGER := 3;   -- multiple
FUNCTION get_sum_multiples
  (multiple IN PLS_INTEGER, num IN PLS_INTEGER)
  RETURN sum_multiples IS
  s sum_multiples;
  BEGIN
      FOR i IN 1..num LOOP
        s(i) := multiple * ((i * (i + 1)) / 2);
           -- sum of multiples
      END LOOP;
    RETURN s;
  END get_sum_multiples;
BEGIN
-- invoke function to retrieve
-- element identified by subscript (key)
  DBMS_OUTPUT.PUT_LINE
    ('Sum of the first ' || TO_CHAR(n) || ' multiples of ' ||
     TO_CHAR(m) || ' is ' || TO_CHAR(get_sum_multiples (m, sn)(n)));
END;
/
