set serveroutput on;

DECLARE
  num_rows NUMBER;
  num_blocks NUMBER;
  avg_row_len NUMBER;
  numlblks NUMBER;
  numdist NUMBER;
  avglblk NUMBER;
  avgdblk NUMBER;
  clstfct NUMBER;
  indlevel NUMBER;

BEGIN
  -- retrieve the values of table statistics on CAP.PEOPLE
  -- statistics table name: CAP.PEOPLE    statistics ID: TEST1

--  DBMS_STATS.GET_TABLE_STATS('CAP','PEOPLE',null,
--    'SAVESTATS','TEST0',
--    num_rows,num_blocks,avg_row_len);

  -- print the values
--  DBMS_OUTPUT.PUT_LINE('num_rows = ' || num_rows || ', num_blocks = ' || num_blocks ||
--                     ', avg_row_len = ' || avg_row_len);

  DBMS_STATS.GET_TABLE_STATS('CAP',
                             'DOCUMENTS',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             num_blocks,
                             avg_row_len);

  DBMS_OUTPUT.PUT_LINE('DOCUMENTS table: num_rows = ' || num_rows || ', num_blocks = ' || num_blocks ||
                     ', avg_row_len = ' || avg_row_len);

  DBMS_STATS.GET_INDEX_STATS('CAP',
                             'DOC_PK',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             numlblks,
                             numdist,
                             avglblk,
                             avgdblk,
                             clstfct,
                             indlevel);

  DBMS_OUTPUT.PUT_LINE('DOC_PK index: num_rows = ' || num_rows
                       || ', num_leaf_blocks = ' || numlblks
                       || ', num_dist_keys = ' || numdist
                       || ', avg_num_leaf_blocks = ' || avglblk
                       || ', avg_num_data_blocks = ' || avgdblk
                       || ', clust_factor = ' || clstfct
                       || ', height_of_index = ' || indlevel);

  DBMS_OUTPUT.PUT_LINE('---');

  DBMS_STATS.GET_TABLE_STATS('CAP',
                             'FUNCTION',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             num_blocks,
                             avg_row_len);

  DBMS_OUTPUT.PUT_LINE('FUNCTION table: num_rows = ' || num_rows || ', num_blocks = ' || num_blocks ||
                     ', avg_row_len = ' || avg_row_len);

  DBMS_STATS.GET_INDEX_STATS('CAP',
                             'FNC_PK',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             numlblks,
                             numdist,
                             avglblk,
                             avgdblk,
                             clstfct,
                             indlevel);

  DBMS_OUTPUT.PUT_LINE('FNC_PK index: num_rows = ' || num_rows
                       || ', num_leaf_blocks = ' || numlblks
                       || ', num_dist_keys = ' || numdist
                       || ', avg_num_leaf_blocks = ' || avglblk
                       || ', avg_num_data_blocks = ' || avgdblk
                       || ', clust_factor = ' || clstfct
                       || ', height_of_index = ' || indlevel);

  DBMS_STATS.GET_INDEX_STATS('CAP',
                             'FNC_UK',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             numlblks,
                             numdist,
                             avglblk,
                             avgdblk,
                             clstfct,
                             indlevel);

  DBMS_OUTPUT.PUT_LINE('FNC_UK index: num_rows = ' || num_rows
                       || ', num_leaf_blocks = ' || numlblks
                       || ', num_dist_keys = ' || numdist
                       || ', avg_num_leaf_blocks = ' || avglblk
                       || ', avg_num_data_blocks = ' || avgdblk
                       || ', clust_factor = ' || clstfct
                       || ', height_of_index = ' || indlevel);

  DBMS_OUTPUT.PUT_LINE('---');

  DBMS_STATS.GET_TABLE_STATS('CAP',
                             'SITE',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             num_blocks,
                             avg_row_len);

  DBMS_OUTPUT.PUT_LINE('SITE table: num_rows = ' || num_rows || ', num_blocks = ' || num_blocks ||
                     ', avg_row_len = ' || avg_row_len);

  DBMS_STATS.GET_INDEX_STATS('CAP',
                             'SIT_PK',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             numlblks,
                             numdist,
                             avglblk,
                             avgdblk,
                             clstfct,
                             indlevel);

  DBMS_OUTPUT.PUT_LINE('SIT_PK index: num_rows = ' || num_rows
                       || ', num_leaf_blocks = ' || numlblks
                       || ', num_dist_keys = ' || numdist
                       || ', avg_num_leaf_blocks = ' || avglblk
                       || ', avg_num_data_blocks = ' || avgdblk
                       || ', clust_factor = ' || clstfct
                       || ', height_of_index = ' || indlevel);

  DBMS_OUTPUT.PUT_LINE('---');

  DBMS_STATS.GET_TABLE_STATS('CAP',
                             'V$ASSIGNMENT_DETAILS',
                             NULL,
                             NULL,
                             NULL,
                             num_rows,
                             num_blocks,
                             avg_row_len);

  DBMS_OUTPUT.PUT_LINE('V$ASSIGNMENT_DETAILS view: num_rows = ' || num_rows || ', num_blocks = ' || num_blocks ||
                     ', avg_row_len = ' || avg_row_len);

END;
/
