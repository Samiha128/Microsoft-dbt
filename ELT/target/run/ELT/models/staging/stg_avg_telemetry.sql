USE [dbt];
    
    

    EXEC('create view "Microsoft_staging"."stg_avg_telemetry" as -- Calculate average telemetry values per machine
WITH TelemetryFeatures AS (
    SELECT
        t.DATETIME,
        t.MACHINEID,
        t.VOLT,
        t.ROTATE,
        t.PRESSURE,
        t.VIBRATION,
        m.MODEL,
        m.AGE
    FROM
        dbt.Microsoft.PDM_TELEMETRY t
    JOIN dbt.Microsoft.PDM_MACHINES m ON t.MACHINEID = m.MACHINEID
)

, AvgTelemetry AS (
    SELECT
        MACHINEID,
        AVG(VOLT) AS AVG_VOLT,
        AVG(ROTATE) AS AVG_ROTATE,
        AVG(PRESSURE) AS AVG_PRESSURE,
        AVG(VIBRATION) AS AVG_VIBRATION
    FROM
        TelemetryFeatures
    GROUP BY
        MACHINEID
)

select * from AvgTelemetry;');


