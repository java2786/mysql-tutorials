drop DATABASE if exists transactiondb;
CREATE DATABASE transactiondb;

USE transactiondb;

create table accounts(
    account_id int primary key,
    account_holder varchar(20),
    balance int
);

insert into accounts(account_id, account_holder, balance) 
  values(101, "Ramesh", 10000);
insert into accounts(account_id, account_holder, balance) 
  values(102, "Suresh", 10000);





DELIMITER $$

CREATE PROCEDURE transfer_6000()
BEGIN
  START TRANSACTION;

  UPDATE accounts
  SET balance = balance - 6000
  WHERE account_id = 101;

  SELECT balance INTO @new_balance
  FROM accounts
  WHERE account_id = 101;

  IF @new_balance < 0 THEN
    ROLLBACK;
    SELECT 'Insufficient balance' AS status;
  ELSE
    UPDATE accounts
    SET balance = balance + 6000
    WHERE account_id = 102;
    COMMIT;
    SELECT 'Transfer successful' AS status;
  END IF;
END$$

DELIMITER ;


CALL transfer_6000();


----------


DELIMITER $$

CREATE PROCEDURE transfer_amount
(IN p_from INT, IN p_to INT, IN p_amount INT)
BEGIN
    DECLARE current_balance INT;

    START TRANSACTION;

    -- Check the sender's current balance
    SELECT balance INTO current_balance
    FROM accounts
    WHERE account_id = p_from;

    IF current_balance < p_amount THEN
        ROLLBACK;
        SELECT 'Insufficient balance. Transaction rolled back.' AS status;
    ELSE
        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_from;

        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to;

        COMMIT;
        SELECT 'Transfer successful. Transaction committed.' AS status;
    END IF;
END$$

DELIMITER ;


CALL transfer_amount(101, 102, 6000);