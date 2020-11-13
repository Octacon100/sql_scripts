DECLARE @iExceptionTypeID int

DECLARE @dtLastRunDate datetime
DECLARE @dtNextRunDate datetime
DECLARE @vchLoadProcedureName varchar(255)
DECLARE @dtEndDate datetime
DECLARE @dtSMNextRunDate smalldatetime

SELECT @dtEndDate = getdate()

--used in dynamic SQL execution
DECLARE @SQLString nvarchar(1000)

-- used to trim off the time on next run date
DECLARE @vchNextRunDate varchar(30)

-- the process id is a foreign key into the cfn common users table
-- mark mcd and I talked about this table and the need to create a user in it that 
-- is a process, rather than using the overloaded fields from the previous deisgn which 
-- at times contained FKs to this common table and at other times contained the text 'AUTO' 
DECLARE @iProcessID int
SELECT @iProcessID = 1

-- declare a cursor to retrieve the various sprocs to execute
-- during the import process
DECLARE ELcursor CURSOR FOR 
SELECT iExceptionTypeID, dtLastRunDate, dtNextRunDate , vchLoadProcedureName
FROM EXCEPTION_LOAD
WHERE bActive = 1 AND bRunOffHour=0--AND (iExceptionTypeID NOT BETWEEN 31 AND 45 ) -- Excuding reports in QA(Ajay)
ORDER BY iExceptionTypeID

OPEN ELcursor

FETCH NEXT FROM ELcursor
INTO  @iExceptionTypeID, @dtLastRunDate, @dtNextRunDate , @vchLoadProcedureName

WHILE @@FETCH_STATUS = 0
    BEGIN

	-- next run date is used to determine if it is time to execute the process
	-- to load the particular type of exception

	SELECT @vchNextRunDate = convert(varchar(40), @dtNextRunDate, 101)
	SELECT @dtSMNextRunDate = @vchNextRunDate

	IF getdate() >= @dtSMNextRunDate
	    BEGIN
		-- concatenate the SQL Statement for the procedure execution
		-- last run date is passed in as the starting point for selecting the population
		-- of data to process
		/* KT 4/2/09.
			removed set ansi_warnings off statement that I had added recently.  This was added for one sproc, the
			breakpoint sproc.  I found that you can specifyu that setting within sproc and error is avoided.  I removed
			from here because other sprocs with cross server query to BOSS were generating errors becasue set ansi_warnings 
			was off.
		*/
		--SELECT @SQLString = 'set ansi_warnings off ' + char(13) + 'EXEC ' + @vchLoadProcedureName + ' ' + CONVERT(varchar(10), @iProcessID) + ' , '
		
		SELECT @SQLString = 'EXEC ' + @vchLoadProcedureName + ' ' + CONVERT(varchar(10), @iProcessID) + ' , '
		SELECT @SQLString = @SQLString + ' ''' + convert(varchar(40), @dtLastRunDate, 120) + ''' , '
		SELECT @SQLString = @SQLString + ' ''' + convert(varchar(40), @dtEndDate, 120)  + ''''
		PRINT @SQLString
		
	    END

   	FETCH NEXT FROM ELcursor
	INTO  @iExceptionTypeID, @dtLastRunDate, @dtNextRunDate , @vchLoadProcedureName
    END

CLOSE ELcursor
DEALLOCATE ELcursor

