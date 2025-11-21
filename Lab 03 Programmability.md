# Module 3 — Leveraging Server Programmability

## Preparation
These exercises use the **AdventureWorks** database in SQL Server.

---

## Exercise 1: Retrieving Data with SELECT

1. Open **SQL Server Management Studio (SSMS)**.
2. Open a new query window.
3. Run the query:

```sql
USE Adventureworks
SELECT TOP 10 *
FROM Person.Person;
```

4. Review the result set.
5. Modify the query to return only first and last name.

---

## Exercise 2: Modifying Data with INSERT, UPDATE and DELETE

1. Create a simple table for testing:

```sql
DROP TABLE IF EXISTS dbo.EmployeesTest
CREATE TABLE dbo.EmployeesTest
(
    EmployeeID INT,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50)
);
```

2. Insert some rows:

```sql
INSERT INTO dbo.EmployeesTest VALUES (1, 'Anna', 'Smith');
INSERT INTO dbo.EmployeesTest VALUES (2, 'Dave', 'Olsen');
INSERT INTO dbo.EmployeesTest VALUES (3, 'Mia', 'Jones');
```

3. Update the row:

```sql
UPDATE dbo.EmployeesTest
SET LastName = 'Brown'
WHERE EmployeeID = 1;
```

4. Delete the row:

```sql
DELETE FROM dbo.EmployeesTest WHERE EmployeeID = 1;
```

---

## Exercise 3: Using Variables

1. Open a new query window.
2. Run:

```sql
DECLARE @Rate INT;
SET @Rate = 5;
SELECT @Rate AS ValueReturned;
```

3. Modify the value and run again.

---

## Exercise 4: Creating a Stored Procedure

1. Create a simple stored procedure:

```sql
CREATE PROCEDURE dbo.GetTopEmployees
AS
SELECT TOP 5 *
FROM HumanResources.Employee;
```

2. Execute it:

```sql
EXEC dbo.GetTopEmployees;
```

---

## Exercise 5: Creating a Scalar Function

1. Create a function:

```sql
CREATE FUNCTION dbo.ufn_GetFullName
(
    @First VARCHAR(50),
    @Last  VARCHAR(50)
)
RETURNS VARCHAR(120)
AS
BEGIN
    RETURN @First + ' ' + @Last;
END;
```

2. Test it:

```sql
SELECT dbo.ufn_GetFullName('Anna', 'Smith');
```

---

## Exercise 6: Creating a Trigger

1. Create a log table:

```sql
CREATE TABLE dbo.EmployeeLog
(
    LogID INT IDENTITY PRIMARY KEY,
    EmployeeID INT,
    ActionTaken VARCHAR(20)
);
```

2. Create a trigger:

```sql
CREATE TRIGGER trg_LogDelete
ON dbo.EmployeesTest
FOR DELETE
AS
INSERT INTO dbo.EmployeeLog (EmployeeID, ActionTaken)
SELECT EmployeeID, 'Deleted'
FROM deleted;
```

3. Test by deleting a row from `EmployeesTest` and verifying the log.
