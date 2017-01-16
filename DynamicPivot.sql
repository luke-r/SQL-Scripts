/* Dynamic Sql Pivot Table */

DECLARE 
	@pivcols AS NVARCHAR(MAX)
    	,@pivquery  AS NVARCHAR(MAX)
	,@pivRowField AS NVARCHAR(MAX)
	,@pivColField AS NVARCHAR(MAX)
	,@pivValField AS NVARCHAR(MAX)
	,@pivTblquery AS NVARCHAR(MAX)
	,@pivColquery AS NVARCHAR(MAX)
	,@pivTbl AS NVARCHAR(MAX)
	,@pivSchema AS NVARCHAR(MAX)
	,@pivDB AS NVARCHAR(MAX);

/* --- Set these local variables --- */
SET @pivRowField = 'Row_Label_Name'
SET @pivColField = 'Col_Label_Name'
SET @pivValField = 'Values_Name'
SET @pivDB = 'Database_Name'
SET @pivTbl = 'Table_Name'
SET @pivSchema = 'Schema_Name'
;
/* Nothing below here needs to be modified when switching between target datasets */
SET @pivColquery = '
	CREATE TABLE
		##Colquery([Name] NVARCHAR(MAX))
	INSERT INTO ##Colquery ([Name])
	SELECT DISTINCT
		' + @pivColField + ' 
	FROM ' + @pivDB + '.' + @pivSchema + '.' + @pivTbl + '
	'
EXEC(@pivColquery)
;
SET @pivTblquery = '
	CREATE TABLE 
		##Cthulhu( ' + @pivValField + ' NVARCHAR(MAX), ' + @pivColField + ' NVARCHAR(MAX), ' + @pivRowField + ' NVARCHAR(MAX)) 
	INSERT INTO ##Cthulhu (' + @pivValField + ', ' + @pivColField + ', ' + @pivRowField + ') 
	SELECT DISTINCT
		COUNT(L.' + @pivValField + ') AS [' + @pivValField + '] 
		,L.' + @pivColField + ' 
		,L.' + @pivRowField + '
	FROM ' + @pivDB + '.' + @pivSchema + '.' + @pivTbl + ' AS L 
	GROUP BY
		L.' + @pivRowField + '
		,L.' + @pivColField 
EXEC(@pivTblquery)
;
SET @pivcols = STUFF((SELECT distinct ',' + QUOTENAME(C.Name) 
            FROM ##Colquery c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)') 
        ,1,1,'')

SET @pivquery = 'SELECT ' + @pivRowField + ', ' + @pivcols + ' from 
            (
                select ' + @pivRowField + ' 
                    , ' + @pivColField + '
                    , ' + @pivValField + '
                from ##Cthulhu
           ) x
            pivot 
            (
                 max(' + @pivValField + ')
                for ' + @pivColField + ' in (' + @pivcols + ')
            ) p '

Execute(@pivquery)

DROP TABLE ##Cthulhu
DROP TABLE ##Colquery
