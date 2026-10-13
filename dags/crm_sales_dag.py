from airflow import DAG
from airflow.providers.standard.operators.python import PythonOperator
from airflow.providers.standard.operators.bash import BashOperator

from datetime import datetime

import pandas as pd
import duckdb


DB_PATH = "/usr/local/airflow/include/crm_sales.duckdb"
DATA_PATH = "/usr/local/airflow/include/data"


# =====================================================
# EXTRACT
# =====================================================

def extract_data():

    accounts = pd.read_csv(f"{DATA_PATH}/accounts.csv")

    products = pd.read_csv(f"{DATA_PATH}/products.csv")

    sales_teams = pd.read_csv(f"{DATA_PATH}/sales_teams.csv")

    sales_pipeline = pd.read_csv(f"{DATA_PATH}/sales_pipeline.csv")

    print("Accounts:", len(accounts))
    print("Products:", len(products))
    print("Sales Teams:", len(sales_teams))
    print("Sales Pipeline:", len(sales_pipeline))


# =====================================================
# TRANSFORM
# =====================================================

def transform_data():

    accounts = pd.read_csv(f"{DATA_PATH}/accounts.csv")

    products = pd.read_csv(f"{DATA_PATH}/products.csv")

    sales_teams = pd.read_csv(f"{DATA_PATH}/sales_teams.csv")

    sales_pipeline = pd.read_csv(f"{DATA_PATH}/sales_pipeline.csv")

    # Remove spaces from column names
    accounts.columns = accounts.columns.str.strip()
    products.columns = products.columns.str.strip()
    sales_teams.columns = sales_teams.columns.str.strip()
    sales_pipeline.columns = sales_pipeline.columns.str.strip()

    # Clean text
    accounts["account"] = accounts["account"].str.strip()

    products["product"] = products["product"].str.strip()

    sales_teams["sales_agent"] = (sales_teams["sales_agent"].str.strip())

    sales_pipeline["sales_agent"] = (sales_pipeline["sales_agent"].str.strip())

    sales_pipeline["product"] = (sales_pipeline["product"].str.strip())

    sales_pipeline["account"] = (sales_pipeline["account"].str.strip())

    # Convert dates
    sales_pipeline["engage_date"] = pd.to_datetime(sales_pipeline["engage_date"],errors="coerce")

    sales_pipeline["close_date"] = pd.to_datetime(sales_pipeline["close_date"],errors="coerce")

    # Convert close_value to number
    sales_pipeline["close_value"] = pd.to_numeric(sales_pipeline["close_value"],errors="coerce")

    print("Transformation completed")


# =====================================================
# LOAD
# =====================================================

def load_data():

    accounts = pd.read_csv(f"{DATA_PATH}/accounts.csv")

    products = pd.read_csv(f"{DATA_PATH}/products.csv")

    sales_teams = pd.read_csv(f"{DATA_PATH}/sales_teams.csv")
    
    sales_pipeline = pd.read_csv(f"{DATA_PATH}/sales_pipeline.csv")

    # Connect to DuckDB
    con = duckdb.connect(DB_PATH)

    # Create ODS schema
    con.execute(
        "CREATE SCHEMA IF NOT EXISTS ods"
    )

    # Load tables
    con.execute(f"""
        CREATE OR REPLACE TABLE ods.accounts AS
        SELECT *
        FROM read_csv_auto(
            '{DATA_PATH}/accounts.csv',
            header=true
        )
    """)

    con.execute(f"""
        CREATE OR REPLACE TABLE ods.products AS
        SELECT *
        FROM read_csv_auto(
            '{DATA_PATH}/products.csv',
            header=true
        )
    """)

    con.execute(f"""
        CREATE OR REPLACE TABLE ods.sales_teams AS
        SELECT *
        FROM read_csv_auto(
            '{DATA_PATH}/sales_teams.csv',
            header=true
        )
    """)

    con.execute(f"""
        CREATE OR REPLACE TABLE ods.sales_pipeline AS
        SELECT *
        FROM read_csv_auto(
            '{DATA_PATH}/sales_pipeline.csv',
            header=true
        )
    """)

    con.close()

    print("Data loaded into DuckDB")


# =====================================================
# DAG
# =====================================================

with DAG(
    dag_id="crm_sales_etl",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
) as dag:

    extract = PythonOperator(
        task_id="extract",
        python_callable=extract_data
    )

    transform = PythonOperator(
        task_id="transform",
        python_callable=transform_data
    )

    load = PythonOperator(
        task_id="load",
        python_callable=load_data
    )

    dbt_build = BashOperator(
        task_id="dbt_build",
        bash_command="""
            cd /usr/local/airflow/dbt/crm_sales &&
            dbt build --profiles-dir .
        """
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="""
            cd /usr/local/airflow/dbt/crm_sales &&
            dbt test --profiles-dir .
        """
    )

    extract >> transform >> load >> dbt_build >> dbt_test