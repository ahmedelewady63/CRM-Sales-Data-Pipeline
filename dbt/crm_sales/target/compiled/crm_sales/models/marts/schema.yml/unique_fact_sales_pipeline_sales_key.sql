
    
    

select
    sales_key as unique_field,
    count(*) as n_records

from "crm_sales"."main_dwh"."fact_sales_pipeline"
where sales_key is not null
group by sales_key
having count(*) > 1


