SELECT TOP 1 * FROM [AdventureWorks2019].[Production].[Product]

DBCC FREEPROCCACHE

SELECT cplan.usecounts, cplan.objtype, qtext.text, qplan.query_plan
FROM sys.dm_exec_cached_plans AS cplan
CROSS APPLY sys.dm_exec_sql_text(cplan.plan_handle) AS qtext
CROSS APPLY sys.dm_exec_query_plan(cplan.plan_handle) AS qplan
ORDER BY cplan.usecounts DESC

SELECT * FROM sys.dm_os_performance_counters
WHERE object_name LIKE '%Plan Cache%';