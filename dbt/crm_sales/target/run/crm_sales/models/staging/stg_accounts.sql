
  
  create view "crm_sales"."main_stg"."stg_accounts__dbt_tmp" as (
    

with source as (

    select *
    from "crm_sales"."ods"."accounts"

)

SELECT
    TRIM(account) AS account,
    TRIM(sector) AS sector,
    year_established,
    revenue,
    employees,
    TRIM(office_location) AS office_location,
    TRIM(subsidiary_of) AS subsidiary_of

FROM source
  );
