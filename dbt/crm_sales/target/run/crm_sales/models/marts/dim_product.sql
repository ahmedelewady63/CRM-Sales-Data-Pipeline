
    

    create  table
      "crm_sales"."main_dwh"."dim_product__dbt_tmp"
  
    
    as (
      


SELECT
    ROW_NUMBER() OVER (ORDER BY product) AS product_key,
    product AS product_name,
    series,
    sales_price

FROM "crm_sales"."main_stg"."stg_products"
    );
    
  