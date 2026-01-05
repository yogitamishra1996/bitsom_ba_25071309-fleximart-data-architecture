import pandas as pd
import numpy as np
from sqlalchemy import create_engine, text
import datetime
import re
import logging

# --- 0. LOGGING CONFIGURATION ---
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger()

# --- DATABASE CONFIGURATION ---
DB_CONFIG = {
    "user": "postgres",
    "password": "postgres", 
    "host": "localhost",
    "port": "5432",
    "database": "fleximart"
}

# --- HELPER FUNCTIONS ---

def clean_phone(phone):
    if pd.isna(phone): return None
    digits = re.sub(r'\D', '', str(phone))
    if len(digits) == 12 and digits.startswith('91'): digits = digits[2:]
    elif len(digits) == 11 and digits.startswith('0'): digits = digits[1:]
    return f"+91-{digits}"

def clean_date(date_str):
    if pd.isna(date_str): return None
    return pd.to_datetime(date_str, errors='coerce').strftime('%Y-%m-%d')

def run_etl():
    report_stats = {
        "cust_init": 0, "prod_init": 0, "sales_init": 0,
        "dupes_removed": 0, "nulls_handled": 0, "loaded": 0
    }

    try:
        # --- 1. EXTRACT ---
        logger.info("Extracting CSV files...")
        cust_df = pd.read_csv('customers_raw.csv', skipinitialspace=True)
        prod_df = pd.read_csv('products_raw.csv', skipinitialspace=True)
        sales_df = pd.read_csv('sales_raw.csv', skipinitialspace=True)

        report_stats["cust_init"] = len(cust_df)
        report_stats["prod_init"] = len(prod_df)
        report_stats["sales_init"] = len(sales_df)

        # --- 2. TRANSFORM ---
        logger.info("Transforming data...")

        # A. Clean Customers
        report_stats["dupes_removed"] += cust_df.duplicated(subset=['email']).sum()
        cust_df = cust_df.dropna(subset=['email']).drop_duplicates(subset=['email'])
        cust_df['phone'] = cust_df['phone'].apply(clean_phone)
        cust_df['registration_date'] = cust_df['registration_date'].apply(clean_date)

        # B. Clean Products
        prod_df['price'] = pd.to_numeric(prod_df['price'], errors='coerce').fillna(0.0)
        prod_df['stock_quantity'] = pd.to_numeric(prod_df['stock_quantity'], errors='coerce').fillna(0).astype(int)

        # C. Clean Sales
        sales_df = sales_df.dropna(subset=['customer_id', 'product_id'])
        sales_df['transaction_date'] = sales_df['transaction_date'].apply(clean_date)
        sales_df['subtotal'] = sales_df['quantity'] * sales_df['unit_price']

        # --- 3. LOAD ---
        logger.info("Connecting to Database...")
        conn_str = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"
        engine = create_engine(conn_str)

        # 1. Load Customers
        # We keep 'email' in the DF to map IDs later
        cust_df[['first_name', 'last_name', 'email', 'phone', 'city', 'registration_date']].to_sql(
            'customers', engine, if_exists='append', index=False)
        
        # 2. Map IDs: Get the new integer IDs assigned by Postgres
        with engine.connect() as conn:
            query = text("SELECT customer_id, email FROM customers")
            id_mapping = pd.read_sql(query, conn)
        
        # Merge mapping into our sales data to replace "C001" with real integer IDs
        # We match on email because it is unique
        sales_with_email = sales_df.merge(cust_df[['customer_id', 'email']], on='customer_id', how='inner', suffixes=('_old', ''))
        sales_final = sales_with_email.merge(id_mapping, on='email', suffixes=('_csv', '_db'))
        
        # 3. Load Products
        prod_df[['product_name', 'category', 'price', 'stock_quantity']].to_sql(
            'products', engine, if_exists='append', index=False)

        # 4. Load Orders
        orders_df = sales_final.groupby(['transaction_id', 'customer_id_db', 'transaction_date', 'status'])['subtotal'].sum().reset_index()
        orders_df.columns = ['transaction_id', 'customer_id', 'order_date', 'status', 'total_amount']
        
        orders_df[['customer_id', 'order_date', 'status', 'total_amount']].to_sql(
            'orders', engine, if_exists='append', index=False)

        report_stats["loaded"] = len(cust_df) + len(prod_df) + len(orders_df)
        logger.info("Data successfully loaded.")

    except Exception as e:
        logger.error(f"ETL Pipeline failed: {e}")
        # Report is NOT generated if this fails to ensure you fix the error first
        return 

    # --- 4. GENERATE REPORT ---
    with open('data_quality_report.txt', 'w') as f:
        f.write("FLEXIMART DATA QUALITY REPORT\n")
        f.write("=============================\n")
        f.write(f"Generated on: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write(f"1. Records processed: Customers({report_stats['cust_init']}), Products({report_stats['prod_init']}), Sales({report_stats['sales_init']})\n")
        f.write(f"2. Duplicates removed: {report_stats['dupes_removed']}\n")
        f.write(f"3. Nulls/Errors handled: {report_stats['nulls_handled']}\n")
        f.write(f"4. Successfully loaded: {report_stats['loaded']}\n")
    
    logger.info("Report generated successfully.")

if __name__ == "__main__":
    run_etl()