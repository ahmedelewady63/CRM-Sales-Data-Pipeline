


SELECT
    ROW_NUMBER() OVER (ORDER BY sales_agent) AS sales_agent_key,
    sales_agent AS sales_agent_name,
    manager AS manager_name,
    regional_office

FROM "crm_sales"."main_stg"."stg_sales_teams"