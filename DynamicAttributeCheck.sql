DECLARE 
	@userinput1 varchar(MAX)
	,@userinput2 varchar(MAX)
	,@userinput3 varchar(MAX)
	,@syssql nvarchar(MAX)
	,@acsql nvarchar(MAX)
	,@acselect1 nvarchar(MAX)
	,@acgroup1 nvarchar(MAX)
	,@acjoin1 nvarchar(MAX)
	,@accol1 nvarchar(MAX)
	,@accol2 nvarchar(MAX)
	,@accol3 nvarchar(MAX)
	,@accol4 nvarchar(MAX)
	,@accol5 nvarchar(MAX)
	,@accol6 nvarchar(MAX)
	,@accol7 nvarchar(MAX)
	,@accol8 nvarchar(MAX)
	,@accol9 nvarchar(MAX)
	,@accol10 nvarchar(MAX)
	,@accol11 nvarchar(MAX)
	,@accol12 nvarchar(MAX)
	,@accol13 nvarchar(MAX)
	,@accol14 nvarchar(MAX)
	,@accol15 nvarchar(MAX)
	,@accol16 nvarchar(MAX)
	,@accol17 nvarchar(MAX)
	,@accol18 nvarchar(MAX)
	,@accol19 nvarchar(MAX)
	,@accol20 nvarchar(MAX)
	,@accol21 nvarchar(MAX)
	,@accol22 nvarchar(MAX)
	,@accol23 nvarchar(MAX)
	,@accol24 nvarchar(MAX)
	,@accol25 nvarchar(MAX)
	,@accol26 nvarchar(MAX)
	,@accol27 nvarchar(MAX)
	,@accol28 nvarchar(MAX)
	,@accol29 nvarchar(MAX)
	,@accol30 nvarchar(MAX)
	,@accol31 nvarchar(MAX)
	,@accol32 nvarchar(MAX)
	,@accol33 nvarchar(MAX)
	,@accol34 nvarchar(MAX)
	,@accol35 nvarchar(MAX)
	,@accol36 nvarchar(MAX)
	,@accol37 nvarchar(MAX)
	,@accol38 nvarchar(MAX)
	,@accol39 nvarchar(MAX)
	,@accol40 nvarchar(MAX)
	,@accol41 nvarchar(MAX)
	,@accol42 nvarchar(MAX)
	,@accol43 nvarchar(MAX)
	,@accol44 nvarchar(MAX)
	,@accol45 nvarchar(MAX)
	,@accol46 nvarchar(MAX)
	,@accol47 nvarchar(MAX)
	,@accol48 nvarchar(MAX)
	,@accol49 nvarchar(MAX)
	,@accol50 nvarchar(MAX)
	,@getnumcols nvarchar(MAX)
	,@ioccol1 nvarchar(MAX)
	,@ioccol2 nvarchar(MAX)
	,@ioccol3 nvarchar(MAX)
	,@ioccol4 nvarchar(MAX)
	,@ioccol5 nvarchar(MAX)
	,@ioccol6 nvarchar(MAX)
	,@ioccol7 nvarchar(MAX)
	,@ioccol8 nvarchar(MAX)
	,@ioccol9 nvarchar(MAX)
	,@ioccol10 nvarchar(MAX)
	,@ioccol11 nvarchar(MAX)
	,@ioccol12 nvarchar(MAX)
	,@ioccol13 nvarchar(MAX)
	,@ioccol14 nvarchar(MAX)
	,@ioccol15 nvarchar(MAX)
	,@ioccol16 nvarchar(MAX)
	,@ioccol17 nvarchar(MAX)
	,@ioccol18 nvarchar(MAX)
	,@ioccol19 nvarchar(MAX)
	,@ioccol20 nvarchar(MAX)
	,@ioccol21 nvarchar(MAX)
	,@ioccol22 nvarchar(MAX)
	,@ioccol23 nvarchar(MAX)
	,@ioccol24 nvarchar(MAX)
	,@ioccol25 nvarchar(MAX)
	,@ioccol26 nvarchar(MAX)
	,@ioccol27 nvarchar(MAX)
	,@ioccol28 nvarchar(MAX)
	,@ioccol29 nvarchar(MAX)
	,@ioccol30 nvarchar(MAX)
	,@ioccol31 nvarchar(MAX)
	,@ioccol32 nvarchar(MAX)
	,@ioccol33 nvarchar(MAX)
	,@ioccol34 nvarchar(MAX)
	,@ioccol35 nvarchar(MAX)
	,@ioccol36 nvarchar(MAX)
	,@ioccol37 nvarchar(MAX)
	,@ioccol38 nvarchar(MAX)
	,@ioccol39 nvarchar(MAX)
	,@ioccol40 nvarchar(MAX)
	,@ioccol41 nvarchar(MAX)
	,@ioccol42 nvarchar(MAX)
	,@ioccol43 nvarchar(MAX)
	,@ioccol44 nvarchar(MAX)
	,@ioccol45 nvarchar(MAX)
	,@ioccol46 nvarchar(MAX)
	,@ioccol47 nvarchar(MAX)
	,@ioccol48 nvarchar(MAX)
	,@ioccol49 nvarchar(MAX)
	,@ioccol50 nvarchar(MAX)
	,@userinput0 AS NVARCHAR(MAX)
	,@pivcols AS VARCHAR(MAX)
    ,@pivquery  AS VARCHAR(MAX)
	,@pivRowFieldName AS VARCHAR(MAX)
	,@pivRowFieldName2 AS VARCHAR(MAX)
	,@pivRowFieldName3 AS VARCHAR(MAX)
	,@pivRowFieldName4 AS VARCHAR(MAX)
	,@pivRowFieldName5 AS VARCHAR(MAX)
	,@userinput2query AS VARCHAR(MAX)
	,@pivColquery AS VARCHAR(MAX)
