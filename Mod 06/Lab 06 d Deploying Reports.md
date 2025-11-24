## Exercise: Deploying Reports for Centralised Access (via Web Portal Upload)

In this exercise, you will:

* Save a **Report Builder** report as an `.rdl` file on disk
* Upload the report to the **SSRS web portal**
* Run the report in a browser so it is available to other users

This illustrates **“Deploying reports for centralised access”** in the simplest possible way.

---

### Preparation: Have a report ready in Report Builder

1. Open **Report Builder**.
2. Open the report you created earlier, for example:
   `Internet Sales by Year and Category`.

(If you don’t have one, create a quick table report against `AdventureWorksDW` first or do the exercise Lab 06 Report Builder)

---

### Step 1: Save the report as an .rdl file on disk

1. In **Report Builder**, click **File → Save As**.
2. Choose **This PC** (or a local folder/location).
3. Browse to a folder, for example: `C:\Reports`.
4. In the **Name** box, enter a clear name, for example:
   `InternetSalesByYearAndCategory.rdl`
5. Click **Save**.

You now have a report file (`.rdl`) saved locally.

---

### Step 2: Open the SSRS Web Portal

1. Open a **web browser**.
2. Navigate to your SSRS web portal, for example:
   `http://localhost/Reports` or `http://localhost:8080/reports` . If prompted log on with the student account
3. You should see the **Reporting Services** web portal with folders and items.

---

### Step 3: Upload the report to the report server

1. In the web portal (`http://localhost/Reports`), navigate to the folder where you want to store the report, for example:

   * Create a new folder **BI_Demos**, or
   * Use an existing folder such as **Reports**.
2. Click the **Upload** button (usually at the top).
3. In the file selection dialog:

   * Browse to `C:\Reports`.
   * Select `InternetSalesByYearAndCategory.rdl`.
   * Click **Open**.
4. The report now appears in the folder list in the web portal.

The report is now **deployed to the report server** and stored centrally.

---

### Step 4: Run the report from the web portal

1. In the web portal, click on the report name, for example:
   `InternetSalesByYearAndCategory`.
2. The report opens and runs in the browser.
3. If the report has parameters, enter values and click **View Report**.

Any user with access to this report server and folder can now open the same report from their browser.

---

### How to explain “centralised access” in class

When the report is visible in the browser, you can say something like:

> “We designed this report in Report Builder, saved it as an `.rdl` file
> and uploaded it to the **report server**.
> Now the report is available centrally via the web portal – users only need
> a browser and permission to this folder. They do not need Report Builder
> or direct access to the database.”

---

### What This Exercise Demonstrates

By completing this exercise, you have:

* Taken a **local Report Builder report** (`.rdl`)
* Deployed it to a **central SSRS report server** via the web portal
* Verified that it can be run by users through a **browser**

This is a simple, practical example of:

**Deploying reports for centralised access.**
