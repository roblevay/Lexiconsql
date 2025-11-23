## Exercise X: Pulling Data from SQL Server into Excel

In this exercise, you will:

* Connect Microsoft **Excel** directly to a **SQL Server database**
* Import data from a table or query
* Refresh the data easily without re-importing

This demonstrates **“Pulling data from SQL Server into Excel”** — a key way to integrate external data into Office applications.

---

### Preparation

You need:

1. **SQL Server** with the `AdventureWorks` or `AdventureWorksDW` database.
2. **Microsoft Excel** (any modern version).
3. Your **SQL Server name** (for example `localhost`, `.` or `.\SQLEXPRESS`).

---

### Step 1: Open Excel and start the import

1. Open **Excel**.
2. Create a **new blank workbook**.
3. On the ribbon, go to **Data → Get Data → From Database → From SQL Server Database**.
   (In older Excel versions: **Data → Get External Data → From SQL Server**.)

---

### Step 2: Enter server and database

1. In the **SQL Server database** dialog:

   * **Server**: enter your SQL Server name (e.g. `localhost`)
   * **Database** (optional): type `AdventureWorksDW`
   * Click **OK**.
2. If prompted for authentication:

   * Choose **Windows** (if logged in as a valid SQL user)
   * Or **Database** and enter your SQL credentials.
   * Click **Connect**.
   * If prompted about encryption, click **OK**

---

### Step 3: Select data to import

After connecting:

1. A **Navigator** window appears showing available tables and views.
2. Browse and select for example:

   * `DimProduct` or `FactInternetSales`.
3. (Optional) Click **Transform Data** to open Power Query if you want to filter columns or rows.
   * Click **Choose Columns** and then **Choose Columns** 
   * For example, keep only `ProductKey`, `EnglishProductName`, and `Color`. Click **OK**
4. Click **Load and Close** to import the data into Excel.

---

### Step 4: Explore and refresh the data

1. The data is now loaded into an Excel table.
2. You can use:

   * **Sort**, **Filter**, **PivotTable**, or **Charts** for analysis.
3. To refresh the data later:

   * Go to **Data → Refresh All**.
   * Excel will reconnect to SQL Server and fetch updated values.

---

### Optional: Use a custom SQL query

If you prefer a specific dataset:

1. In the **Navigator** window, instead of selecting a table, click **Advanced Options**.

2. Paste your own SQL query, for example:

```sql
SELECT TOP 100
    f.ProductKey,
    SUM(f.SalesAmount) AS TotalSales
FROM FactInternetSales f
GROUP BY f.ProductKey
ORDER BY TotalSales DESC;
```

3. Click **OK → Load** to bring the summarized data into Excel directly.



### What This Exercise Demonstrates

By completing this exercise, you have:

* Connected Excel directly to SQL Server
* Imported and optionally transformed data
* Created a live connection that can be refreshed

This is a straightforward example of:

**Pulling data from SQL Server into Excel.**

