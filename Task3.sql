SELECT t.NTOV, interm2.DIFF_KOL, interm2.DIFF_SUM FROM 
(
	SELECT (SUM(CASE WHEN interm.PR = 1 THEN interm.KOL ELSE 0 END) -
		SUM(CASE WHEN interm.PR = 2 THEN interm.KOL ELSE 0 END)) as DIFF_KOL,
		(SUM(CASE WHEN interm.PR = 1 THEN interm.CENA ELSE 0 END) -
			SUM(CASE WHEN interm.PR = 2 THEN interm.CENA ELSE 0 END)) as DIFF_SUM,
		interm.KTOV FROM 
	(
		SELECT t.KTOV, s.KOL, s.CENA, s.ZID, z.PR FROM DMS s
		JOIN DMZ z ON z.NDM = s.ZID
		JOIN TOV t ON s.KTOV = t.KTOV
	) AS interm
	GROUP BY interm.KTOV
) AS interm2
JOIN TOV t ON t.KTOV = interm2.KTOV
ORDER BY t.NTOV