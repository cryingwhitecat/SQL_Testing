SELECT  t.NTOV, SUM(z.KOL_SUM) AS COL_SUM, SUM(z.CENA_SUM) AS CENA_SUM FROM 
	(
		SELECT z.DDM, g.CENA_SUM,g.KOL_SUM,g.KTOV FROM 
		(
			SELECT KTOV, ZID, SUM(KOL) AS KOL_SUM, SUM(CENA) AS CENA_SUM FROM DMS
			GROUP BY KTOV, ZID
		) AS g
		JOIN DMZ z on z.NDM = g.ZID
		WHERE z.PR = 2
	) as z
JOIN TOV t on t.KTOV = z.KTOV
WHERE z.DDM='20140106'
GROUP BY z.DDM, t.NTOV
ORDER BY COL_SUM DESC