# FlexiMart Data Engineering Project - Part 1

## Overview

This project implements an end-to-end ETL (Extract, Transform, Load) pipeline for FlexiMart to process customer, product, and sales data from "dirty" CSV files into a structured PostgreSQL database.

## Deliverables Included

- `etl_pipeline.py`: Python script for automated data cleaning and loading.
- `data_quality_report.txt`: Summary of records processed, duplicates removed, and nulls handled.
- `schema_documentation.md`: Technical documentation of the 3NF database design.
- `business_queries.sql`: Analytical SQL queries to answer specific business scenarios.

## Database Schema

The pipeline loads data into the following tables:

1.  **customers**: Cleaned personal details with standardized phone formats.
2.  **products**: Inventory catalog with standardized categories.
3.  **orders**: High-level transaction data mapped from sales.
4.  **order_items**: Granular line-item details including quantities and subtotals.

## Setup Instructions

### Prerequisites

- Python 3.8+
- PostgreSQL Database
- VS Code (recommended)

### Installation

1.  Clone this repository or create a local project folder.
2.  Install the required Python packages:
    ```bash
    pip install -r requirements.txt
    ```

### Execution

1.  **Initialize Database**: Execute the schema creation SQL commands in your PostgreSQL terminal to create the four required tables.
2.  **Configure DB Connection**: Update the `DB_CONFIG` dictionary in `etl_pipeline.py` with your PostgreSQL username and password.
3.  **Run Pipeline**: Execute the script from your terminal:
    ```bash
    python etl_pipeline.py
    ```
4.  **Verify Results**:
    - Check `data_quality_report.txt` for transformation metrics.
    - Run queries in `business_queries.sql` within your database tool to view analytical reports.

## Transformation Logic Applied

- **Duplicates**: Removed using unique identifiers (e.g., `customer_id`, `transaction_id`).
- **Missing Values**: Dropped critical nulls (emails/IDs) and filled optional nulls (price/stock).
- **Standardization**: Converted all dates to `YYYY-MM-DD` and phone numbers to `+91-XXXXXXXXXX`.
- **Surrogate Keys**: Implemented using PostgreSQL `SERIAL` for all primary keys.
