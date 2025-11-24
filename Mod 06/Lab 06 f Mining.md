
## 1. Hämta historisk försäljningsdata per år

Målet är att ta fram en enkel tidsserie:
**Total SalesAmount per år**.

1. Öppna **SSMS** och koppla upp dig mot din instans med `AdventureWorksDW`.
2. Kör följande fråga:

```sql
SELECT 
    d.CalendarYear      AS SalesYear,
    SUM(f.SalesAmount)  AS SalesAmount
FROM FactInternetSales f
JOIN DimDate d 
    ON f.OrderDateKey = d.DateKey
GROUP BY d.CalendarYear
ORDER BY d.CalendarYear;
```

3. När resultatet visas i grid:

   * Högerklicka i den övre vänstra tomma rutan i resultatet → välj **Copy with Headers**
     (så att kolumnnamnen följer med).
4. Nu har du en tvåkolumnslista i urklippet med:

   * `SalesYear`
   * `SalesAmount`

---

## 2. Klistra in data i Excel

1. Öppna **Excel**.
2. Skapa en **ny arbetsbok**.
3. Ställ markören i cell A1 och klistra in (Ctrl+V).

Du ska nu se en tabell som ungefär ser ut så här:

| SalesYear | SalesAmount |
| --------: | ----------: |
|      2005 |           … |
|      2006 |           … |
|      2007 |           … |
|         … |           … |

4. Markera hela området (båda kolumnerna inklusive rubrikerna).

---

## 3. Skapa en prognos med Prognosblad (Forecast Sheet)

Nu använder vi Excels inbyggda tidsserie-funktion för att skapa en **prognos**.

1. Med tabellen markerad, gå till fliken **Data** i Excel-menyn.
2. Klicka på **Forecast Sheet**
   (på svenska: **Prognosblad**).
3. Välj **Linjediagram** (Line) som diagramtyp.
4. Kontrollera att:

   * **Timeline / Tidslinje** = `SalesYear`
   * **Values / Värden** = `SalesAmount`
5. I fältet **Forecast End / Slut på prognos**:

   * Välj ett år några år efter sista verkliga året
     (t.ex. om sista året är 2013, prognos fram till 2017).
6. Klicka **Create / Skapa**.

Excel skapar nu ett **nytt blad** med:

* Ett diagram med två delar:

  * **Historiska värden** (originaldata)
  * **Prognosdel** (framtida värden)
* En tabell under diagrammet med både historik och prognos.

---

## 4. Förstå och förklara prognosen

I diagrammet ser du:

* En **blå linje** (standard) för historiska värden – den visar verklig försäljning per år.
* En **orange linje** (standard) för **prognosen** – Excels beräknade trend framåt i tiden.
* Ofta visas även ett **osäkerhetsintervall** (skuggat område) runt prognosen.

