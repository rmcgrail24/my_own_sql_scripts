/* Formatted by PL/Formatter v3.1.2.1 on 2001/01/27 16:17 */

CREATE OR REPLACE PROCEDURE genlenpkg (
   tab_in   IN   VARCHAR2,
   sch_in   IN   VARCHAR2 := NULL
)
IS
   CURSOR cur_cols (
      l_owner   VARCHAR2,
      l_table   VARCHAR2
   )
   IS
      SELECT column_name, data_length
        FROM all_tab_columns
       WHERE owner = UPPER (l_owner)
         AND table_name = UPPER (l_table)
         AND data_type = 'VARCHAR2'
       ORDER BY column_id;
BEGIN
   pl ('CREATE OR REPLACE PACKAGE ' || tab_in || '$collen' || ' AS');

   FOR rec IN cur_cols (NVL (sch_in, USER), tab_in)
   LOOP
      pl ('   ' || rec.column_name || ' CONSTANT PLS_INTEGER := ' ||
             rec.data_length ||
             ';'
      );
   END LOOP;

   pl ('END PACKAGE ' || tab_in || '$collen;');
END genlenpkg;


