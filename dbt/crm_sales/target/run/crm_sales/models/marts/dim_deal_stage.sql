
    

    create  table
      "crm_sales"."main_dwh"."dim_deal_stage__dbt_tmp"
  
    
    as (
      


SELECT
    ROW_NUMBER() OVER (ORDER BY deal_stage) AS deal_stage_key,
    deal_stage

FROM (
    SELECT DISTINCT
        deal_stage
    FROM "crm_sales"."main_stg"."stg_sales_pipeline"
)
    );
    
  