DECLARE
   CURSOR change_prefs_cur IS
      SELECT PER.name, PREF.name flavor
        FROM person PER, preference PREF
       WHERE PER.name = PREF.person_name
         AND PREF.type = 'ICE CREAM'
         FOR UPDATE OF PREF.name;
BEGIN
   FOR rec IN change_prefs_cur
   LOOP
      IF rec.name LIKE 'FEUERSTEIN%'
      THEN
         UPDATE preference SET name = 'ROCKY ROAD'
          WHERE CURRENT OF change_prefs_cur;
      END IF;
   END LOOP;
END;
/

