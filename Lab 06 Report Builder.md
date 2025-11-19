## Exercise: Designing Reports Quickly with the Report Builder

In this exercise, you will:

* Start **SQL Server Report Builder**
* Create a simple **table report** using the `AdventureWorksDW` data warehouse
* Group and total sales by **year** and **product category**
* Run and save the report

This illustrates **“Designing reports quickly with the Report Builder”** using a guided wizard.

---

### Preparation: Start Report Builder

1. Start **Report Builder** in one of these ways:

   * From the Windows **Start menu** → search for **Microsoft Report Builder**
   * Or from the **Reporting Services web portal** (e.g. `http://localhost/Reports`) and click **Report Builder**.
2. If prompted for a **Report Server** when saving later, use your local report server URL (for example `http://localhost/ReportServer`), or save to **This PC** for a file-based demo.

---

### Step 1: Create a New Table Report with the Wizard

1. When Report Builder opens, choose:

   * **New Report → Table or Matrix Wizard**
     (If you see a start screen, click **Table or Matrix Wizard**.)
2. On the first page, click **Next** to go to the data source selection.

---

### Step 2: Create a Data Source to AdventureWorksDW

1. On **Choose a Dataset** (or **Choose a Data Source**) page:

   * Click **Create a dataset** (if asked).
2. Click **New…** to define a new data source.
3. In the **Data Source Properties** window:

   * Name: `AdventureWorksDW`
   * Connection type: **Microsoft SQL Server**
   * Click **Build…** and set:

     * **Server name**: your SQL Server instance (e.g. `localhost` or `.`)
     * **Log on**: use Windows Authentication or your SQL login
     * **Database**: `AdventureWorksDW`
   * Click **Test Connection** to verify.
   * Click **OK**, then **OK** again.

You now have a data source pointing to your **data warehouse**. Click **Next**

---

### Step 3: Define the Dataset Query

We will create a simple query summarising Internet Sales by **CalendarYear** and **Product Category**.

1. Switch to **Text** mode if needed (button **Edit as Text**).

2. Paste the following query:

   ```sql
SELECT 
    d.CalendarYear,
    pc.EnglishProductCategoryName AS ProductCategory,
    SUM(f.SalesAmount)           AS TotalSales
FROM FactInternetSales f
JOIN DimDate d
    ON f.OrderDateKey = d.DateKey
JOIN DimProduct p
    ON f.ProductKey = p.ProductKey
JOIN DimProductSubcategory ps
    ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN DimProductCategory pc
    ON ps.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY 
    d.CalendarYear,
    pc.EnglishProductCategoryName
ORDER BY 
    d.CalendarYear,
    pc.EnglishProductCategoryName;

   ```

3. Click **Run** (the exclamation mark) to test the query.

4. If you see rows of data, click **OK** to return to the wizard.

5. Click **Next**.

You now have a dataset ready for a quick report.

---

### Step 4: Arrange Fields in the Table Layout

1. On the **Arrange fields** page:

   * Drag **CalendarYear** to the **Row groups** box.
   * Drag **ProductCategory** to **Row groups** under CalendarYear (or to **Row groups** if there is a single area).
   * Drag **TotalSales** to the **Values** box.
2. Click **Next**.

---

### Step 5: Choose Layout and Style

1. On the **Choose the Layout** page:

   * Keep **Show subtotals** checked (if available).
   * Choose **Stepped** or **Block** layout (either is fine for a simple demo).
   * Optionally select **Enable drilldown** if you want categories to expand under years.
2. Click **Next**.
3. On the **Choose a Style** page:

   * Select any style you like (e.g. **Corporate**, **Generic**).
4. Click **Finish**.

Report Builder generates a table report design based on your choices.

---

### Step 6: Preview the Report

1. Click the **Run** button (top left, or the **Run** tab).
2. The report is executed against `AdventureWorksDW`.
3. Check that:

   * You see one row per **product category** under each **calendar year**.
   * **TotalSales** values are shown and (if chosen) subtotals per year appear.

You now have a working **SSRS report** created very quickly using the wizard.

---

### Step 7: Save the Report

1. Click **File → Save As**.
2. Choose:

   * Either your **Report Server** (e.g. `http://localhost/ReportServer`)
     and a folder like **BI Demos**
   * Or **This PC** and save as a `.rdl` file locally (e.g. `C:\Reports\InternetSalesByYearAndCategory.rdl`).
3. Give the report a clear name, for example:
   `Internet Sales by Year and Category`.

---

### Optional Step 8: Add a Simple Year Parameter (Filter)

If you want to show how quickly you can add interactivity:

1. Go back to **Design** view.

2. Right-click the **dataset** in the **Report Data** pane → **Dataset Properties**.

3. Edit the query to filter by year:

   ```sql
   SELECT 
       d.CalendarYear,
       p.EnglishProductCategoryName AS ProductCategory,
       SUM(f.SalesAmount)          AS TotalSales
   FROM FactInternetSales f
   JOIN DimDate d
       ON f.OrderDateKey = d.DateKey
   JOIN DimProduct p
       ON f.ProductKey = p.ProductKey
   JOIN DimProductSubcategory ps
       ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
   JOIN DimProductCategory pc
       ON ps.ProductCategoryKey = pc.ProductCategoryKey
   WHERE d.CalendarYear = @Year
   GROUP BY 
       d.CalendarYear,
       p.EnglishProductCategoryName
   ORDER BY 
       d.CalendarYear,
       p.EnglishProductCategoryName;
   ```

4. Click **OK** – Report Builder will automatically create a **@Year** parameter.

5. Click **Run**.

6. In the parameter box at the top, enter a year (e.g. `2007`) and click **View Report**.

Now the report is **interactive** and filtered by a chosen year.

---

### What This Exercise Demonstrates

By completing this exercise, you have:

* Used **SQL Server Report Builder** to create a report **quickly** with a wizard
* Connected to a **data warehouse (AdventureWorksDW)**
* Designed a **grouped table report** with totals by year and category
* Optionally added a **parameter** for interactive filtering

This is a concrete example of:

**Designing reports quickly with the Report Builder**
within a Business Intelligence solution.

---

