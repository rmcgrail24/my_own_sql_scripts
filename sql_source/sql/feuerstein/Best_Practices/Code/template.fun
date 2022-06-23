CREATE OR REPLACE FUNCTION <name> (
   <parm>_in IN <datatype>
)
   RETURN <datatype>
/*
|| STANDARD COPYRIGHT STATEMENT HERE
|| Author:
||   File:
||
|| OVerview:
||
|| Dependencies:
||
|| Exceptions raised:
||
|| Modification History
|| When         Who      What 
||------------------------------------
*/ 
IS
   retval <datatype>;
BEGIN
   -- Put your code here

   RETURN retval;
EXCEPTION
   WHEN OTHERS
   THEN
      err.handle;
END <name>;
