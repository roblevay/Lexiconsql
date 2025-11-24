
## Exercise: Leveraging Excel and Power Pivot

### Goal

In this exercise, you will:

* Load data from the `AdventureWorksDW` data warehouse into **Excel Power Pivot**
* Create a simple **data model** (Date + Product + Internet Sales)
* Build a **Power Pivot-based PivotTable** to analyse sales by year and product category

---

### Preparation

* SQL Server with the database `AdventureWorksDW` available
* Microsoft Excel with the **Power Pivot** add-in installed/available

---

### Step 1: Enable the Power Pivot Add-in (if needed)

1. Open **Excel**.
2. Go to **File → Options**.
3. Choose **Add-ins** in the left menu.
4. At the bottom, next to **Manage**, select **COM Add-ins** and click **Go…**.
5. Tick **Microsoft Power Pivot for Excel**.
6. Click **OK**.

You should now see a **Power Pivot** tab in the Excel ribbon.

---

### Step 2: Create a New Power Pivot Data Model from AdventureWorksDW

1. In Excel, create a **new blank workbook**.
2. Go to the **Power Pivot** tab.
3. Click **Manage** to open the Power Pivot window.
4. In the Power Pivot window, choose
   **Home → Get External Data → From Database → From SQL Server**.
5. In the wizard:

   * **Server name**: your SQL Server instance (e.g. `localhost` or `.\SQLEXPRESS`)
   * Tick **Use Windows Authentication** (or enter credentials if needed).
   * Click **Next**.
6. Choose the database **AdventureWorksDW** from the dropdown.
7. Select **Select from a list of tables and views to choose the data to import**.
8. Click **Next**.

On the list of tables/views:

9. Tick at least:

   * `DimDate`
   * `DimProduct`
   * `FactInternetSales`
10. Click **Finish** and wait for the import to complete.
11. Click **Close** when the import summary appears.

You now have three tables in your **Power Pivot data model**.

---

### Step 3: Check Relationships in Diagram View

1. In the Power Pivot window, go to
   **Home → Diagram View**.
2. Verify that relationships exist:

   * `FactInternetSales[OrderDateKey]` → `DimDate[DateKey]`
   * `FactInternetSales[ProductKey]` → `DimProduct[ProductKey]`

If they are missing:

3. Drag and drop to create them manually:

   * Drag `OrderDateKey` from `FactInternetSales` onto `DateKey` in `DimDate`.
   * Drag `ProductKey` from `FactInternetSales` onto `ProductKey` in `DimProduct`.

This gives you a classic star schema inside Power Pivot.

---

### Step 4: Create a PivotTable from the Data Model

1. In the Power Pivot window, go to
   **Home → PivotTable → PivotTable**.
2. Choose **New Worksheet** and click **OK**.

Excel switches back to the workbook and creates a PivotTable based on the **Power Pivot data model**.

---

### Step 5: Build a Simple Sales Analysis Report

In the **PivotTable Fields** pane (on the right in Excel):

1. Expand **DimDate**:

   * Drag **`CalendarYear`** to **Rows**.
2. Expand **DimProduct**:

   * Drag **`Color`** to **Columns**.
3. Expand **FactInternetSales**:

   * Drag **`SalesAmount`** to **Values**.

You should now see a matrix with:

* **Years** (CalendarYear) as rows
* **Product Categories** as columns
* **Sum of SalesAmount** as values

---


