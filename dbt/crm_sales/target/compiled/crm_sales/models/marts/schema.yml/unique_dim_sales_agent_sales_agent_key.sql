
    
    

select
    sales_agent_key as unique_field,
    count(*) as n_records

from "crm_sales"."main_dwh"."dim_sales_agent"
where sales_agent_key is not null
group by sales_agent_key
having count(*) > 1


