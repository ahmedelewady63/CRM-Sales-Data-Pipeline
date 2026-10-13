


SELECT
    ROW_NUMBER() OVER (ORDER BY product) AS product_key,
    product AS product_name,
    series,
    sales_price

FROM "crm_sales"."main_stg"."stg_products"