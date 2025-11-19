## Exercise: Loading Data into a Data Warehouse

In this exercise, you will:

* Copy data from the **operational database** `AdventureWorks`
* Load it into the **data warehouse** `AdventureWorksDW`
* Use the **SQL Server Import and Export Data Wizard** to perform the load

This illustrates the step **“Loading data into a data warehouse”** in a BI/ETL process.

---

### Preparation: Check that both databases exist

Make sure you have:

* `AdventureWorks` (OLTP / source system)
* `AdventureWorksDW` (data warehouse / target system)

You can verify in **SSMS** under **Databases**.

---

### Step 1: Create a target table in the data warehouse

We will load basic person data from `AdventureWorks.Person.Person`
into a new table in `AdventureWorksDW`.

1. In **SSMS**, connect to your SQL Server instance.
2. Open a new query window against **AdventureWorksDW**.
3. Run the following script:

```sql
CREATE TABLE AdventureWorksDW.dbo.DimPersonDemo
(
    PersonKey         INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    BusinessEntityID  INT               NOT NULL,
    FirstName         VARCHAR(50)       NOT NULL,
    LastName          VARCHAR(50)       NOT NULL
);
```

> `PersonKey` is a simple **surrogate key** for the data warehouse table.
> `BusinessEntityID`, `FirstName`, and `LastName` come from the source system.

---

### Step 2: Start the Import and Export Data Wizard

1. In **SSMS**, right-click the **AdventureWorks** database.
2. Select **Tasks > Export Data…**
   This starts the **SQL Server Import and Export Wizard**.

---

### Step 3: Choose the source (OLTP database)

On the **Choose a Data Source** page:

1. Set **Data source** to `SQL Server Native Client` (or similar).
2. Set **Server name** to your SQL Server instance (e.g. `.` or `localhost`).
3. Use your normal authentication method.
4. Set **Database** to `AdventureWorks`.
5. Click **Next**.

---

### Step 4: Choose the destination (data warehouse)

On the **Choose a Destination** page:

1. Set **Destination** to `SQL Server Native Client` (or similar).
2. **Server name**: same server as above (if both DBs are on the same instance).
3. **Database**: `AdventureWorksDW`.
4. Click **Next**.

Now you have **AdventureWorks** as source and **AdventureWorksDW** as destination.

---

### Step 5: Choose to copy data from a table

On the **Specify Table Copy or Query** page:

1. Select **Copy data from one or more tables or views**.
2. Click **Next**.

---

### Step 6: Select the source and map to the DW table

On the **Select Source Tables and Views** page:

1. Find the table or view that contains person data, for example:
   `Person.Person`
2. Tick the checkbox for this source.
3. In the **Destination** column for that row:

   * Choose **[dbo].[DimPersonDemo]** in `AdventureWorksDW`.
4. Click **Edit Mappings…**:

   * Make sure the following columns map correctly:

     * `BusinessEntityID` → `BusinessEntityID`
     * `FirstName` → `FirstName`
     * `LastName` → `LastName`
   * `PersonKey` in the target is an IDENTITY and does **not** need a mapping.
   * Click **OK**.
5. Click **Next**.

---

### Step 7: Run the load into the data warehouse

On the **Save and Run Package** page:

1. Leave **Run immediately** selected.
2. (Optionally) ignore saving the SSIS package for this simple exercise.
3. Click **Next**.
4. Click **Finish** to start the load.
5. When the operation completes, click **Close**.

The wizard has now copied data from the **operational database** into the **data warehouse table**.

---

### Step 8: Verify the loaded data in the data warehouse

1. In **SSMS**, open a new query window against `AdventureWorksDW`.
2. Run:

```sql
SELECT TOP (20) *
FROM AdventureWorksDW.dbo.DimPersonDemo;
```

You should see:

* A generated **PersonKey** (1, 2, 3, …)
* The `BusinessEntityID` from the source
* `FirstName` and `LastName` from `AdventureWorks.Person.Person`

This confirms that the data has been **loaded into the data warehouse**.

---

### Optional: Simulate a reload (truncate and reload)

To show the idea of periodically reloading a dimension:

1. Run:

```sql
TRUNCATE TABLE AdventureWorksDW.dbo.DimPersonDemo;
```

2. Re-run the **Export Data…** wizard with the same settings to load the data again.

This illustrates how a data warehouse table can be **refreshed** from the source system.

---

### What This Exercise Demonstrates

By completing this exercise, you have:

* Used the **Import and Export Data Wizard** to move data from:

  * Source: `AdventureWorks` (OLTP)
  * Target: `AdventureWorksDW` (data warehouse)
* Created a simple **dimension-like table** (`DimPersonDemo`) in the DW
* Verified that the data is now available for reporting and analysis

This is a practical example of:

**Loading data into a data warehouse**
as part of an overall BI/ETL solution.