;

---Database---
SET @userinput0 = 'DBNAME'
---Schema---
SET @userinput1 = 'ODS'
---Table---
SET @userinput2 = 'Person'
---Date Grouping---
---1 By Year, 2 By Month, 3 By Week
SET @userinput3 = '3'
;

IF(@userinput3 = 1)
	SET @acselect1 = 'CAST(YEAR([P].[RowInsertDate]) AS integer) AS [YEAR]'
ELSE IF (@userinput3 = 2)
	SET @acselect1 = 
		'CAST(YEAR([P].[RowInsertDate]) AS integer) AS [Year]
		,CAST(MONTH([P].[RowInsertDate]) AS integer) AS [Month]'
ELSE IF (@userinput3 = 3)
	SET @acselect1 =
		'CAST(YEAR([P].[RowInsertDate]) AS integer) AS [Year]
		,CAST(DATEPART(ww,[P].[RowInsertDate]) AS integer) AS [Week]'
;

IF(@userinput3 = 1)
	SET @acgroup1 = 'YEAR([P].[RowInsertDate])'
ELSE IF (@userinput3 = 2)
	SET @acgroup1 =
		'YEAR([P].[RowInsertDate])
		,MONTH([P].[RowInsertDate])'
ELSE IF (@userinput3 = 3)
	SET @acgroup1 =
		'YEAR([P].[RowInsertDate])
		,DATEPART(ww,[P].[RowInsertDate])'
;

IF(@userinput3 = 1)
	SET @acjoin1 = ''
ELSE IF (@userinput3 = 2)
	SET @acjoin1 = ' AND [2.1].[Month] = MONTH([P].[RowInsertDate])'
ELSE IF (@userinput3 = 3)
	SET @acjoin1 = ' AND [2.1].[Week] = DATEPART(ww,[P].[RowInsertDate])' 
;

IF (@userinput3 = 1)
	SET @pivRowFieldName = quotename('YEAR') + ' Integer'
ELSE IF (@userinput3 = 2)
	SET @pivRowFieldName = quotename('YEAR') + ' Integer,' + quotename('Month') + ' Integer'
ELSE IF (@userinput3 = 3)
	SET @pivRowFieldName = quotename('YEAR') + ' Integer,' + quotename('Week') + ' Integer'
;
IF (@userinput3 = 1)
	SET @pivRowFieldName2 = quotename('YEAR')
ELSE IF (@userinput3 = 2)
	SET @pivRowFieldName2 = quotename('Year') + ',' + quotename('Month')
