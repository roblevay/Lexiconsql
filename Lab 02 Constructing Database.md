# 📄 **Module 2 — Part 1: Constructing a Relational Database**

*(Choosing file size & growth, Working with schemas)*


# Module 2 — Constructing a Relational Database


---

## Exercise 1: Choosing Optimal File Size and Growth Settings

1. Open **SQL Server Management Studio (SSMS)**.
2. Right-click **Databases** and select **New Database**
3. Type the database name **TrainingDB** 
4. In the **Files** page, type the following values:
   - Initial database size (MB)   **1000 MB**
   - Intitial Log File Size (MB) **200 MB**
5. Change the autogrowth settings:
   - For the **data file**: set autogrowth to **64 MB**.
   - For the **log file**: set autogrowth to **32 MB**.
6. Click **OK**.
8. Verify the changes by opening the **Files** page again.

---

## Exercise 2: Working with Database Schemas

1. In SSMS, expand **TrainingDB → Security → Schemas**.
2. Right-click **Schemas** → choose **New Schema…**.
3. Enter:
   - Name: `training`
   - Owner: leave default
4. Click **OK**.
5. Create a new table in this schema:

```sql
CREATE TABLE training.TestTable
(
    ID INT,
    Note VARCHAR(50)
);
```

6. Expand **AdventureWorks → Tables** and verify that the table appears under `training`.



# 📄 **Module 2 — Part 2: Defining Tables**  
*(Data types, Indexing, Altering columns)*


## Preparation
These exercises use a new table named **TrainingEmployees**.

---

## Exercise 3: Specifying Appropriate Data Types

1. In SSMS, open a new query window.
2. Create a table with different data types:

```sql
CREATE TABLE dbo.TrainingEmployees
(
    EmployeeID INT,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    BirthDate  DATE,
    Salary     DECIMAL(10,2)
);
```

3. Execute the script.
4. Right-click the table → **Design** and confirm that each column uses the correct type.

---

## Exercise 4: Indexing Tables with Management Studio

1. Right-click **dbo.TrainingEmployees** → **Design**.
2. Select **EmployeeID**.
3. In the **Indexes/Keys** window:

   * Click **Add**.
   * Set **Type** to *Nonclustered*.
   * Name it: `IX_TrainingEmployees_EmployeeID`.
4. Click **OK** and save the table.
5. Expand **Indexes** under the table to verify the new index.

---

## Exercise 5: Adding, Modifying and Removing Columns

1. In SSMS, run:

```sql
ALTER TABLE dbo.TrainingEmployees
ADD Email VARCHAR(100);
```

2. Modify the column:

```sql
ALTER TABLE dbo.TrainingEmployees
ALTER COLUMN Email VARCHAR(150);
```

3. Remove the column:

```sql
ALTER TABLE dbo.TrainingEmployees
DROP COLUMN Email;
```

4. Right-click the table → **Refresh** and confirm the change.




# 📄 **Module 2 — Part 3: Safeguarding Data with Constraints**  
*(Primary keys, Check constraints, Foreign keys)*


# Module 2 — Safeguarding Data with Constraints

## Preparation
These exercises build on your training tables.



## Exercise 6: Enforcing Uniqueness with Primary Keys

1. In SSMS, open a query window.
2. Add a primary key to the `TrainingEmployees` table:

```sql
ALTER TABLE dbo.TrainingEmployees
ADD CONSTRAINT PK_TrainingEmployees
PRIMARY KEY (EmployeeID);
```

3. Expand **Keys** under the table to verify the PK.

---

## Exercise 7: Validating Conditions with Check Constraints

1. Create a check constraint to ensure salary is always positive:

```sql
ALTER TABLE dbo.TrainingEmployees
ADD CONSTRAINT CK_TrainingEmployees_Salary_Positive
CHECK (Salary > 0);
```

2. Test by trying to insert invalid data:

```sql
INSERT INTO dbo.TrainingEmployees
VALUES (1, 'Eva', 'Sun', '1980-01-01', -100);
```

3. Confirm that SQL Server rejects the row.

---

## Exercise 8: Protecting Relationships with Foreign Keys

1. Create a department table:

```sql
CREATE TABLE dbo.TrainingDepartments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```

2. Add a foreign key to `TrainingEmployees`:

```sql
ALTER TABLE dbo.TrainingEmployees
ADD DepartmentID INT;

ALTER TABLE dbo.TrainingEmployees
ADD CONSTRAINT FK_TrainingEmployees_Departments
FOREIGN KEY (DepartmentID)
REFERENCES dbo.TrainingDepartments(DepartmentID);
```

3. Try inserting a row with an invalid DepartmentID and confirm that SQL Server blocks it.

```sql
INSERT INTO dbo.TrainingEmployees
VALUES (1, 'Eva', 'Sun', '1980-01-01', -100);
```

