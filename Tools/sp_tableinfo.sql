--https://karaszi.com/sptableinfo-list-tables-and-space-usage


USE master
GO
IF OBJECT_ID('sp_tableinfo') IS NOT NULL DROP PROC sp_tableinfo
GO
CREATE PROCEDURE sp_tableinfo 
 @tblPat sysname = '%'
,@sort char(1) = 'm' 
AS 
--Written by Tibor Karaszi 2010-09-30
--Modified 2010-10-10, fixed rowcount multiplied by number of indexes.
--Modified 2010-10-11, fixed rowcount incorrect with BLOB and row overflow data.
WITH t AS
(
SELECT 
SCHEMA_NAME(t.schema_id) AS schema_name
,t.name AS table_name
,SUM(CASE WHEN p.index_id IN(0,1) AND a.type_desc = 'IN_ROW_DATA' THEN p.rows ELSE 0 END) AS rows
,SUM(CAST((a.total_pages * 8.00) / 1024 AS DECIMAL(9,2))) AS MB 
,SUM(a.total_pages) AS pages 
,ds.name AS location
FROM 
sys.tables AS t
INNER JOIN sys.partitions AS p ON t.OBJECT_ID = p.OBJECT_ID
INNER JOIN sys.allocation_units AS a ON p.hobt_id = a.container_id 
INNER JOIN sys.data_spaces AS ds ON a.data_space_id = ds.data_space_id
WHERE t.name LIKE @tblPat 
GROUP BY SCHEMA_NAME(t.schema_id), t.name, ds.name 
)
SELECT schema_name, table_name, rows, MB, pages, location
FROM t
ORDER BY
CASE WHEN @sort = 'n' THEN table_name END
,CASE WHEN @sort = 'r' THEN rows END DESC
,CASE WHEN @sort = 'm' THEN MB END DESC
,CASE WHEN @sort = 's' THEN schema_name END
GO
EXEC sp_MS_marksystemobject 'sp_tableinfo' 
