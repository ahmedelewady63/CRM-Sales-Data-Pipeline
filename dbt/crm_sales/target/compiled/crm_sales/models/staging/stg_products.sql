

with source as (

    select *
    from "crm_sales"."ods"."products"

)


SELECT
    TRIM(product) AS product,
    TRIM(series) AS series,
    sales_price

FROM source