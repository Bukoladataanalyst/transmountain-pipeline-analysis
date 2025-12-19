-- Trans Mountain Pipeline Product Distribution: Domestic vs Export (2007–2014)

SELECT
    Year,
    Product,
    [Trade type],
    SUM([Throughput (1000 m3 d)]) AS total_volume,
    SUM(
        CASE 
            WHEN [Trade type] = 'export' 
            THEN [Throughput (1000 m3 d)] 
            ELSE 0 
        END
    ) AS export_volume,
    SUM(
        CASE 
            WHEN [Trade type] = 'intracanada' 
            THEN [Throughput (1000 m3 d)] 
            ELSE 0 
        END
    ) AS domestic_volume
FROM [AdventureWorksFix].[dbo].[trans-mountain-throughput-and-capacity-dataset]
WHERE Year BETWEEN 2007 AND 2014
GROUP BY
    Year,
    Product,
    [Trade type];
