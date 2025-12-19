-- Pipeline Utilization for Trans Mountain, Enbridge, and Keystone (2007–2014)

SELECT
    Year,
    [Pipeline Name],
    [% Utilization]
FROM (
    SELECT
        Year,
        [Pipeline Name],
        [% Utilization]
    FROM [AdventureWorksFix]. [dbo].[trans-mountain-throughput-and-capacity-dataset]

    UNION ALL

    SELECT
        Year,
        [Pipeline Name],
        [% Utilization]
    FROM [AdventureWorksFix]. [dbo].[enbridge-mainline-throughput-and-capacity-dataset]

    UNION ALL

    SELECT
        Year,
        [Pipeline Name],
        [% Utilization]
    FROM [AdventureWorksFix]. [dbo].[keystone-throughput-and-capacity-dataset]
) AS MAJOR_PIPELINES
WHERE Year BETWEEN 2007 AND 2014
ORDER BY [Pipeline Name];
