
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sales_agent_key
from "crm_sales"."main_dwh"."dim_sales_agent"
where sales_agent_key is null



  
  
      
    ) dbt_internal_test