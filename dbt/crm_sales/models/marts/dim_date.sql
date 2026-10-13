{{ config(materialized='table') }}


SELECT DISTINCT

    CAST(STRFTIME(engage_date, '%Y%m%d') AS INTEGER) AS date_key,

    engage_date AS full_date,

    EXTRACT(DAY FROM engage_date) AS day,

    EXTRACT(MONTH FROM engage_date) AS month,

    STRFTIME(engage_date, '%B') AS month_name,

    EXTRACT(QUARTER FROM engage_date) AS quarter,

    EXTRACT(YEAR FROM engage_date) AS year,

    DAYOFWEEK(engage_date) IN (0, 6) AS is_weekend

FROM {{ ref('stg_sales_pipeline') }}

WHERE engage_date IS NOT NULL