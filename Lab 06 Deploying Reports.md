---

## Exercise: Deploying Reports for Centralised Access

In this exercise, you will:

* Take an existing report created in **Report Builder**
* Deploy (save) it to a **central report server**
* Verify that it can be opened from a **web portal** so that other users can access it

This illustrates **“Deploying reports for centralised access”**.

---

### Preparation: Have a report ready

1. Open **Report Builder**.
2. Open the report you created earlier, for example:
   `Internet Sales by Year and Category`.

(If you don’t have one, create a quick table report first using your `AdventureWorksDW` data source.)

---

### Step 1: Identify your Report Server URL

You need the URL to your **SSRS Report Server**, for example:

* `http://localhost/ReportServer` (server endpoint)
* `http://localhost/Reports` (web portal)

If you don’t know it:

1. Ask your administrator, **or**
2. In a browser, try:

   * `http://localhost/Reports`
   * `http://localhost/ReportServer`

If a SQL Server Reporting Services page appears, you’re on the right track.

---

### Step 2: Save (deploy) the report to the Report Server

1. In **Report Builder**, click **File → Save As**.
2. Choose **Recent Sites and Servers** or **Browse** (wording may vary).
3. If your report server is not listed:

   * Click **Add** or type the URL to your report server, e.g.:
     `http://localhost/ReportServer`
   * Press Enter or click **Open**.
4. You should now see folders on the report server (for example **/**, **BI Demos**, etc.).
5. Choose a folder where you want to deploy the report, for example:

   * Create a new folder **BI_Demos** (if allowed)
   * Or use an existing folder such as **Reports**.
6. In the **Name** box, type a clear name, for example:
   `Internet Sales by Year and Category`.
7. Click **Save**.

The report is now **deployed** to the report server.

---

### Step 3: Access the report from the Web Portal

1. Open a web browser.
2. Navigate to the **report portal URL**, for example:
   `http://localhost/Reports`
3. Browse to the folder where you saved the report (e.g. **BI_Demos**).
4. Click on the report name, for example:
   `Internet Sales by Year and Category`.
5. The report runs in the browser, using the central report server.

If the report has parameters, you can change them and click **View Report**.

---

### Step 4: Explain “centralised access” to the class

When the report is visible in the browser, you can say something like:

> “Now this report is deployed to the **report server**.
> That means other users can open a browser, go to the report portal,
> and run the report without needing Report Builder or direct access to the database.
> All security, data connections and layouts are managed centrally.”

If you have multiple users and permissions configured, you can mention that:

* Access can be controlled via **folders and roles** in SSRS.
* Users only need a **browser and the URL**.

---

### What This Exercise Demonstrates

By completing this exercise, you have:

* Saved (deployed) a **Report Builder** report to a **central SSRS report server**
* Opened and run the report via a **web portal**
* Enabled **centralised access** so that multiple users can reach the same report in one place

This is exactly:

**Deploying reports for centralised access**
in a SQL Server Reporting Services environment.

---

