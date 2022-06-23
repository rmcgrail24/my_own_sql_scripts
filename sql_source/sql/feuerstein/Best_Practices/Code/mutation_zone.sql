DROP TABLE account_transaction;
DROP TABLE account;

CREATE TABLE account
(account_id NUMBER NOT NULL PRIMARY KEY);

CREATE TABLE account_transaction
(account_id       NUMBER       NOT NULL,
 timestamp        DATE         NOT NULL,
 transaction_type VARCHAR2(3)  NOT NULL,
 amount           NUMBER       NOT NULL,
 comments         VARCHAR2(30) );

ALTER TABLE account_transaction
ADD CONSTRAINT valid_account
FOREIGN KEY (account_id)
REFERENCES account(account_id)
ON DELETE CASCADE;

/*
  ||
  || This trigger will ORA-04091 during subsequent inserts
  || in version 7 and 8 but not in 8.1
  ||
*/
CREATE OR REPLACE TRIGGER give_away_free_money
AFTER INSERT ON account
FOR EACH ROW
BEGIN
  INSERT INTO account_transaction
        (account_id,
         timestamp,
         transaction_type,
         amount,
         comments)
  VALUES(:NEW.account_id,
         SYSDATE,
         'DEP',
         100,
         'FREE MONEY!');
END;
/

INSERT INTO account
VALUES(1);

DROP TRIGGER give_away_free_money;

/*
  ||
  || In 7 and 8 one must rely on the interaction of statement and row
  || level triggers and package to avoid ORA-04091
  ||
*/
CREATE OR REPLACE PACKAGE give_away_free_money AS

  PROCEDURE init;
  PROCEDURE record_account_id ( p_account_id NUMBER );
  PROCEDURE give_it_away_now;

END give_away_free_money;
/

CREATE OR REPLACE PACKAGE BODY give_away_free_money AS

  TYPE v_account_list_type IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;
  v_account_list v_account_list_type;

  /*----------------------------------------------------*/
  PROCEDURE init IS
  /*----------------------------------------------------*/
  BEGIN
    v_account_list.DELETE;
  END init;

  /*----------------------------------------------------*/
  PROCEDURE record_account_id ( p_account_id NUMBER ) IS
  /*----------------------------------------------------*/
  BEGIN
    v_account_list(NVL(v_account_list.LAST,0) + 1) := p_account_id;
  END record_account_id;

  /*----------------------------------------------------*/
  PROCEDURE give_it_away_now IS
  /*----------------------------------------------------*/
    v_element PLS_INTEGER;
  BEGIN
    v_element := v_account_list.FIRST;
    LOOP
      EXIT WHEN v_element IS NULL;
      INSERT INTO account_transaction
            (account_id,
             timestamp,
             transaction_type,
             amount,
             comments)
      VALUES(v_account_list(v_element),
             SYSDATE,
             'DEP',
             100,
             'FREE MONEY!');
      v_element := v_account_list.NEXT(v_element);
    END LOOP;
  END give_it_away_now;

END give_away_free_money;
/

CREATE OR REPLACE TRIGGER initialize
BEFORE INSERT ON account
BEGIN
  give_away_free_money.init;
END;
/

CREATE OR REPLACE TRIGGER record_account_id
AFTER INSERT ON account
FOR EACH ROW
BEGIN
  give_away_free_money.record_account_id(:NEW.account_id);
END;
/

CREATE OR REPLACE TRIGGER give_it_away_now
AFTER INSERT ON account
BEGIN
  give_away_free_money.give_it_away_now;
END;
/

INSERT INTO account
VALUES(2);

SELECT *
  FROM account;

SELECT *
  FROM account_transaction;

CREATE OR REPLACE TRIGGER check_for_free_money
AFTER DELETE ON ACCOUNT
FOR EACH ROW
DECLARE
  CURSOR curs_check_for_free_money(cp_account_id NUMBER) IS
  SELECT NULL
    FROM account_transaction
   WHERE account_id = cp_account_id
     AND comments = 'FREE MONEY!';
  v_dummy VARCHAR2(1);
BEGIN
  OPEN curs_check_for_free_money(:OLD.account_id);
  FETCH curs_check_for_free_money INTO v_dummy;
  CLOSE curs_check_for_free_money;
END;
/

DELETE account;

SELECT *
  FROM account;

SELECT *
  FROM account_transaction;
