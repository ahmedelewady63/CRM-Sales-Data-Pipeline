{{ config(materialized='table') }}


SELECT
    ROW_NUMBER() OVER (ORDER BY product) AS product_key,
    product AS product_name,
    series,
    sales_price

FROM {{ ref('stg_products') }}