/* To obtain a list of health check names, run the following query:

   SELECT name FROM v$hm_check WHERE internal_check='N'; */

BEGIN
    DBMS_HM.RUN_CHECK('Dictionary Integrity Check', 'my_run');
END;
/
/* Most health checks accept input parameters. You can view parameter names and descriptions with the V$HM_CHECK_PARAM view.
   Some parameters are mandatory while others are optional. If optional parameters are omitted, defaults are used.
   The following query displays parameter information for all health checks:

SELECT c.name check_name, p.name parameter_name, p.type, p.default_value, p.description
  FROM v$hm_check_param p JOIN v$hm_check c ON p.check_id = c.id
 WHERE c.internal_check = 'N'
ORDER BY c.name;

   Input parameters are passed in the input_params argument as name/value pairs separated by semicolons (;).
   The following example illustrates how to pass the transaction ID as a parameter to the Transaction Integrity Check:

BEGIN
DBMS_HM.RUN_CHECK (
   check_name   => 'Transaction Integrity Check',
   run_name     => 'my_run',
   input_params => 'TXN_ID=7.33.2');
END;
*/

