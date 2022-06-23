BEGIN
   dbms_stats.gather_table_stats(
      ownername        => 'HR',
      tabname          => 'WAR_AND_PEACE',
      partname         => NULL,
      estimate_percent => dbms_stats.auto_sample_size,
      block_sample     => FALSE,
      method_opt       => 'FOR ALL COLUMNS SIZE AUTO',
      degree           => dbms_stats.auto_degree,
      granularity      => 'AUTO',
      cascade          => dbms_stats.auto_cascade,
      stattab          => NULL,
      statid           => NULL,
      statown          => NULL,
      no_invalidate    => dbms_stats.auto_invalidate,
      options          => 'GATHER STALE',
      force            => FALSE);
END;
/

