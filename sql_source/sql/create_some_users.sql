CREATE OR REPLACE PROCEDURE create_some_users(p_lower_limit IN PLS_INTEGER := 1,
                                              p_upper_limit IN PLS_INTEGER := 10)
AS
--   l_location       VARCHAR2(100) := 'c:\users\russ\Documents\Computers';
   l_filename_create       VARCHAR2(100) := 'make_some_users.sql';
   l_filename_drop       VARCHAR2(100) := 'drop_some_users.sql';

   l_open_mode      VARCHAR2(2)   := 'w';
   l_max_linesize   BINARY_INTEGER DEFAULT 1024;
   
   f1   UTL_FILE.FILE_TYPE;
   f2   UTL_FILE.FILE_TYPE; 
BEGIN
      f1 := UTL_FILE.fopen('USER_DIR', l_filename_create, l_open_mode, l_max_linesize);
      f2 := UTL_FILE.fopen('USER_DIR', l_filename_drop, l_open_mode, l_max_linesize);

   FOR username_idx IN p_lower_limit .. p_upper_limit
   LOOP

      DBMS_OUTPUT.put_line('CREATE USER rm' || LPAD(TO_CHAR(username_idx), 6, '0') 
                                     || ' IDENTIFIED BY rm' || LPAD(TO_CHAR(username_idx), 6, '0')
                                     || CHR(10)
                                     || '   DEFAULT TABLESPACE example QUOTA 10m ON example;');

      DBMS_OUTPUT.put_line(CHR(10) || 'GRANT create session,'
                                     || CHR(10) || '      alter session,'
                                     || CHR(10) || '      create table,'
                                     || CHR(10) || '      create view,'
                                     || CHR(10) || '      create synonym,'
                                     || CHR(10) || '      create database link,'
                                     || CHR(10) || '      create sequence,'
                                     || CHR(10) || '      create trigger,'
                                     || CHR(10) || '      create type,'
                                     || CHR(10) || '      create procedure'
                                     || CHR(10) || '   TO rm' || LPAD(TO_CHAR(username_idx), 6, '0') || ';'
                                     || CHR(10) || CHR(10) || CHR(10));

--      DBMS_OUTPUT.put_line(CHR(10) || 'GRANT create session,'           || CHR(10) || '      alter session,' || CHR(10) || '      create table,' || CHR(10) || '      create view,' || CHR(10) || '      create synonym,' || CHR(10) || '      create database link,' || CHR(10) || '      create sequence,' || CHR(10) || '      create trigger,' || CHR(10) || '      create type,' || CHR(10) || '      create procedure' || CHR(10) || '   TO rm' || LPAD(TO_CHAR(username_idx), 6, '0') || ';' || CHR(10) || CHR(10) || CHR(10));

      UTL_FILE.put_line(f1, 'CREATE USER rm' || LPAD(TO_CHAR(username_idx), 6, '0') 
                                     || ' IDENTIFIED BY rm' || LPAD(TO_CHAR(username_idx), 6, '0')
                                     || CHR(10)
                                     || '   DEFAULT TABLESPACE example QUOTA 10m ON example;', FALSE);

       UTL_FILE.put_line(f2, 'DROP USER rm' || LPAD(TO_CHAR(username_idx), 6, '0') || ';');
   END LOOP;

   DBMS_OUTPUT.put_line('End of dropping users routine');

   UTL_FILE.fclose(f1);
   UTL_FILE.fclose(f2);
END;
/
