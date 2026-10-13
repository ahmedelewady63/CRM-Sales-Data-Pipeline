{{ config(materialized = "view") }}

with source as (

    select *
    from {{ source('ods', 'products') }}

)


SELECT
    TRIM(product) AS product,
    TRIM(series) AS series,
    sales_price

FROM source