{{ config(materialized = "view") }}

with source as (

    select *
    from {{ source('ods', 'sales_teams') }}

)

SELECT
    TRIM(sales_agent) AS sales_agent,
    TRIM(manager) AS manager,
    TRIM(regional_office) AS regional_office

FROM source