SELECT username,
       opname,
       target_desc,
       sofar,
       totalwork,
       units,
       message
  FROM v$session_longops;

