SET VERIFY OFF
@ssoo
CREATE TABLE UnionBuster (
   ub_id INTEGER,
   labor_type VARCHAR2(100),
   hourly_wage INTEGER);

CREATE INDEX ub_lt ON unionbuster (labor_type);

CREATE SEQUENCE ub_seq;

DECLARE
   rec UnionBuster%ROWTYPE;
   ins_sel_tmr tmr_t := tmr_t.make ('INSERT-SELECT', &1);
   returning_tmr tmr_t := tmr_t.make ('RETURNING', &1);
BEGIN
   ins_sel_tmr.go;
   FOR indx IN 1 .. &1
   LOOP
      INSERT INTO UnionBuster VALUES (ub_seq.NEXTVAL, 'Prison'||indx, 5);
      SELECT ub_id, hourly_wage INTO rec.ub_id, rec.hourly_wage
        FROM UnionBuster
       WHERE labor_type = 'Prison'||indx;
   END LOOP;
   ins_sel_tmr.stop;

   ROLLBACK;

   returning_tmr.go;
   FOR indx IN 1 .. &1
   LOOP
      INSERT INTO UnionBuster VALUES (ub_seq.NEXTVAL, 'Prison'||indx, 5)
         RETURNING ub_id, hourly_wage INTO rec.ub_id, rec.hourly_wage;
   END LOOP;
   returning_tmr.stop;

   ROLLBACK;
/*
Elapsed time for "INSERT-SELECT" = 3.73 seconds. Per repetition timing = .00373 seconds.
Elapsed time for "RETURNING" = .48 seconds. Per repetition timing = .00048 seconds.
*/   
END;
/

DROP TABLE UnionBuster;
DROP SEQUENCE ub_seq;
