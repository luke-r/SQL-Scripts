/* Run Qry as  Whole to get the duplicates, part 2 to get unique values */
SELECT *

FROM
	(
	/* Insert the query of interest below, leave the Row_Number() field as is. */
	SELECT
		[Vol].[ID Field Name] 
		,[VOL].[Field Name]
		,Row_Number() OVER(ORDER BY UserID ASC) AS Row
	FROM [Table Name] AS VOL
	--where... Insert Parameters Here
	)
AS OriginalQry0

EXCEPT

/* Part 2: Run this by itself if you want the distinct records in view */
SELECT OriginalQry.*

FROM
	/* Insert Original Qry/Vw Here, add col for RowNumber */
	(
	SELECT 
		[Vol].[ID Field Name] 
		,[VOL].[Field Name]
		,Row_Number() OVER(ORDER BY UserID ASC) AS Row
	FROM [Table Name] AS VOL
	--where... Insert Parameters Here
	)
AS OriginalQry

INNER JOIN
	(
	SELECT
		MAX(OriginalQry2.Row) AS MaxRow
		
	FROM
		/* Insert The Unique ID from Original Query, and RowNumber Here */
		(
		SELECT 
			[Vol].[ID Field Name] 
			,Row_Number() OVER(ORDER BY UserID ASC) AS Row
		FROM [Table Name] AS VOL
		--where... Insert Parameters Here
		)
	AS OriginalQry2
	--Group by ID Field Name
	GROUP BY
	OriginalQry2.[ID Field Name]
	) AS MaxUniqueID
ON MaxUniqueID.MaxRow = OriginalQry.Row
