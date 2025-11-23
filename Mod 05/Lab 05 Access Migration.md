# Exercise: Migrating an Access Database to SQL Server

*(using SQL Server Migration Assistant for Access — SSMA)*

In this exercise, you will:

* Open an Access database in **SSMA for Access**
* Connect SSMA to SQL Server
* Convert Access tables to SQL Server format
* Load (migrate) the data
* Verify the migrated objects

This demonstrates **“Migrating an Access database to SQL Server.”**

---

## Preparation

You need:

1. Microsoft **Access** installed
2. **SQL Server** instance (e.g. `localhost`)
3. A small Access database (for example `C:\Data\Employees.accdb`)
   – anything with a few tables works
4. **SSMA for Access** installed (which you already have)

If you don’t have an Access file, create a simple one with a single table like:

* `Employees` with fields: `ID`, `FirstName`, `LastName`, `HireDate`

Or, you can download the file **AccessExample.accdb** from  **https://github.com/roblevay/Lexiconsql/** and save it to disk.

---

# PART 1 — Open the Access database in SSMA

## Step 1: Start SSMA for Access

1. Open **SQL Server Migration Assistant for Access**.
2. Click **Close** to exit the wizard.
3. Click **File** and then **New Project**
4. Enter:

   * Name: `AccessMigrationDemo`
   * Location: anywhere
   * Choose **SQL Server 2019** as the migration target
     
5. Click **OK**


---

## Step 2: Add your Access database

1. Click **Add Databases…** (upper left).
2. Browse to your Access file, e.g.:
   `C:\Data\AccessExample.accdb`
3. Click **Open**.
4. Verify that the database **AccessExample** and the table **Employees** are selected (or whatever else you have used and click **Next**

---

## Step 3: Choose a target database

You have two options:

### Option A — Create a new SQL Server database

1. In **SQL Server Management Studio**, right-click **Databases** → **Create New Database**.
2. Name it: `AccessMigratedDB`.
3. Click **OK**.

### Option B — Use an existing SQL Server database

(less common in demos)

# PART 4 — Connect SSMA to SQL Server

## Step 1: Connect to the SQL Server instance

1. Click **Connect to SQL Server**.
2. Fill in:
   
   * Server name: `localhost` (or your instance)
   * Database name: **AccessMigratedDB**
   * Authentication: **Windows Authentication**
3. Click **Finish**.

You should now see your SQL Server databases.

---



---

# PART 3 — Convert and migrate the schema

## Step 1: Convert the Access schema

1. In **Access Metadata Explorer**, right-click the Access database.
2. Choose **Convert Schema**.

SSMA now converts Access objects into SQL Server equivalents.



---

## Step 2: Load (migrate) data into SQL Server

1. Right-click the Access database again.
2. Choose **Convert,Load and Migrate**.
3. SSMA now copies all rows from each Access table into SQL Server.

You will see green checkmarks when successful.

Converted tables appear under:

* **SQL Server Metadata Explorer → AccessMigratedDB → Tables**

---

# PART 4 — Verify the migration

## Step 1: Refresh SQL Server Metadata

1. In the SQL Server tree, right-click on **Tables** → **Refresh**.
2. Your Access tables should appear, e.g.:

* `Employees`

* or whatever existed in the Access file

---

## Step 2: Verify in SSMS

1. Open SQL Server Management Studio (SSMS).
2. Connect to SQL Server.
3. Expand the database `AccessMigratedDB`.
4. Open the new tables.
5. Run:

```sql
SELECT TOP 20 * FROM AccessMigratedDB.dbo.Employees;
```

You should see the same rows that existed in Access.


# What This Exercise Demonstrates

By completing this exercise, you have:

* Opened an Access database in SSMA
* Connected to SQL Server
* Converted Access schema to SQL Server schema
* Migrated data
* Verified the migration in SSMS

This is a full demonstration of:

**Migrating an Access database to SQL Server.**

När SSMA migrerar tabeller skapar den automatiskt en extra kolumn
som heter SSMA_TimeStamp. Den behövs bara för Access-synkning och
parallella uppdateringar. I SQL Server kan vi tryggt ta bort den.


