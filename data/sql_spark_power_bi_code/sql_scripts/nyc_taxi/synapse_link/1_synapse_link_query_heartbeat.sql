IF (NOT EXISTS(SELECT * FROM sys.credentials WHERE name = 'synapse-course-cosmos-db-23'))
    CREATE CREDENTIAL [synapse-course-cosmos-db-23]
    WITH IDENTITY = 'SHARED ACCESS SIGNATURE', SECRET = '***'
GO

SELECT TOP 100 *
FROM OPENROWSET(​PROVIDER = 'CosmosDB',
                CONNECTION = 'Account=synapse-course-cosmos-db-23;Database=nyctaxidb',
                OBJECT = 'Heartbeat',
                SERVER_CREDENTIAL = 'synapse-course-cosmos-db-23'
) AS [Heartbeat]
