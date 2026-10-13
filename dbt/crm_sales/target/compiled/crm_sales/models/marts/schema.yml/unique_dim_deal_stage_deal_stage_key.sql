
    
    

select
    deal_stage_key as unique_field,
    count(*) as n_records

from "crm_sales"."main_dwh"."dim_deal_stage"
where deal_stage_key is not null
group by deal_stage_key
having count(*) > 1


