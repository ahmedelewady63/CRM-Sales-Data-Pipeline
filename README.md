# CRM Sales Data Engineering Project

## 📌 Project Overview

This project implements a complete Data Engineering pipeline for analyzing CRM sales data.

The project uses **Airflow** for workflow orchestration, **DuckDB** as the data warehouse, and **dbt** for data transformation, dimensional modeling, and data quality testing.

The main goal is to transform raw CRM sales data into a clean **Star Schema** that can be used for analytics and reporting.

---

## 🏗️ Architecture

```text
CSV Files
    ↓
Airflow
    ↓
Extract
    ↓
Transform
    ↓
Load
    ↓
DuckDB ODS
    ↓
dbt Staging
    ↓
dbt Dimensions & Fact
    ↓
DWH Star Schema
```

---

## 🛠️ Technologies

* Python
* Pandas
* SQL
* Apache Airflow
* dbt
* DuckDB
* Docker
* Astro
* Git

---

## 📂 Source Data

The project uses the following CSV files:

* `accounts.csv`
* `products.csv`
* `sales_teams.csv`
* `sales_pipeline.csv`
* `data_dictionary.csv`

### Source Tables

#### Accounts

Contains information about customer companies, including sector, revenue, employees, location, and parent company.

#### Products

Contains product information such as product name, series, and sales price.

#### Sales Teams

Contains sales agent information, managers, and regional offices.

#### Sales Pipeline

Contains sales opportunities, including sales agent, product, account, deal stage, dates, and deal value.

#### Data Dictionary

Provides documentation describing the source columns and their meanings.

---

# 🔄 ETL Pipeline

## 1. Extract

Airflow extracts data from the source CSV files using Python and Pandas.

```text
CSV Files
    ↓
Extract
```

The extracted data is stored as intermediate files before transformation.

---

## 2. Transform

The data is cleaned and prepared before loading into the warehouse.

Transformation steps include:

* Removing unnecessary whitespace
* Standardizing text values
* Converting dates to proper date types
* Converting numeric columns to appropriate data types
* Removing duplicate records where required
* Handling NULL values
* Standardizing product and other business values

```text
Extracted Data
      ↓
Cleaning
      ↓
Standardization
      ↓
Validated Data
```

---

## 3. Load

The transformed data is loaded into **DuckDB**.

The raw business data is stored in the ODS layer.

```text
DuckDB

ODS
├── accounts
├── products
├── sales_teams
└── sales_pipeline
```

---

# ⭐ Dimensional Modeling

The project uses a **Star Schema**.

## Business Process

The main business process is:

```text
Sales Pipeline / Sales Opportunities
```

## Grain

The grain of the fact table is:

```text
One row represents one sales opportunity.
```

## Fact Table

```text
FactSalesPipeline
```

### Measures

* `close_value`

## Dimensions

* `DimAccount`
* `DimProduct`
* `DimSalesAgent`
* `DimDealStage`
* `DimDate`



# 🗂️ Data Warehouse Layers

The DuckDB database contains multiple logical layers:

```text
crm_sales.duckdb

├── ods
│   ├── accounts
│   ├── products
│   ├── sales_teams
│   └── sales_pipeline
│
├── stg
│   ├── stg_accounts
│   ├── stg_products
│   ├── stg_sales_teams
│   └── stg_sales_pipeline
│
└── dwh
    ├── dim_account
    ├── dim_product
    ├── dim_sales_agent
    ├── dim_deal_stage
    ├── dim_date
    └── fact_sales_pipeline
```

---

# 🔧 dbt

dbt is responsible for the transformation and dimensional modeling layer.

The project contains:

```text
models/
├── staging/
│   ├── sources.yml
│   ├── stg_accounts.sql
│   ├── stg_products.sql
│   ├── stg_sales_teams.sql
│   └── stg_sales_pipeline.sql
│
└── marts/
    ├── schema.yml
    ├── dim_account.sql
    ├── dim_product.sql
    ├── dim_sales_agent.sql
    ├── dim_deal_stage.sql
    ├── dim_date.sql
    └── fact_sales_pipeline.sql
```

---

# 🧪 Data Quality Testing

dbt tests are used to validate important warehouse keys.

The project currently applies:

* `unique`
* `not_null`

Examples include:

```text
account_key
product_key
sales_agent_key
deal_stage_key
date_key
sales_key
```

The `opportunity_id` is also validated as `not_null`.

---

# ⚙️ Airflow

Airflow is used to orchestrate the entire pipeline.

The workflow follows:

```text
Extract
   ↓
Transform
   ↓
Load
   ↓
dbt Build
   ↓
dbt Test
```

Airflow manages the task dependencies and execution order.

---

# 📁 Project Structure

```text
CRM_Sales_Project/
│
├── dags/
│   └── crm_sales_dag.py
│
├── dbt/
│   └── crm_sales/
│       ├── dbt_project.yml
│       ├── profiles.yml
│       ├── models/
│       │   ├── staging/
│       │   └── marts/
│       ├── tests/
│       └── macros/
│
├── include/
│   ├── data/
│   │   ├── accounts.csv
│   │   ├── products.csv
│   │   ├── sales_teams.csv
│   │   ├── sales_pipeline.csv
│   │   └── data_dictionary.csv
│   │
│   ├── processed/
│   └── crm_sales.duckdb
│
├── plugins/
├── Dockerfile
├── requirements.txt
├── packages.txt
└── README.md
```

---

# 🚀 Project Workflow

```text
1. Airflow starts the pipeline
          ↓
2. Extract source CSV files
          ↓
3. Transform and clean the data
          ↓
4. Load transformed data into DuckDB ODS
          ↓
5. dbt builds staging models
          ↓
6. dbt builds dimensions
          ↓
7. dbt builds the fact table
          ↓
8. dbt runs data quality tests
          ↓
9. Final Star Schema is ready for analysis
```

---

# 🎯 Project Goals

This project demonstrates practical Data Engineering skills in:

* ETL Pipeline Development
* Workflow Orchestration
* SQL
* Python
* Data Cleaning
* Data Warehousing
* Dimensional Modeling
* Star Schema Design
* dbt
* Data Quality Testing
* DuckDB
* Docker
* Apache Airflow

---

# 👨‍💻 Author

**Ahmed Elewady**

Data Engineer

