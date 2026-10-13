
    

    create  table
      "crm_sales"."main_dwh"."fact_sales_pipeline__dbt_tmp"
  
    
    as (
      

SELECT

    ROW_NUMBER() OVER (ORDER BY s.opportunity_id) AS sales_key,

    s.opportunity_id,

    a.account_key,

    p.product_key,

    sa.sales_agent_key,

    ds.deal_stage_key,

    d_engage.date_key AS engage_date_key,

    d_close.date_key AS close_date_key,

    s.close_value

FROM "crm_sales"."main_stg"."stg_sales_pipeline" s

LEFT JOIN "crm_sales"."main_dwh"."dim_account" a
    ON s.account = a.account_name

LEFT JOIN "crm_sales"."main_dwh"."dim_product" p
    ON s.product = p.product_name

LEFT JOIN "crm_sales"."main_dwh"."dim_sales_agent" sa
    ON s.sales_agent = sa.sales_agent_name

LEFT JOIN "crm_sales"."main_dwh"."dim_deal_stage" ds
    ON s.deal_stage = ds.deal_stage

LEFT JOIN "crm_sales"."main_dwh"."dim_date" d_engage
    ON s.engage_date = d_engage.full_date

LEFT JOIN "crm_sales"."main_dwh"."dim_date" d_close
    ON s.close_date = d_close.full_date
    );
    
  