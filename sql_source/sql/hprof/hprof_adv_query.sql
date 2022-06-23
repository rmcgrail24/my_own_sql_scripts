col name form a40
col function form a40

SELECT RPAD(' ', LEVEL * 2, ' ') || fi.owner || '.' || fi.module AS NAME,
       fi.function,
       pci.subtree_elapsed_time,
       pci.function_elapsed_time,
       pci.calls
  FROM dbmshp_parent_child_info pci JOIN dbmshp_function_info fi
          ON pci.runid = fi.runid AND pci.childsymid = fi.symbolid
 WHERE pci.runid = &run_id
CONNECT BY PRIOR childsymid = parentsymid
START WITH pci.parentsymid = 1;

