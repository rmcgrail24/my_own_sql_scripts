CREATE OR REPLACE PROCEDURE profits_before_people (
   advertising_budget IN NUMBER,
   bribery_budget IN OUT NUMBER,
   merge_and_purge_on IN DATE := SYSDATE,
   obscene_bonus OUT NUMBER,
   cut_corners_on_safety IN VARCHAR2 := 'WHENEVER POSSIBLE'
   )
IS
BEGIN
   DBMS_OUTPUT.PUT_LINE (
      'Merge and purge on ' || merge_and_purge_on);

   DBMS_OUTPUT.PUT_LINE (
      'Cut corners on safety: ' || cut_corners_on_safety);

   DBMS_OUTPUT.PUT_LINE ('The American Way?' || CHR(10));

   obscene_bonus := 100000000;

   IF cut_corners_on_safety IS NOT NULL
   THEN
      -- Better build in some protection!
      bribery_budget := bribery_budget * 2;
   END IF;
END;
/

DECLARE
   my_payoff NUMBER;
   "lobbying" NUMBER := 100000;
BEGIN
   /* All positional notation */
   profits_before_people (
      50000000,
      "lobbying",
      SYSDATE+20,
      my_payoff,
      'PAY OFF OSHA'
      );

   /* All positional notation */
   profits_before_people (
      50000000,
      "lobbying",
      SYSDATE+20,
      my_payoff
      );

   /* All named notation, original order. */
   profits_before_people (
      advertising_budget => 50000000,
      bribery_budget => "lobbying",
      merge_and_purge_on => SYSDATE-100,
      obscene_bonus => my_payoff,
      cut_corners_on_safety => 'DISBAND OSHA'
      );

   /* Skip all IN parameters with default values. */
   profits_before_people (
      advertising_budget => 50000000,
      bribery_budget => "lobbying",
      obscene_bonus => my_payoff
      );

   /* Change order with named notation, partial list. */
   profits_before_people (
      obscene_bonus => my_payoff,
      merge_and_purge_on => SYSDATE+20,
      advertising_budget => 50000000,
      bribery_budget => "lobbying"
      );

   /* Blend positional and named notation. You can start
      with positional, but once you switch to named
      notation, you can't go back to positional. */
   profits_before_people (
      50000000,
      "lobbying",
      merge_and_purge_on => SYSDATE+200,
      obscene_bonus => my_payoff
      );
END;
/
