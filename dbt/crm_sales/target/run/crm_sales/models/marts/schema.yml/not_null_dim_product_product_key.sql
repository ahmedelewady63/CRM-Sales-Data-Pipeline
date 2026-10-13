
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select product_key
from "crm_sales"."main_dwh"."dim_product"
where product_key is null



  
  
      
    ) dbt_internal_test