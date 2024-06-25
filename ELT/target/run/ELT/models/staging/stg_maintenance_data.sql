USE [dbt];
    
    

    EXEC('create view "Microsoft_staging"."stg_maintenance_data" as -- Combine with maintenance data
with MaintenanceData AS (
    SELECT
        m.DATETIME,
        m.MACHINEID,
        m.COMP
    FROM
        dbt.Microsoft.PDM_MAINT m
)

select * from MaintenanceData;');


