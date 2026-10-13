{{ config(materialized='table') }}


SELECT
    ROW_NUMBER() OVER (ORDER BY deal_stage) AS deal_stage_key,
    deal_stage

FROM (
    SELECT DISTINCT
        deal_stage
    FROM {{ ref('stg_sales_pipeline') }}
)
