@@pkgvar.pkg
CREATE OR REPLACE PROCEDURE test_passing_overhead (counter IN INTEGER)
IS
   thistab pkgvar.reward_tt;
BEGIN
   pkgvar.globtab.DELETE;
   
   FOR rowind IN 1 .. counter
   LOOP
      thistab(rowind).comm := rowind;
      thistab(rowind).nm := 'Steven ' || rowind;
      pkgvar.globtab(rowind).comm := rowind;
      pkgvar.globtab(rowind).nm := 'Steven ' || rowind;
   END LOOP;

   PLVtmr.set_factor (counter);
   PLVtmr.capture;
   pkgvar.passtab (thistab);
   PLVtmr.show_elapsed ('PARAMETER');

   PLVtmr.set_factor (counter);
   PLVtmr.capture;
   pkgvar.passtab;
   PLVtmr.show_elapsed ('GLOBAL');
/*
On 8.1.5:
SQL> @pkgvar.tst 50000
PARAMETER Elapsed: 9.75 seconds. Factored: .0002 seconds.
GLOBAL Elapsed: 1.82 seconds. Factored: .00004 seconds.
*/
END;
/
EXEC test_passing_overhead (&1)
