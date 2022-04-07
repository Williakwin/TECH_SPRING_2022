use bank;
CREATE TABLE Account(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    balance FLOAT
);


START TRANSACTION;
    SELECT balance FROM account WHERE id = 1;
    UPDATE account SET balance = 1100 WHERE id = 1;
