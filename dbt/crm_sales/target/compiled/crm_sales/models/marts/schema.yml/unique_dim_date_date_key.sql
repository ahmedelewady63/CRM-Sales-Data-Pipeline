
    
    

select
    date_key as unique_field,
    count(*) as n_records

from "crm_sales"."main_dwh"."dim_date"
where date_key is not null
group by date_key
having count(*) > 1


