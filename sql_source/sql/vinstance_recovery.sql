SELECT recovery_estimated_ios,
       actual_redo_blks,
       estimated_mttr,
       target_mttr,
       writes_mttr,
       writes_autotune
  FROM v$instance_recovery;

