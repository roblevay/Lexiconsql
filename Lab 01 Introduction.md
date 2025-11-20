
# Module 1 — Introducing SQL Server

## Preparation
These exercises use a SQL Server 2019 Developer installation located at:

`C:\Sqlinstall\SQLServer2019-DEV-x64-ENU`

Your SQL Server instance is named:

`North`

You will explore what components are installed, what can be installed, and how to use SQL Server Management Studio (SSMS).

---

# Part 1 — Exploring SQL Server Installation

## Exercise 1: Locate the SQL Server Installer

1. Open **File Explorer**.
2. Browse to:
   ```
   C:\Sqlinstall\SQLServer2019-DEV-x64-ENU
   ```
3. Verify that the setup file **setup.exe** exists.
4. Double-click **setup.exe**.
5. When the SQL Server Installation Center opens, do **not** install anything yet.
6. Review the following tabs:
   - **Planning**
   - **Installation**
   - **Maintenance**

---

## Exercise 2: Explore Installed Features

1. In the SQL Server Installation Center, click **Tools**.
2. Choose **Installed SQL Server features discovery report**.
3. A browser window opens showing a full report.
4. Identify whether the following are installed:
   - Database Engine Services
   - SQL Server Agent
   - Integration Services
   - Analysis Services
   - Reporting Services
   - Client Tools / Connectivity
   - Management Tools (SSMS)

---

## Exercise 3: Explore Available Installation Options

1. Return to the Installation Center.
2. Click **Installation** on the left.
3. Review the feature list under:
   - **New SQL Server stand-alone installation**
4. Review the full selectable components:
   - Database Engine
   - SQL Server Replication
   - Full-Text Search
   - Analysis Services
   - Integration Services
   - Machine Learning Services
   - Reporting Services (separate installer)
   - Management Tools (SSMS – separate installer)

---

# Part 2 — Working With SQL Server Management Studio

## Exercise 4: Start SQL Server Management Studio

1. Open the Start menu.
2. Search for **SQL Server Management Studio**.
3. Launch SSMS.
4. In the **Connect to Server** dialog:
   - Server type: **Database Engine**
   - Server name: `North`
   - Authentication: **Windows Authentication**
5. Click **Connect**.

---

## Exercise 5: Explore Server Objects

1. In SSMS, expand the server `North`.
2. Explore the following folders:
   - **Databases**
   - **Security**
   - **Server Objects**
   - **SQL Server Agent**
3. Note if **SQL Server Agent** is running or stopped.

---

## Exercise 6: Create Your First Database

1. Right-click **Databases** → **New Database…**
2. Name the database:
   ```
   TrainingDB
   ```
3. Click **OK**.

---

## Exercise 7: Run a Simple Query

```sql
SELECT @@VERSION AS SQLServerVersion;
```

---

# Part 3 — Using Management Studio to Create Projects

## Exercise 8: Create a New SQL Server Project

1. In SSMS, open the **View** menu.
2. Select **Solution Explorer**.
3. Click **New Project** in the Solution Explorer window.
4. Choose:
   - Project type: **SQL Server Scripts**
   - Name: `Module1Project`
5. Choose a location (e.g. `C:\Sqlinstall\Projects`) and click **OK**.

---

## Exercise 9: Add a New Query File to the Project

1. In Solution Explorer, right-click the project.
2. Select **Add → New Item…**
3. Choose **Query**.
4. Name it:
   ```
   CheckVersion.sql
   ```
5. Click **Add**.
6. In the new query window, run:
   ```sql
   SELECT @@SERVERNAME, @@VERSION;
   ```

---

## Exercise 10: Create a Folder Structure for Scripts

1. In Solution Explorer, right-click your project.
2. Select **Add → New Folder**.
3. Name the folder:
   ```
   Administration
   ```
4. Create another folder:
   ```
   Queries
   ```
5. Drag your .sql file into the **Queries** folder.

---

## Exercise 11: Add a Connection Profile to the Project

1. In Solution Explorer, right-click **Connections**.
2. Select **Add New Connection**.
3. Set:
   - Server name: `North`
   - Authentication: Windows Authentication
4. Test the connection and click **OK**.

---

## Exercise 12: Execute a Project Script

1. In Solution Explorer, open `CheckVersion.sql`.
2. Ensure the connection selector shows the `North` server.
3. Click **Execute**.
4. Confirm that results appear in the Results window.



