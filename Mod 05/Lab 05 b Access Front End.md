## Exercise: Creating a Front-End Interface with Microsoft Access

In this exercise, you will:

* Connect **Microsoft Access** directly to **SQL Server**
* Link SQL Server tables into an Access database
* Build a **simple front-end form** for browsing and editing data
* Understand how Access can act as a lightweight, no-code UI for SQL Server

This demonstrates **“Creating a front-end interface with Access.”**

---

### Preparation

You need:

* SQL Server with the database **AdventureWorks** or **AdventureWorksDW**
* Microsoft **Access**
* Your SQL Server name (e.g. `localhost`, `.`, or `.\SQLEXPRESS`)

For this exercise, we will use the `Person.Person` table from **AdventureWorks** because it is easy to work with.

---

## Step 1: Create a new Access front-end database

1. Start **Microsoft Access** by right-clicking the **Access** shortcut and select **More** and then  **Run as Administrator**. Click **Yes** to allow changes.
2. Choose **Blank Database**.
3. Save the file somewhere, for example:
   `C:\AccessFrontEnd\AdventureWorksFrontEnd.accdb`.

You now have an empty Access database ready to connect.

---

## Step 2: Link to SQL Server tables (ODBC connection)

1. In Access, go to the **External Data** tab.

2. Click **New Data Source → From Other Sources → ODBC Database**.

3. Choose:

   * **Link to the data source by creating a linked table**
     (Important: this keeps data in SQL Server — Access only shows it)
   * Click **OK**.

4. In the dialog, click **Machine Data Source → New…**

5. Choose **User Data Source** → **Next** → pick **SQL Server** driver → **Next** → **Finish**.

6. In the ODBC setup:

   * Data source name: `AdventureWorksDS`
   * Server: your SQL Server (e.g. `North`)
   * Click **Next**
   * Authentication: Windows or SQL Login
   * Leave **Windows NT Authentication** selected and click **Next**
   * Change the default database to **AdventureWorks** and click **Next**
   * Click **Finish** 
   * Click **Test Data Source** and then **OK**.

7. Choose your new DSN (`AdventureWorksDS`) and click **OK**.

8. A list of tables appears. Select:

   * `Person.Person`
   * (Optional) `Person.EmailAddress`
   * (Optional) `Person.PersonPhone`

9. Click **OK**.

Access will now create **linked tables** with a little globe icon, meaning the data is stored in SQL Server.

---

## Step 3: Create a simple front-end form

1. In the **Navigation Pane**, double.click on the linked table `Person_Person`.
2. In the ribbon, click **Create → Form**.

Access automatically generates a full CRUD form:

* You can **browse** records (Next, Previous)
* You can **edit** FirstName, LastName, etc.
* You can **add** new rows
* All changes go directly into SQL Server

This is the simplest possible "front-end interface".

---

## Step 4: Improve the form (optional but recommended)

1. With the form open, from **View**, click **Layout View** or **Design View**.
2. In the **Property Sheet**, you can:

   * Change the title (e.g. *“Person Browser”*)
   * Resize fields
   * Add labels or group boxes
---

## Step 5: Test the interface

1. Switch to **Form View** by selecting View and then **Form View**.
2. Test:

   * Browsing people. Browse to the last record
   * Editing last names or first names
   * Make not of the <BusinessEntityID>
   * Go to the next record to effect the change and then back again
3. Open SQL Server Management Studio and run:

```sql
SELECT TOP 20 * FROM AdventureWorks.Person.Person WHERE BusinessentityID=<Businessentityid>;
```

You will see the changes made in Access reflected in SQL Server instantly.

Close Access without saving changes.


## What This Exercise Demonstrates

By completing this exercise, you have:

* Connected Access to SQL Server using ODBC
* Linked SQL Server tables into an Access front-end
* Created an auto-generated **CRUD form**
* Allowed end users to work with SQL data through a simple UI

This is exactly what is meant by:

**Creating a front-end interface with Access.**


