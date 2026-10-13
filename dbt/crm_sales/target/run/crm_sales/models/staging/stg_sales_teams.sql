
  
  create view "crm_sales"."main_stg"."stg_sales_teams__dbt_tmp" as (
    

with source as (

    select *
    from "crm_sales"."ods"."sales_teams"

)

SELECT
    TRIM(sales_agent) AS sales_agent,
    TRIM(manager) AS manager,
    TRIM(regional_office) AS regional_office

FROM source
  );
