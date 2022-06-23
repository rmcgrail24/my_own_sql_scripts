column global_name new_value gname 
set termout off 
-- If you want the SID instead of the global_name, just use 
-- select instance from v$thread 
-- instead.
--select lower(user) || '@' || decode(global_name, 'ORACLE8.WORLD', '8.0', lower(global_name)) global_name from global_name;
select lower(user) || '@' || lower(global_name) global_name from global_name;
set termout on 
set sqlprompt '&gname> ' 