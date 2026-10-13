
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_stage_key
from "crm_sales"."main_dwh"."dim_deal_stage"
where deal_stage_key is null



  
  
      
    ) dbt_internal_test