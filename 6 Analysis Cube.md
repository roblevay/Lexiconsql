---

# Enkel demo av SQL Server Analysis Services (Multidimensional) med AdventureWorksDW

Den här guiden visar **steg för steg** hur du skapar en **mycket enkel OLAP-kub** i
SQL Server Analysis Services (SSAS Multidimensional) baserad på databasen `AdventureWorksDW`.

Målet är att kunna demonstrera:

* Hur vi bygger en **kub** ovanpå ett data warehouse
* Hur kuben **aggregerar data** (t.ex. försäljning per datum och per år)
* Hur man **drillar** ned i data från år → datum

Guiden utgår från det vi faktiskt gjorde i demon.

---

## Förutsättningar

Du behöver:

1. **SQL Server** med databasen `AdventureWorksDW`
   (t.ex. AdventureWorksDW2019 som döpts om till `AdventureWorksDW`).

2. En **Analysis Services-instans i Multidimensional mode**
   (t.ex. `MSSQLSERVEROLAP` eller motsvarande).

3. **Visual Studio 2022/2026** med tillägget:
   **Microsoft Analysis Services Projects 2022+** installerat.

---

## 1. Installera Analysis Services Projects i Visual Studio

Om mallen för Analysis Services-projekt inte syns:

1. Öppna **Visual Studio**.
2. Gå till **Extensions → Manage Extensions**.
3. Sök efter:
   `Microsoft Analysis Services Projects 2022+`
4. Klicka **Install**.
5. Starta om Visual Studio när den ber om det.

Efter detta ska projekttypen
**“Analysis Services Multidimensional and Data Mining Project”** finnas när du skapar nya projekt.

---

## 2. Skapa ett nytt Analysis Services-projekt

1. Gå till **File → New → Project…**
2. Sök efter: `Analysis Services`.
3. Välj:
   **Analysis Services Multidimensional and Data Mining Project**
4. Klicka **Next**.
5. Ge projektet ett namn, t.ex.
   `AW_Cube_Demo`
6. Klicka **Create**.

Du får nu ett tomt SSAS-projekt med noder som:

* **Data Sources**
* **Data Source Views**
* **Cubes**
* **Dimensions**
* m.m.

---

## 3. Skapa en Data Source mot AdventureWorksDW

1. I **Solution Explorer**:
   högerklicka på **Data Sources** → välj **New Data Source…**
2. Guiden startar → klicka **Next**.
3. Klicka på **New…** för att skapa en ny anslutning.
4. Ange:

   * **Server name:** din SQL Server-instans
   * **Database:** `AdventureWorksDW`
5. Klicka **Test Connection** → sedan **OK** → **OK** igen.
6. Klicka **Next** → **Finish**.

Nu ser du din data source under **Data Sources**.

---

## 4. Skapa en Data Source View (DSV)

Vi bygger en minimal kub på:

* Faktatabellen `FactInternetSales`
* Datumdimensionen `DimDate`

1. I **Solution Explorer**:
   högerklicka på **Data Source Views** → välj **New Data Source View…**
2. Välj data source du nyss skapade → **Next**.
3. I listan över tabeller, markera och lägg till (med pilen **>**):

   * `FactInternetSales`
   * `DimDate`
4. Klicka **Next** → **Finish**.

Du ser nu ett litet stjärnschema med `FactInternetSales` kopplad till `DimDate`.

---

## 5. Skapa kuben (Cube Wizard)

Nu skapar vi en enkel kub med:

* Measures från `FactInternetSales`
* En dimension baserad på `DimDate`

1. I **Solution Explorer**:
   högerklicka på **Cubes** → välj **New Cube…**
2. I Cube Wizard:

   * Välj **Use existing tables** → klicka **Next**.
3. Välj **`FactInternetSales`** som *measure group table*.
   (Guiden brukar föreslå den automatiskt.)
4. Klicka **Next**.
   Markera bara några grundläggande mått, t.ex.:

   * `SalesAmount`
   * `OrderQuantity`
     Klicka **Next**.
5. I steget för dimensioner:

   * Se till att **`DimDate`** är ibockad som dimension.
   * **`FactInternetSales` ska inte vara ibockad som dimension.**
6. Klicka **Next** → **Finish**.

Nu har du en kubdefintion under **Cubes**.

---

## 6. Sätt impersonation-läge för datakällan (vid behov)

När du försöker processa kuben första gången får du ofta ett fel om **impersonation mode**.
Det betyder att SSAS inte vet *under vilket konto* den ska ansluta till SQL Server.

