-- Drop tables
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Accounts';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Create tables
CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  Balance NUMBER
);


CREATE TABLE Employees (
  EmployeeID NUMBER,
  DepartmentID NUMBER,
  Salary NUMBER
);
/

-- Insert data
INSERT INTO Accounts VALUES (1001, 5000);
INSERT INTO Accounts VALUES (1002, 3000);
/

INSERT INTO Employees VALUES (1, 101, 30000);
INSERT INTO Employees VALUES (2, 102, 25000);
INSERT INTO Employees VALUES (3, 101, 28000);
/

-- Interest procedure
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR acc IN (SELECT AccountID, Balance FROM Accounts) LOOP
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountID = acc.AccountID;
  END LOOP;
END;
/

BEGIN
  ProcessMonthlyInterest;
END;
/

-- Bonus procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_dept_id IN NUMBER,
  p_bonus_percent IN NUMBER
) IS
BEGIN
  FOR emp IN (SELECT EmployeeID, Salary FROM Employees WHERE DepartmentID = p_dept_id) LOOP
    UPDATE Employees
    SET Salary = Salary + (Salary * (p_bonus_percent / 100))
    WHERE EmployeeID = emp.EmployeeID;
  END LOOP;
END;
/

BEGIN
  UpdateEmployeeBonus(101, 10);
END;
/

-- Transfer procedure
CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account IN NUMBER,
  p_to_account IN NUMBER,
  p_amount IN NUMBER
) IS
  v_balance NUMBER;
BEGIN
  SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = p_from_account;

  IF v_balance >= p_amount THEN
    UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account;
    UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account;
    DBMS_OUTPUT.PUT_LINE('Transfer successful.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient balance.');
  END IF;
END;
/

BEGIN
  TransferFunds(1001, 1002, 1000);
END;
/

-- Show results
SELECT * FROM Accounts;
SELECT * FROM Employees;
