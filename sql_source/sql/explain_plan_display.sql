SELECT plant_table_output
  FROM TABLE(DBMS_XPLAN.DISPLAY(NULL, 'an1a'));

