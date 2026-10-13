


SELECT
    ROW_NUMBER() OVER (ORDER BY account) AS account_key,
    account AS account_name,
    sector,
    year_established,
    revenue,
    employees,
    office_location,
    subsidiary_of

FROM "crm_sales"."main_stg"."stg_accounts"