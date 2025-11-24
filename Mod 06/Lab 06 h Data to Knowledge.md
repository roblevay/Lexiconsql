## Exercise 5: Transferring Data into Knowledge with BI Functionality

In this exercise, you will:

* Load data from the `AdventureWorksDW` data warehouse into **Excel Power Pivot**
* Build a simple BI report (PivotTable + chart)
* Answer concrete business questions and write a short management-style conclusion

The focus is on turning **data into insights**, not bara teknik.

---

### Step 1: Open Excel and Enable Power Pivot

1. Open **Excel** and select **new blank workbook**
3. Go to **File → Options**.
4. Select **Add-ins** in the left menu.
5. At the bottom, next to **Manage**, choose **COM Add-ins** and click **Go…**.
6. Tick **Microsoft Power Pivot for Excel**.
7. Click **OK**.

You should now see a **Power Pivot** tab in the Excel ribbon.

---

### Step 2: Open Power Pivot


1. Click the **Power Pivot** tab.
2. Click **Manage** to open the Power Pivot window.

---

### Step 3: Import Data from AdventureWorksDW into the Data Model

1. In the Power Pivot window, go to
   **Home → Get External Data → From Database → From SQL Server**.
2. In the wizard:

   * **Server name**: your SQL Server instance (for example `localhost` or `.\SQLEXPRESS`)
   * Authentication: use **Windows Authentication** (or correct credentials).
   * Click **Next**.
3. Select the database **AdventureWorksDW**.
4. Choose **Select from a list of tables and views to choose the data to import**.
5. Click **Next**.
6. In the list of tables, tick:

   * `DimDate`
   * `DimProduct`
   * `FactInternetSales`
7. Click **Finish** and wait for the import to complete.
8. Click **Close** on the import summary.

You now have three tables in your Power Pivot data model.

---

### Step 4: Check and Create Relationships (Data Model)

1. In the Power Pivot window, switch to **Diagram View**
   (**Home → Diagram View**).
2. Verify that the following relationships exist:

   * `FactInternetSales[OrderDateKey]` → `DimDate[DateKey]`
   * `FactInternetSales[ProductKey]` → `DimProduct[ProductKey]`
3. If a relationship is missing, create it by dragging:

   * Drag `OrderDateKey` in `FactInternetSales` onto `DateKey` in `DimDate`.
   * Drag `ProductKey` in `FactInternetSales` onto `ProductKey` in `DimProduct`.

You now have a star schema (Date + Product + Internet Sales) ready for BI analysis.

---

### Step 5: Create a PivotTable Based on the Data Model

1. In the Power Pivot window, go to
   **Home → PivotTable → PivotTable**.
2. Select **New Worksheet** and click **OK**.

Excel switches back to the workbook and creates a PivotTable **based on the data model**.

---

### Step 6: Build a Sales Analysis Report

In the **PivotTable Fields** pane (on the right in Excel):

1. From **DimDate**, drag **`CalendarYear`** to **Rows**.
2. From **DimProduct**, drag **`Color`** to **Columns**.
3. From **FactInternetSales**, drag **`SalesAmount`** to **Values**.

You should now see a matrix showing **total Internet Sales** by **year** and **product category**.

---

### Step 7: Add a BI Visualization (PivotChart)

1. Click anywhere inside the PivotTable.
2. Go to **Insert → PivotChart**.
3. Choose a suitable chart type, for example **Column** or **Line**.
4. Click **OK**.
5. Resize and position the chart so that both chart and PivotTable are clearly visible.

This chart is part of the **BI functionality** that helps turn numbers into something easier to understand at a glance.

---

### Step 8: Answer Business Questions Using the BI Report

Using the PivotTable and the chart, answer the following questions:

1. Which **year** has the highest total Internet Sales?
2. Which **Color** has the highest sales in the **latest year**?
3. Is there any **Color** that clearly grows faster than the others over time?
4. Is there any **year** where sales **decrease** compared to the previous year?

Write your answers as short bullet points in an empty area of the worksheet, for example:

* The highest total sales occur in year **….**
* The best-selling Color in the latest year is **….**
* Color **….** shows the strongest growth between year **A** and **B**.
* Sales decrease in year **….** compared to year **….**



