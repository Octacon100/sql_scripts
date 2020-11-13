
DROP TABLE IF EXISTS #sp_who2

CREATE TABLE #sp_who2 (SPID INT,Status VARCHAR(255),
      Login  VARCHAR(255),HostName  VARCHAR(255),
      BlkBy  VARCHAR(255),DBName  VARCHAR(255),
      Command VARCHAR(255),CPUTime INT,
      DiskIO INT,LastBatch VARCHAR(255),
      ProgramName VARCHAR(255),SPID2 INT,
      REQUESTID INT)
INSERT INTO #sp_who2 EXEC sp_who2


SELECT      w.SPID,
            w.Status,
            w.Login,
            w.HostName,
            w.BlkBy,
            parameters,
            event_info,
			w.DBName,
            w.Command,
            w.CPUTime,
            w.DiskIO,
            w.LastBatch,
            w.ProgramName,
            w.SPID2,
            w.REQUESTID,
            event_type
FROM        #sp_who2 w
OUTER APPLY sys.dm_exec_input_buffer(w.SPID, NULL) 
-- Add any filtering of the results here :
WHERE       1=1
--AND DBName = 'CFN_Security'
AND BlkBy <> '  .'
OR SPID IN
(
	SELECT BlkBy
	FROM #sp_who2
	WHERE BlkBy <> '  .'
)
-- Add any sorting of the results here :
ORDER BY    SPID ASC
 
DROP TABLE #sp_who2

--KILL 110