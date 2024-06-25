-- Combine with failure data
with FailureData AS (
    SELECT
        f.DATETIME,
        f.MACHINEID,
        f.FAILURE
    FROM
        dbt.Microsoft.PDM_FAILURES f
)

select * from FailureData