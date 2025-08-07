CREATE TABLE BankAccounts (
    account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

INSERT INTO BankAccounts VALUES (1, 'Alice', 1000);
INSERT INTO BankAccounts VALUES (2, 'Bob', 500);
-- 1. Start the transaction
BEGIN;

-- 2. Deduct ₹200 from Alice
UPDATE BankAccounts
SET balance = balance - 200
WHERE name = 'Alice';

-- 3. Add ₹200 to Bob
UPDATE BankAccounts
SET balance = balance + 200
WHERE name = 'Bob';

-- 4. If everything is fine, commit the changes
COMMIT;
BEGIN;

UPDATE BankAccounts
SET balance = balance - 200
WHERE name = 'Alice';

-- Oops! Bob's name is misspelled
UPDATE BankAccounts
SET balance = balance + 200
WHERE name = 'Bobb'; -- Error!

ROLLBACK;
SELECT * FROM BankAccounts;



