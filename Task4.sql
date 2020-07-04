SELECT * FROM DMZ
INSERT INTO DMZ (DDM, NDM, PR)
VALUES
(
	(SELECT CONVERT(VARCHAR, GETDATE(),112)),
	(SELECT TOP 1 NDM FROM DMZ ORDER BY NDM DESC) + 1, 
	(SELECT CASE
			WHEN COUNT(*) = 0 THEN 1
            WHEN COUNT(CASE WHEN PR=1 THEN 1 END) > COUNT(CASE WHEN PR=2 THEN 1 END)
               THEN 2
               ELSE 1
       END
	FROM DMZ)
)