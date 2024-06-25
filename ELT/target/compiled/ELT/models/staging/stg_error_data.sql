-- Combine with error data
with ErrorData AS (
    SELECT
        e.DATETIME,
        e.MACHINEID,
        e.ERRORID
    FROM
        dbt.Microsoft.PDM_ERRORS e
)

SELECT * from ErrorData