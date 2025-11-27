# Module 4 — Administering SQL Server Databases

## Preparation
These exercises use **SQL Server Management Studio (SSMS)** and the **AdventureWorks** database.

---

## Exercise 1: Rebuilding or Reorganizing Indexes

1. Open SSMS and expand **AdventureWorks → Tables**.
2. Right-click any table with indexes, e.g. **Person.Person**.
3. Right-click an index
4. Choose **Reorganize** or **Rebuild** and apply.

---

## Exercise 2: Updating Statistics

1. Open a new query window.
2. Run:

```sql
UPDATE STATISTICS Person.Person;
```

3. Confirm success in the Messages tab.

---

## Exercise 3: Backing Up a Database

1. Right-click **AdventureWorks** → **Tasks → Back Up…**
2. Select:
   - Backup type: **Full**
   - Destination: **Disk**
3. Pick a folder such as `C:\Backups`.
4. Click **OK**.

---

## Exercise 4: Restoring a Database

1. Right-click **Databases** → **Restore Database…**
2. Select your backup file.
3. Restore as `AdventureWorks_Restored`.

---

## Exercise 5: Checking Database Integrity

```sql
DBCC CHECKDB ('AdventureWorks');
```

Review results for corruption.

---

## Exercise 6: Monitoring Activity

1. Right-click the SQL Server instance.
2. Choose **Activity Monitor**.
3. Observe:
   - Expensive queries
   - Active sessions
   - Wait times

---

## Exercise 7: Creating a Login

1. Right-click **Security → Logins → New Login…**
2. Login name: `TrainingUser`
3. Authentication: **SQL Server Authentication**
4. Set a password and click **OK**.

---

## Exercise 8: Creating a Database User

1. Expand **AdventureWorks → Security → Users**.
2. Right-click → **New User…**
3. Map to login `TrainingUser`.
4. Add role: **db_datareader**.

---

## Exercise 9: Granting and Revoking Permissions

```sql
GRANT SELECT ON OBJECT::Person.Person TO TrainingUser;
REVOKE SELECT ON OBJECT::Person.Person FROM TrainingUser;
```
