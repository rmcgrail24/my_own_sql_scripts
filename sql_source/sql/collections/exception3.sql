CREATE PACKAGE pkg AS
   TYPE NumList IS TABLE OF NUMBER;
   PROCEDURE print_numlist (nums NumList);
END pkg;
/
CREATE PACKAGE BODY pkg AS
  PROCEDURE print_numlist (nums NumList) IS
  BEGIN
    FOR i IN nums.FIRST..nums.LAST LOOP
      DBMS_OUTPUT.PUT_LINE(nums(i));
    END LOOP;
  END;
END pkg;
/

DECLARE
   TYPE NumList IS TABLE OF NUMBER;
   n1 pkg.NumList := pkg.NumList(2,4); -- type from the package.
   n2 NumList := NumList(6,8);         -- local type.
BEGIN
   pkg.print_numlist(n1); -- type from pkg is legal
-- The packaged procedure cannot accept
-- a value of the local type (n2)
   pkg.print_numlist(n2);  -- Causes a compilation error.
END;
/
