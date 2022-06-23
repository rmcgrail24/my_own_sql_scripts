--SELECT SYS_CONTEXT('USERENV', 'SESSION_USER')
--  FROM dual;

SELECT SYS_CONTEXT('USERENV'
--                            , 'ACTION'
--                            , 'AUDITED_CURSORID'
--                            , 'AUTHENTICATION_DATA'
--                            , 'AUTHENTICATION_METHOD'
--                            , 'BG_JOB_ID'
--                            , 'CLIENT_IDENTIFIER'
--                            , 'CLIENT_INFO'
                            , 'SESSION_USER'
                            ) "Parameter"
  FROM dual;