1. Högerklicka på kuben → **Process…**.

2. Om ett fel dyker upp med länk om **impersonation**, klicka på länken.

3. Välj alternativet:

   **Use a specific Windows user name and password**

4. Ange:

   * **User name:** ditt Windows-konto (t.ex. `MASKINNAMN\robert` eller `DOMAIN\robert`)
   * **Password:** ditt Windows-lösenord

5. Klicka **OK**.

Detta gör att Analysis Services kan ansluta till `AdventureWorksDW` med ditt konto när kuben processas.

---

## 7. Processa (bygga) kuben

1. I **Solution Explorer**:
   högerklicka på kuben under **Cubes** → välj **Process…**
2. Om Visual Studio frågar:

   > The project must be deployed before it can be processed.

   → klicka **Yes**.
3. I dialogen **Process Cube**:

   * klicka **Run**.
4. Vänta tills status visar **Process succeeded**.
5. Klicka **Close** → **Close**.

Kuben är nu deployad och processad på SSAS-servern.

---

## 8. Browsa kuben – visa aggregation per datum

Nu kommer själva demon: att kuben kan **summera försäljning per datum**.

1. Dubbelklicka på kuben i **Solution Explorer** för att öppna kubdesignern.
2. Gå till fliken **Browser** överst i kubfönstret.
3. Klicka på **Reconnect** om knappen visas.

### Lägg in ett mått (Sales Amount)

1. I vänstra rutan (Metadata):

   * Expandera **Measures → Fact Internet Sales**.
   * Dra **`Sales Amount`** till mitten där det står
     *“Drop totals or detail fields here”*.

### Lägg in datum som radfält

1. I samma metadata-ruta:

   * Expandera **Date**-dimensionen.
   * Leta upp ett lämpligt datumfält, t.ex.:

     * `Order Date.Date Key` (eller motsvarande).
2. Dra detta fält till rutan
   *“Drop Row Fields Here”*.

Klicka på **!** (Refresh / Reconnect) i Browser om det behövs.

Du ska nu se en matris med:

* En rad per datum
* En summerad `Sales Amount` per datum

Detta är redan en fullt fungerande demo av att:

* Kuben läser från `FactInternetSales`
* Kuben **aggregerar** försäljning per datum

---

## 9. Skapa en hierarki: År → Datum (CalendarYear)

För att även kunna visa försäljning **per år** (och drilla ned till datum) skapar vi en hierarki i datumdimensionen.

### 9.1 Öppna datumdimensionen

1. I **Solution Explorer**, under **Dimensions**:

   * Dubbelklicka på datumdimensionen (t.ex. **Date** eller **Dim Date**).

### 9.2 Skapa en hierarki med CalendarYear och DateKey

1. I rutan **Attributes** (till vänster):

   * Leta upp attributet **`CalendarYear`**.

2. Dra **`CalendarYear`** till mittenrutan där det står:

   *Drag attributes here to create user hierarchies*

   Nu skapas en ny hierarki.

3. Dra sedan ett datumattribut, t.ex. **`DateKey`**, under `CalendarYear` i samma hierarki.
   Resultatet blir en hierarki:

   `CalendarYear` → `DateKey`.

4. Spara dimensionen (**Ctrl+S**).

### 9.3 Processa om dimension och kub

För att hierarkin ska bli tillgänglig i kuben behöver vi processa:

1. Gå tillbaka till kuben (dubbelklicka på den under **Cubes**).
2. Högerklicka på kuben → **Process…** → **Run** → **Close** → **Close**.

---

## 10. Browsa kuben med årshierarkin

Nu kan vi visa **försäljning per år** och drilla ned till datum.

1. Gå till **Browser**-fliken på kuben.
2. Klicka **Reconnect**.
3. I vänstra metadata-rutan:

   * Expandera **Date**-dimensionen.
   * Expandera **Hierarchies**.
   * Leta upp din nya hierarki (den kan heta något i stil med “Hierarchy” eller motsvarande).
4. Dra hierarkin till rutan *“Drop Row Fields Here”*.
5. Se till att **`Sales Amount`** fortfarande ligger i mitten (totals-fältet).

Nu ser du:

* En rad per **år** (t.ex. 2005, 2006, 2007, …)
* Summerad `Sales Amount` per år

Klickar du på **+** framför ett år drillas hierarkin ned till **datum-nivå** (via `DateKey`).

---
