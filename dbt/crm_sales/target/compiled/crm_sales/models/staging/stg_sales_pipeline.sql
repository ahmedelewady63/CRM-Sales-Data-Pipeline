

with source as (

    select *
    from "crm_sales"."ods"."sales_pipeline"

)

SELECT
    TRIM(opportunity_id) AS opportunity_id,
    TRIM(sales_agent) AS sales_agent,
    TRIM(product) AS product,
    TRIM(account) AS account,
    TRIM(deal_stage) AS deal_stage,
    CAST(engage_date AS DATE) AS engage_date,
    CAST(close_date AS DATE) AS close_date,
    CAST(close_value AS DECIMAL(15,2)) AS close_value

FROM source