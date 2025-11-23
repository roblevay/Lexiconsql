## Exercise: Importing and Exporting Data from Text Files

*(using the `vEmployee` view in AdventureWorks)*

In this exercise, you will:

* **Export** data from SQL Server to a **text file** (CSV or TXT)
* **Import** that file back into a SQL Server table
* Use the built-in **SQL Server Import and Export Wizard**. Click **Next**

This demonstrates **“Importing and exporting data from text files.”**

---

## Preparation

You need:

* SQL Server with the **AdventureWorks** database
* The view **`HumanResources.vEmployee`** (exists in all versions)
* Permission to write files to e.g. `C:\Data`

Before starting:

1. Create a working folder:
   **Create `C:\Data`** (if it doesn’t already exist)

---

# PART 1 — Export data from SQL Server to a text file

## Step 1: Start the Export Wizard

1. Open **SQL Server Management Studio (SSMS)**.
2. Right-click the **AdventureWorks** database.
3. Choose **Tasks → Export Data…**
   → This opens the **SQL Server Import and Export Wizard**.

---

## Step 2: Choose the source

1. On **Choose a Data Source**:

   * Data source: **SQL Server Native Client 11.0**
   * Server name: your SQL Server instance (`localhost`, `.`, etc.)
   * Authentication: **Use Windows Authentication**
   * Database: **AdventureWorks**
2. Click **Next**.

---

## Step 3: Choose the destination (text file)

1. On **Choose a Destination**:

   * Destination: **Flat File Destination**
   * File name: `C:\Data\Employees.txt`
   * Format: **Delimited**
2. Click **Next**.

---

## Step 4: Choose query mode

1. Choose:
   **Write a query to specify the data to transfer**
2. Click **Next**.

---

## Step 5: Enter the SQL query

Paste this:

```sql
SELECT 
    BusinessEntityID,
    FirstName,
    LastName,
    JobTitle,
    EmailAddress
FROM HumanResources.vEmployee;
```

2. Click **Next**.

---

## Step 6: Configure text file format

1. On **Configure Flat File Destination**:

   * Check **Preview** to ensure columns look correct
   * Click **OK**
2. Click **Next**.

---

## Step 7: Run the export

1. On **Save and Run Package**:

   * Select **Run immediately**
   * (Optional) Save SSIS package if you want
2. Click **Next** → **Finish**.
3. Wait for green checkmarks → **Close**.

---

## Step 8: Verify the exported file

1. Open **C:\Data\Employees.txt**
2. You should see a nicely delimited employee list
   with names, job titles, and email addresses.

Export is done!

---

# PART 2 — Import the text file back into SQL Server

## Step 1: Create a target table

In SSMS, run the following against AdventureWorks:

```sql
DROP TABLE IF EXISTS  dbo.ImportedEmployees
CREATE TABLE dbo.ImportedEmployees
(
    BusinessEntityID INT,
    FirstName        VARCHAR(50),
    LastName         VARCHAR(50),
    JobTitle         VARCHAR(100),
    EmailAddress     VARCHAR(100)
);
```

This will receive the imported data.

---

## Step 2: Start the Import Wizard

1. In SSMS, right-click the **AdventureWorks** database.
2. Choose **Tasks → Import Data…**.

---

## Step 3: Choose the source (text file)

1. On **Choose a Data Source**:

   * Data source: **Flat File Source**
   * File: `C:\Data\Employees.txt`
   * Format: Delimited
2. Click **Next**.

---

## Step 4: Choose destination (SQL Server)

1. Destination: **SQL Server Native Client**
2. Server name: your SQL Server
3. Database: **AdventureWorks**
4. Click **Next**.

---

## Step 5: Select destination table

1. On **Select Source Tables and Views**:

   * Destination: choose **dbo.ImportedEmployees**
2. Click **Edit Mappings…**:

   * Ensure all fields map correctly
3. Click **OK → Next**.

---

## Step 6: Run the import

1. Select **Run immediately**
2. Click **Next → Finish**
3. Confirm that all rows load successfully
4. Click **Close**

---

## Step 7: Verify the import

Run:

```sql
SELECT TOP (20) * 
FROM dbo.ImportedEmployees;
```

You should see the same employee data you exported earlier.

---

# What This Exercise Demonstrates

By completing this exercise, you have:

* Exported data from SQL Server to a **text file**
* Imported the same file back into SQL Server
* Built a simple ETL cycle using the **Import and Export Wizard**
* Used `vEmployee`, a convenient view for demonstrations

This shows exactly how SQL Server handles:

**Importing and exporting data from text files.**

---

