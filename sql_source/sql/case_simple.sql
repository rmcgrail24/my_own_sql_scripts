DECLARE
    grade CHAR(1) := 'G';
    appraisal VARCHAR2(20);
BEGIN
    appraisal :=
      CASE grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Very Good'
        WHEN 'C' THEN 'Good'
        WHEN 'D' THEN 'Fair'
        WHEN 'F' THEN 'Poor'
        ELSE 'No such grade'
      END;
    DBMS_OUTPUT.PUT_LINE
      ('Grade ' || grade || ' is ' || appraisal);
END;
.
/