ELSE IF (@userinput3 = 3)
	SET @pivRowFieldName2 = quotename('Year') + ',' + quotename('Week')
;
IF (@userinput3 = 1)
	SET @pivRowFieldName3 = 'YEAR(L.RowInsertDate) AS ' + quotename('YEAR')
ELSE IF (@userinput3 = 2)
	SET @pivRowFieldName3 = 'YEAR(L.RowInsertDate) AS ' + quotename('Year') + ',MONTH(L.RowInsertDate) AS ' + quotename('Month')
ELSE IF (@userinput3 = 3)
	SET @pivRowFieldName3 = 'YEAR(L.RowInsertDate) AS ' + quotename('Year') + ',DATEPART(ww,L.RowInsertDate) AS ' + quotename('Week')
;
IF (@userinput3 = 1)
	SET @pivRowFieldName4 = quotename('YEAR')
ELSE IF (@userinput3 = 2)
	SET @pivRowFieldName4 = quotename('Year') + ',L.' + quotename('Month')
ELSE IF (@userinput3 = 3)
	SET @pivRowFieldName4 = quotename('Year') + ',L.' + quotename('Week')
;
IF (@userinput3 = 1)
	SET @pivRowFieldName5 = 'YEAR(L.RowInsertDate)'
ELSE IF (@userinput3 = 2)
	SET @pivRowFieldName5 = 'YEAR(L.RowInsertDate), MONTH(L.RowInsertDate)'
ELSE IF (@userinput3 = 3)
	SET @pivRowFieldName5 = 'YEAR(L.RowInsertDate), DATEPART(ww,L.RowInsertDate)'
;

SET @syssql = N'SELECT 
	ROW_NUMBER() OVER (ORDER BY Column_id ASC) AS ''Row''
	,Schema_Name(obj.Schema_ID) AS ''Schema''
	,Object_Name(obj.Object_id) ''Object''
	,col.NAME ''ColumnName''
	,col.Column_id
	,typ.NAME ''DataType''
	,col.Max_length ''length Of Datatype''
	,CASE 
		WHEN col.is_nullable = 0
			THEN ''NOT NULL''
		ELSE ''NULL''
	END ''constraint''
FROM sys.all_columns col
INNER JOIN sys.all_objects obj ON col.Object_id = obj.object_id
INNER JOIN sys.types typ ON col.system_type_id = typ.system_type_id
WHERE Schema_Name(obj.Schema_ID) = ' + quotename(@USERINPUT1,'''') + '
	AND Object_Name(obj.Object_id) = ' + quotename(@USERINPUT2,'''') + '
	AND typ.NAME !=''sysname''
ORDER BY obj.Object_id,col.Column_id'

CREATE TABLE 
	#syssql( 
		[Row] varchar(MAX)
		,[Schema] varchar(MAX)
		,[Object] varchar(MAX)
		,[ColumnName] varchar(MAX)
		,[Column_id] varchar(MAX)
		,[DataType] varchar(MAX)
		,[length Of Datatype] varchar(MAX)
		,[constraint] varchar(MAX)
	)

INSERT INTO 
	#syssql 
		EXEC
			sp_executesql @syssql, 
			N'@userinput1 varchar(MAX), @userinput2 varchar(MAX)', 
			@USERINPUT1 = @USERINPUT1
			,@USERINPUT2 = @USERINPUT2

