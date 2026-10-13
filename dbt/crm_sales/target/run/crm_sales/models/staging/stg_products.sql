
  
  create view "crm_sales"."main_stg"."stg_products__dbt_tmp" as (
    

with source as (

    select *
    from "crm_sales"."ods"."products"

)


SELECT
    TRIM(product) AS product,
    TRIM(series) AS series,
    sales_price

FROM source
  );
