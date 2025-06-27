BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loans';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Customers (
  CustomerID NUMBER,
  Age NUMBER,
  InterestRate NUMBER,
  Balance NUMBER,
  IsVIP VARCHAR2(5),
  Name VARCHAR2(100)
);
/

CREATE TABLE Loans (
  LoanID NUMBER,
  CustomerID NUMBER,
  DueDate DATE
);
/

INSERT INTO Customers VALUES (1, 65, 10, 12000, NULL, 'Ravi');
INSERT INTO Customers VALUES (2, 45, 12, 8000, NULL, 'Sneha');
INSERT INTO Customers VALUES (3, 70, 9, 15000, NULL, 'Amit');
/

INSERT INTO Loans VALUES (101, 1, SYSDATE + 10);
INSERT INTO Loans VALUES (102, 2, SYSDATE + 40);
INSERT INTO Loans VALUES (103, 3, SYSDATE + 5);
/

BEGIN
  FOR cust IN (SELECT CustomerID, Age, InterestRate FROM Customers) LOOP
    IF cust.Age > 60 THEN
      UPDATE Customers
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = cust.CustomerID;
    END IF;
  END LOOP;
  COMMIT;
END;
/

BEGIN
  FOR cust IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF cust.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'TRUE'
      WHERE CustomerID = cust.CustomerID;
    END IF;
  END LOOP;
  COMMIT;
END;
/

BEGIN
  FOR loan IN (
    SELECT LoanID, CustomerID, DueDate
    FROM Loans
    WHERE DueDate <= SYSDATE + 30
  ) LOOP
    DECLARE
      customer_name VARCHAR2(100);
    BEGIN
      SELECT Name INTO customer_name
      FROM Customers
      WHERE CustomerID = loan.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Reminder: Dear ' || customer_name ||
                           ', your loan (ID: ' || loan.LoanID ||
                           ') is due on ' || TO_CHAR(loan.DueDate, 'DD-MON-YYYY'));
    END;
  END LOOP;
END;
/

SELECT * FROM Customers;