SET @getnumcols = (SELECT COUNT([Row]) FROM #syssql)

SET @accol1 = (SELECT ColumnName FROM #syssql WHERE [Row] = '1')
SET @accol2 = (SELECT ColumnName FROM #syssql WHERE [Row] = '2')
SET @accol3= (SELECT ColumnName FROM #syssql WHERE [Row] ='3')
SET @accol4= (SELECT ColumnName FROM #syssql WHERE [Row] ='4')
SET @accol5= (SELECT ColumnName FROM #syssql WHERE [Row] ='5')
SET @accol6= (SELECT ColumnName FROM #syssql WHERE [Row] ='6')
SET @accol7= (SELECT ColumnName FROM #syssql WHERE [Row] ='7')
SET @accol8= (SELECT ColumnName FROM #syssql WHERE [Row] ='8')
SET @accol9= (SELECT ColumnName FROM #syssql WHERE [Row] ='9')
SET @accol10= (SELECT ColumnName FROM #syssql WHERE [Row] ='10')
SET @accol11= (SELECT ColumnName FROM #syssql WHERE [Row] ='11')
SET @accol12= (SELECT ColumnName FROM #syssql WHERE [Row] ='12')
SET @accol13= (SELECT ColumnName FROM #syssql WHERE [Row] ='13')
SET @accol14= (SELECT ColumnName FROM #syssql WHERE [Row] ='14')
SET @accol15= (SELECT ColumnName FROM #syssql WHERE [Row] ='15')
SET @accol16= (SELECT ColumnName FROM #syssql WHERE [Row] ='16')
SET @accol17= (SELECT ColumnName FROM #syssql WHERE [Row] ='17')
SET @accol18= (SELECT ColumnName FROM #syssql WHERE [Row] ='18')
SET @accol19= (SELECT ColumnName FROM #syssql WHERE [Row] ='19')
SET @accol20= (SELECT ColumnName FROM #syssql WHERE [Row] ='20')
SET @accol21= (SELECT ColumnName FROM #syssql WHERE [Row] ='21')
SET @accol22= (SELECT ColumnName FROM #syssql WHERE [Row] ='22')
SET @accol23= (SELECT ColumnName FROM #syssql WHERE [Row] ='23')
SET @accol24= (SELECT ColumnName FROM #syssql WHERE [Row] ='24')
SET @accol25= (SELECT ColumnName FROM #syssql WHERE [Row] ='25')
SET @accol26= (SELECT ColumnName FROM #syssql WHERE [Row] ='26')
SET @accol27= (SELECT ColumnName FROM #syssql WHERE [Row] ='27')
SET @accol28= (SELECT ColumnName FROM #syssql WHERE [Row] ='28')
SET @accol29= (SELECT ColumnName FROM #syssql WHERE [Row] ='29')
SET @accol30= (SELECT ColumnName FROM #syssql WHERE [Row] ='30')
SET @accol31= (SELECT ColumnName FROM #syssql WHERE [Row] ='31')
SET @accol32= (SELECT ColumnName FROM #syssql WHERE [Row] ='32')
SET @accol33= (SELECT ColumnName FROM #syssql WHERE [Row] ='33')
SET @accol34= (SELECT ColumnName FROM #syssql WHERE [Row] ='34')
SET @accol35= (SELECT ColumnName FROM #syssql WHERE [Row] ='35')
SET @accol36= (SELECT ColumnName FROM #syssql WHERE [Row] ='36')
SET @accol37= (SELECT ColumnName FROM #syssql WHERE [Row] ='37')
SET @accol38= (SELECT ColumnName FROM #syssql WHERE [Row] ='38')
SET @accol39= (SELECT ColumnName FROM #syssql WHERE [Row] ='39')
SET @accol40= (SELECT ColumnName FROM #syssql WHERE [Row] ='40')
SET @accol41= (SELECT ColumnName FROM #syssql WHERE [Row] ='41')
SET @accol42= (SELECT ColumnName FROM #syssql WHERE [Row] ='42')
SET @accol43= (SELECT ColumnName FROM #syssql WHERE [Row] ='43')
SET @accol44= (SELECT ColumnName FROM #syssql WHERE [Row] ='44')
SET @accol45= (SELECT ColumnName FROM #syssql WHERE [Row] ='45')
SET @accol46= (SELECT ColumnName FROM #syssql WHERE [Row] ='46')
SET @accol47= (SELECT ColumnName FROM #syssql WHERE [Row] ='47')
SET @accol48= (SELECT ColumnName FROM #syssql WHERE [Row] ='48')
SET @accol49= (SELECT ColumnName FROM #syssql WHERE [Row] ='49')
SET @accol50= (SELECT ColumnName FROM #syssql WHERE [Row] ='50')

;
IF @getnumcols >= 1
	SET @ioccol1 = 'AVG(CASE 	
					WHEN [P].' + quotename(@accol1) + N'IS NULL THEN 0.0000 ELSE 1.0000 
				END)'
ELSE 
	SET @ioccol1 = ''
;
IF @getnumcols >= 2	
	SET @ioccol2 =  '+AVG(CASE
		WHEN [P].' + quotename(@accol2) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'
ELSE	
	SET @ioccol2 = ''
;
IF @getnumcols >= 3		
	SET @ioccol3 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol3) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol3 = ''	
;		
IF @getnumcols >= 4		
	SET @ioccol4 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol4) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol4 = ''	
;		
IF @getnumcols >= 5		
	SET @ioccol5 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol5) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol5 = ''	
;		
IF @getnumcols >= 6		
	SET @ioccol6 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol6) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol6 = ''	
;		
IF @getnumcols >= 7		
	SET @ioccol7 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol7) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol7 = ''	
;		
IF @getnumcols >= 8		
	SET @ioccol8 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol8) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol8 = ''	
;		
IF @getnumcols >= 9		
	SET @ioccol9 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol9) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol9 = ''	
;		
IF @getnumcols >= 10		
	SET @ioccol10 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol10) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol10 = ''	
;		
IF @getnumcols >= 11		
	SET @ioccol11 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol11) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol11 = ''	
;		
IF @getnumcols >= 12		
	SET @ioccol12 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol12) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol12 = ''	
;
IF @getnumcols >= 13		
	SET @ioccol13 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol13) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol13 = ''	
;
IF @getnumcols >= 14		
	SET @ioccol14 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol14) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol14 = ''	
;
IF @getnumcols >= 15		
	SET @ioccol15 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol15) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol15 = ''	
;
IF @getnumcols >= 16		
	SET @ioccol16 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol16) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol16 = ''	
;
IF @getnumcols >= 17		
	SET @ioccol17 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol17) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol17 = ''	
;
IF @getnumcols >= 18		
	SET @ioccol18 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol18) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol18 = ''	
;
IF @getnumcols >= 19		
	SET @ioccol19 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol19) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol19 = ''	
;
IF @getnumcols >= 20		
	SET @ioccol20 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol20) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol20 = ''	
;
IF @getnumcols >= 21		
	SET @ioccol21 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol21) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol21 = ''	
;
IF @getnumcols >= 22		
	SET @ioccol22 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol22) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol22 = ''	
;
IF @getnumcols >= 23		
	SET @ioccol23 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol23) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol23 = ''	
;		
IF @getnumcols >= 24		
	SET @ioccol24 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol24) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol24 = ''	
;		
IF @getnumcols >= 25		
	SET @ioccol25 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol25) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol25 = ''	
;		
IF @getnumcols >= 26		
	SET @ioccol26 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol26) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol26 = ''	
;		
IF @getnumcols >= 27		
	SET @ioccol27 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol27) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol27 = ''	
;		
IF @getnumcols >= 28		
	SET @ioccol28 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol28) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol28 = ''	
;		
IF @getnumcols >= 29		
	SET @ioccol29 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol29) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol29 = ''	
;		
IF @getnumcols >= 30		
	SET @ioccol30 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol30) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol30 = ''	
;		
IF @getnumcols >= 31		
	SET @ioccol31 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol31) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol31 = ''	
;		
IF @getnumcols >= 32		
	SET @ioccol32 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol32) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol32 = ''	
;		
IF @getnumcols >= 33		
	SET @ioccol33 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol33) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol33 = ''	
;		
IF @getnumcols >= 34		
	SET @ioccol34 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol34) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol34 = ''	
;		
IF @getnumcols >= 35		
	SET @ioccol35 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol35) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol35 = ''	
;		
IF @getnumcols >= 36		
	SET @ioccol36 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol36) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol36 = ''	
;		
IF @getnumcols >= 37		
	SET @ioccol37 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol37) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol37 = ''	
;		
IF @getnumcols >= 38		
	SET @ioccol38 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol38) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol38 = ''	
;		
IF @getnumcols >= 39		
	SET @ioccol39 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol39) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol39 = ''	
;		
IF @getnumcols >= 40		
	SET @ioccol40 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol40) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol40 = ''	
;		
IF @getnumcols >= 41		
	SET @ioccol41 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol41) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol41 = ''	
;		
IF @getnumcols >= 42		
	SET @ioccol42 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol42) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol42 = ''	
;		
IF @getnumcols >= 43		
	SET @ioccol43 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol43) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol43 = ''	
;		
IF @getnumcols >= 44		
	SET @ioccol44 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol44) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol44 = ''	
;		
IF @getnumcols >= 45		
	SET @ioccol45 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol45) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol45 = ''	
;		
IF @getnumcols >= 46		
	SET @ioccol46 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol46) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol46 = ''	
;		
IF @getnumcols >= 47		
	SET @ioccol47 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol47) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol47 = ''	
;		
IF @getnumcols >= 48		
	SET @ioccol48 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol48) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol48 = ''	
;		
IF @getnumcols >= 49		
	SET @ioccol49 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol49) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol49 = ''	
;		
IF @getnumcols >= 50		
	SET @ioccol50 =  '+AVG(CASE	
		WHEN [P].' + quotename(@accol50) + N'IS NULL THEN 0.0000 ELSE 1.0000
	END)'	
ELSE		
	SET @ioccol50 = ''	
;		

SET @acsql = N'SELECT ' + @acselect1 
	+ N',[2.1].[DataCompleteness]' 
	
	+ N' FROM '
	+ @userinput0
	+ N'.'
	+ @userinput1
	+ N'.'
	+ @userinput2
	+ N' AS [P] 
	/* --- Data Completeness --- */
	LEFT JOIN 
		(
		SELECT
			((
				' + @ioccol1 
				+ @ioccol2
				+ @ioccol3
				+ @ioccol4
				+ @ioccol5
				+ @ioccol6
				+ @ioccol7
				+ @ioccol8
				+ @ioccol9
				+ @ioccol10
				+ @ioccol11
				+ @ioccol12
				+ @ioccol13
				+ @ioccol14
				+ @ioccol15
				+ @ioccol16
				+ @ioccol17
				+ @ioccol18
				+ @ioccol19
				+ @ioccol20				
				+ @ioccol21
				+ @ioccol22
				+ @ioccol23
				+ @ioccol24
				+ @ioccol25
				+ @ioccol26
				+ @ioccol27
				+ @ioccol28
				+ @ioccol29
				+ @ioccol30
				+ @ioccol31
				+ @ioccol32
				+ @ioccol33
				+ @ioccol34
				+ @ioccol35
				+ @ioccol36
				+ @ioccol37
				+ @ioccol38
				+ @ioccol39
				+ @ioccol40
				+ @ioccol41
				+ @ioccol42
				+ @ioccol43
				+ @ioccol44
				+ @ioccol45
				+ @ioccol46
				+ @ioccol47
				+ @ioccol48
				+ @ioccol49
				+ @ioccol50
				+ N'

		)
		/' + @getnumcols + N') AS [DataCompleteness]
		,' + @acselect1 + N'

		FROM
			 ' + @userinput0 + N'.' +@userinput1 + N'.' +@userinput2 + N' AS P
		
		GROUP BY
			 ' + @acgroup1 + N'
	)	AS [2.1]
	ON [2.1].[Year] = YEAR([P].[RowInsertDate]) ' + @acjoin1 + N'
	WHERE
		YEAR([P].[RowInsertDate]) IS NOT NULL
	GROUP BY
	 ' + @acgroup1 + N'
	,[2.1].[DataCompleteness]
	
ORDER BY
	 ' + @acgroup1 + N'
;'


EXEC 
sp_executesql @acsql,
	N'@userinput1 varchar(MAX)
	,@userinput2 varchar(MAX)
	,@accol1 nvarchar(MAX)
	,@accol2 nvarchar(MAX)
	,@accol3 nvarchar(MAX)
	,@accol4 nvarchar(MAX)
	,@accol5 nvarchar(MAX)
	,@accol6 nvarchar(MAX)
	,@accol7 nvarchar(MAX)
	,@accol8 nvarchar(MAX)
	,@accol9 nvarchar(MAX)
	,@accol10 nvarchar(MAX)
	,@accol11 nvarchar(MAX)
	,@accol12 nvarchar(MAX)
	,@accol13 nvarchar(MAX)
	,@accol14 nvarchar(MAX)
	,@accol15 nvarchar(MAX)
	,@accol16 nvarchar(MAX)
	,@accol17 nvarchar(MAX)
	,@accol18 nvarchar(MAX)
	,@accol19 nvarchar(MAX)
	,@accol20 nvarchar(MAX)
	,@accol21 nvarchar(MAX)
	,@accol22 nvarchar(MAX)
	,@accol23 nvarchar(MAX)
	,@accol24 nvarchar(MAX)
	,@accol25 nvarchar(MAX)
	,@accol26 nvarchar(MAX)
	,@accol27 nvarchar(MAX)
	,@accol28 nvarchar(MAX)
	,@accol29 nvarchar(MAX)
	,@accol30 nvarchar(MAX)
	,@accol31 nvarchar(MAX)
	,@accol32 nvarchar(MAX)
	,@accol33 nvarchar(MAX)
	,@accol34 nvarchar(MAX)
	,@accol35 nvarchar(MAX)
	,@accol36 nvarchar(MAX)
	,@accol37 nvarchar(MAX)
	,@accol38 nvarchar(MAX)
	,@accol39 nvarchar(MAX)
	,@accol40 nvarchar(MAX)
	,@accol41 nvarchar(MAX)
	,@accol42 nvarchar(MAX)
	,@accol43 nvarchar(MAX)
	,@accol44 nvarchar(MAX)
	,@accol45 nvarchar(MAX)
	,@accol46 nvarchar(MAX)
	,@accol47 nvarchar(MAX)
	,@accol48 nvarchar(MAX)
	,@accol49 nvarchar(MAX)
	,@accol50 nvarchar(MAX)
	,@acselect1 nvarchar(MAX)
	,@acgroup1 nvarchar(MAX)
	,@acjoin1 nvarchar(MAX)
	,@getnumcols nvarchar(MAX)
	,@ioccol1 nvarchar(MAX)
	,@ioccol2 nvarchar(MAX)
	,@ioccol3 nvarchar(MAX)
	,@ioccol4 nvarchar(MAX)
	,@ioccol5 nvarchar(MAX)
	,@ioccol6 nvarchar(MAX)
	,@ioccol7 nvarchar(MAX)
	,@ioccol8 nvarchar(MAX)
	,@ioccol9 nvarchar(MAX)
	,@ioccol10 nvarchar(MAX)
	,@ioccol11 nvarchar(MAX)
	,@ioccol12 nvarchar(MAX)
	,@ioccol13 nvarchar(MAX)
	,@ioccol14 nvarchar(MAX)
	,@ioccol15 nvarchar(MAX)
	,@ioccol16 nvarchar(MAX)
	,@ioccol17 nvarchar(MAX)
	,@ioccol18 nvarchar(MAX)
	,@ioccol19 nvarchar(MAX)
	,@ioccol20 nvarchar(MAX)
	,@ioccol21 nvarchar(MAX)
	,@ioccol22 nvarchar(MAX)
	,@ioccol23 nvarchar(MAX)
	,@ioccol24 nvarchar(MAX)
	,@ioccol25 nvarchar(MAX)
	,@ioccol26 nvarchar(MAX)
	,@ioccol27 nvarchar(MAX)
	,@ioccol28 nvarchar(MAX)
	,@ioccol29 nvarchar(MAX)
	,@ioccol30 nvarchar(MAX)
	,@ioccol31 nvarchar(MAX)
	,@ioccol32 nvarchar(MAX)
	,@ioccol33 nvarchar(MAX)
	,@ioccol34 nvarchar(MAX)
	,@ioccol35 nvarchar(MAX)
	,@ioccol36 nvarchar(MAX)
	,@ioccol37 nvarchar(MAX)
	,@ioccol38 nvarchar(MAX)
	,@ioccol39 nvarchar(MAX)
	,@ioccol40 nvarchar(MAX)
	,@ioccol41 nvarchar(MAX)
	,@ioccol42 nvarchar(MAX)
	,@ioccol43 nvarchar(MAX)
	,@ioccol44 nvarchar(MAX)
	,@ioccol45 nvarchar(MAX)
	,@ioccol46 nvarchar(MAX)
	,@ioccol47 nvarchar(MAX)
	,@ioccol48 nvarchar(MAX)
	,@ioccol49 nvarchar(MAX)
	,@ioccol50 nvarchar(MAX)'
	,@userinput1 = @userinput1
	,@userinput2 = @userinput2
	,@accol1 = @accol1
	,@accol2 = @accol2
	,@accol3 = @accol3
	,@accol4 = @accol4
	,@accol5 = @accol5
	,@accol6 = @accol6
	,@accol7 = @accol7
	,@accol8 = @accol8
	,@accol9 = @accol9
	,@accol10 = @accol10
	,@accol11 = @accol11
	,@accol12 = @accol12
	,@accol13 = @accol13
	,@accol14 = @accol14
	,@accol15 = @accol15
	,@accol16 = @accol16
	,@accol17 = @accol17
	,@accol18 = @accol18
	,@accol19 = @accol19
	,@accol20 = @accol20
	,@accol21 = @accol21
	,@accol22 = @accol22
	,@accol23 = @accol23
	,@accol24 = @accol24
	,@accol25 = @accol25
	,@accol26 = @accol26
	,@accol27 = @accol27
	,@accol28 = @accol28
	,@accol29 = @accol29
	,@accol30 = @accol30
	,@accol31 = @accol31
	,@accol32 = @accol32
	,@accol33 = @accol33
	,@accol34 = @accol34
	,@accol35 = @accol35
	,@accol36 = @accol36
	,@accol37 = @accol37
	,@accol38 = @accol38
	,@accol39 = @accol39
	,@accol40 = @accol40
	,@accol41 = @accol41
	,@accol42 = @accol42
	,@accol43 = @accol43
	,@accol44 = @accol44
	,@accol45 = @accol45
	,@accol46 = @accol46
	,@accol47 = @accol47
	,@accol48 = @accol48
	,@accol49 = @accol49
	,@accol50 = @accol50
	,@acselect1 = @acselect1
	,@acgroup1 = @acgroup1 
	,@acjoin1 = @acjoin1
	,@getnumcols = @getnumcols
	,@ioccol1 = @ioccol1
	,@ioccol2 = @ioccol2
	,@ioccol3 = @ioccol3
	,@ioccol4 = @ioccol4
	,@ioccol5 = @ioccol5
	,@ioccol6 = @ioccol6
	,@ioccol7 = @ioccol7
	,@ioccol8 = @ioccol8
	,@ioccol9 = @ioccol9
	,@ioccol10 = @ioccol10
	,@ioccol11 = @ioccol11
	,@ioccol12 = @ioccol12
	,@ioccol13 = @ioccol13
	,@ioccol14 = @ioccol14
	,@ioccol15 = @ioccol15
	,@ioccol16 = @ioccol16
	,@ioccol17 = @ioccol17
	,@ioccol18 = @ioccol18
	,@ioccol19 = @ioccol19
	,@ioccol20 = @ioccol20
	,@ioccol21 = @ioccol21
	,@ioccol22 = @ioccol22
	,@ioccol23 = @ioccol23
	,@ioccol24 = @ioccol24
	,@ioccol25 = @ioccol25
	,@ioccol26 = @ioccol26
	,@ioccol27 = @ioccol27
	,@ioccol28 = @ioccol28
	,@ioccol29 = @ioccol29
	,@ioccol30 = @ioccol30
	,@ioccol31 = @ioccol31
	,@ioccol32 = @ioccol32
	,@ioccol33 = @ioccol33
	,@ioccol34 = @ioccol34
	,@ioccol35 = @ioccol35
	,@ioccol36 = @ioccol36
	,@ioccol37 = @ioccol37
	,@ioccol38 = @ioccol38
	,@ioccol39 = @ioccol39
	,@ioccol40 = @ioccol40
	,@ioccol41 = @ioccol41
	,@ioccol42 = @ioccol42
	,@ioccol43 = @ioccol43
	,@ioccol44 = @ioccol44
	,@ioccol45 = @ioccol45
	,@ioccol46 = @ioccol46
	,@ioccol47 = @ioccol47
	,@ioccol48 = @ioccol48
	,@ioccol49 = @ioccol49
	,@ioccol50 = @ioccol50
;

DROP TABLE #syssql
