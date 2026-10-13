CREATE TABLE dim_account (
    account_key INTEGER PRIMARY KEY,
    account_name VARCHAR(100),
    sector VARCHAR(100),
    year_established INTEGER,
    revenue DECIMAL(15,2),
    employees INTEGER,
    office_location VARCHAR(100),
    subsidiary_of VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key INTEGER PRIMARY KEY,
    product_name VARCHAR(100),
    series VARCHAR(50),
    sales_price DECIMAL(15,2)
);


CREATE TABLE dim_sales_agent (
    sales_agent_key INTEGER PRIMARY KEY,
    sales_agent_name VARCHAR(100),
    manager_name VARCHAR(100),
    regional_office VARCHAR(100)
);


CREATE TABLE dim_deal_stage (
    deal_stage_key INTEGER PRIMARY KEY,
    deal_stage VARCHAR(50)
);


CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE,
    day INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    quarter INTEGER,
    year INTEGER,
    is_weekend BOOLEAN
);


CREATE TABLE fact_sales_pipeline (
    sales_key INTEGER PRIMARY KEY,
    opportunity_id VARCHAR(50),

    account_key INTEGER,
    product_key INTEGER,
    sales_agent_key INTEGER,
    deal_stage_key INTEGER,

    engage_date_key INTEGER,
    close_date_key INTEGER,

    close_value DECIMAL(15,2),

    FOREIGN KEY (account_key)
        REFERENCES dim_account(account_key),

    FOREIGN KEY (product_key)
        REFERENCES dim_product(product_key),

    FOREIGN KEY (sales_agent_key)
        REFERENCES dim_sales_agent(sales_agent_key),

    FOREIGN KEY (deal_stage_key)
        REFERENCES dim_deal_stage(deal_stage_key),

    FOREIGN KEY (engage_date_key)
        REFERENCES dim_date(date_key),

    FOREIGN KEY (close_date_key)
        REFERENCES dim_date(date_key)
);