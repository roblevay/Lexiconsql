
## Exercise : Transforming and Cleaning Data with the Import and Export Data Wizard

In this exercise, you will:

* Create a **text file** with “dirty” person data using the **Export Data Wizard**
* Import that text file back into SQL Server using the **Import Data Wizard**
* **Clean** the imported data with simple T-SQL (trimming spaces and removing bad rows)

This illustrates **“Transforming and cleaning data”** using tools that are easy to follow.

---

### Preparation: Create the C:\Data folder

1. In Windows, create a folder called `C:\Data` if it does not already exist.

---

### Part 1: Create a “dirty” text file using the Export Data Wizard

1. Open **SQL Server Management Studio (SSMS)**.
2. Right-click the **AdventureWorks** database and select
   **Tasks > Export Data…**
   This starts the **SQL Server Import and Export Wizard**.
3. On the **Choose a Data Source** page:

   * **Data source**: `SQL Server Native Client` (or similar)
   * **Server name**: `.` (local) or your server name
   * Use your normal authentication method
   * **Database**: `AdventureWorks`
   * Click **Next**.
4. On the **Choose a Destination** page:

   * **Destination**: `Flat File Destination`
   * **File name**: `C:\Data\PersonDirty.txt`
   * Check **Column names in the first data row**
   * Click **Next**.
5. On the **Specify Table Copy or Query** page:

   * Select **Write a query to specify the data to transfer**
   * Click **Next**.
6. On the **Provide a Source Query** page, enter:

   ```sql
   SELECT 
       BusinessEntityID,
       ' ' + FirstName + ' ' AS FirstName,
       ' ' + LastName  + ' ' AS LastName
   FROM Person.Person;
   ```

   > The extra spaces around `FirstName` and `LastName` simulate **“dirty” data**.
7. Click **Next**, then **Next** again to get to **Save and Run Package**.
8. On **Save and Run Package**:

   * Leave **Run immediately** checked
   * Click **Next**.
9. Click **Finish** to run the export.
10. When it completes, click **Close**.
11. Open `C:\Data\PersonDirty.txt` in Notepad and verify:

    * The file exists
    * FirstName and LastName have **leading and trailing spaces**.

---

### Part 2: Import and clean the data

#### Step 1: Create a table for the cleaned data

1. In **SSMS**, run the following script to create a target table:

   ```sql
   DROP TABLE IF EXISTS AdventureWorks.dbo.PersonCleanWizard
   CREATE TABLE AdventureWorks.dbo.PersonCleanWizard
   (
       BusinessEntityID INT         NOT NULL,
       FirstName        VARCHAR(50) NOT NULL,
       LastName         VARCHAR(50) NOT NULL
   );
   ```

---

#### Step 2: Import the text file with the Import Data Wizard

1. In **SSMS**, right-click the **AdventureWorks** database.
2. Select **Tasks > Import Data…** to start the **SQL Server Import and Export Wizard**.
3. On the **Choose a Data Source** page:

   * **Data source**: `Flat File Source`
   * **File name**: `C:\Data\PersonDirty.txt`
   * Check **Column names in the first data row**
   * Verify that the delimiter (e.g. comma) matches the file
   * Click **Next**.
4. On the **Choose a Destination** page:

   * **Destination**: `SQL Server Native Client` (or similar)
   * **Server name**: `.` (or your server name)
   * **Database**: `AdventureWorks`
   * Click **Next**.
5. On the **Specify Table Copy or Query** page:

   * Select **Copy data from one or more tables or views**
   * Click **Next**.
6. On the **Select Source Tables and Views** page:

   * The source should be the flat file (shown as one “table”)
   * In the **Destination** column, choose **[dbo].[PersonCleanWizard]**
   * Click **Edit Mappings…**:

     * Verify that `BusinessEntityID`, `FirstName` and `LastName` map correctly
     * Click **OK**
   * Click **Next**.
7. On the **Save and Run Package** page:

   * Keep **Run immediately** selected
   * Click **Next**.
8. Click **Finish** to run the import.
9. When it completes, click **Close**.

---

#### Step 3: Clean the imported data with T-SQL

1. In **SSMS**, inspect the imported data:

   ```sql
   SELECT TOP (20) *
   FROM AdventureWorks.dbo.PersonCleanWizard;
   ```

   You should see that `FirstName` and `LastName` contain extra spaces.
2. Use `LTRIM` and `RTRIM` to trim leading and trailing spaces:

   ```sql
   UPDATE AdventureWorks.dbo.PersonCleanWizard
   SET 
       FirstName = LTRIM(RTRIM(FirstName)),
       LastName  = LTRIM(RTRIM(LastName));
   ```
3. Optionally, remove rows where `LastName` is missing or empty:

   ```sql
   DELETE FROM AdventureWorks.dbo.PersonCleanWizard
   WHERE LastName IS NULL
      OR LTRIM(RTRIM(LastName)) = '';
   ```
4. Verify the cleaned result:

   ```sql
   SELECT TOP (20) *
   FROM AdventureWorks.dbo.PersonCleanWizard;
   ```

   Now the names should be **trimmed**, and rows without a valid last name removed.

---

### What This Exercise Demonstrates

By completing this exercise, you have:

* Used the **Export Data Wizard** to create a flat file with intentionally “dirty” data
* Used the **Import Data Wizard** to load that file into a SQL Server table
* Performed **simple but important cleaning steps** with T-SQL:

  * Trimming spaces with `LTRIM` / `RTRIM`
  * Removing invalid rows

This is a clear, easy-to-follow example of:

**Transforming and cleaning data** in a BI/ETL process.

---

