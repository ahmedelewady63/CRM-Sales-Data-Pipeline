
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sales_key
from "crm_sales"."main_dwh"."fact_sales_pipeline"
where sales_key is null



  
  
      
    ) dbt_internal_test