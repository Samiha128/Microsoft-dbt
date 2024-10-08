-- Combine telemetry data with machine features
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

select * from TelemetryFeatures