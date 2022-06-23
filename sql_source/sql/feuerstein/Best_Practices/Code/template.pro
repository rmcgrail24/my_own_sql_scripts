CREATE OR REPLACE PROCEDURE <name> (
   <parm>_in IN <datatype>
)
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
BEGIN
   <init program>
   
   -- Put your code here
   
   <cleanup program>
EXCEPTION
   WHEN OTHERS
   THEN
      <cleanup program>
      err.handle;
END <name>;
