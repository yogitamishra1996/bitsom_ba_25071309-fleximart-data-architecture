# FlexiMart Data Architecture Project

**Student Name:** Yogita Mishra
**Student ID:** bitsom_ba_25071309
**Email:** yogeshmishr1998@gmail.com
**Date:** 5 Jan 2026

## Project Overview

This project involved building a comprehensive data ecosystem for FlexiMart, covering the entire lifecycle from raw data ingestion to analytical insights. I implemented a Python-based ETL pipeline to clean messy operational data into a 3NF relational database, transitioned a diverse product catalog into a flexible NoSQL MongoDB document store, and designed a Star Schema Data Warehouse for complex OLAP reporting and business intelligence.

## Repository Structure

├── part1-database-etl/
│ ├── etl_pipeline.py # Python ETL script for cleaning and loading
│ ├── schema_documentation.md # 3NF documentation
│ ├── business_queries.sql # Analytical SQL for relational data
│ └── data_quality_report.txt # Summary of cleaning metrics
├── part2-nosql/
│ ├── nosql_analysis.md # RDBMS vs NoSQL justification report
│ ├── mongodb_operations.js # MongoDB queries and aggregations
│ └── products_catalog.json # Diverse product document store
├── part3-datawarehouse/
│ ├── star_schema_design.md # Star Schema logic and granularity
│ ├── warehouse_schema.sql # DW table definitions
│ ├── warehouse_data.sql # Fact and dimension data population
│ └── analytics_queries.sql # OLAP queries (Drill-down, Top-N)
└── README.md # Root project documentation

## Technologies Used

Python 3.x: Used for the ETL pipeline with pandas for cleaning and sqlalchemy for DB loading.

PostgreSQL 14 / MySQL 8.0: Used for the 3NF operational database and the Star Schema warehouse.

MongoDB 6.0: Used for the document-based product catalog and review analysis.

## Setup Instructions

### Database Setup

```bash

# Create databases

mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline (Clean and Load 3NF tables)

python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries (Purchase History & Sales Analysis)

mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

```

## Key Learnings

Through this project, I mastered the process of handling real-world "dirty" data, specifically learning how to identify and automate the resolution of duplicate records, missing values, and inconsistent formatting. I gained a deep understanding of structural trade-offs, learning when to apply rigid 3NF normalization for transaction integrity versus flexible BSON documents for diverse product attributes. Finally, I learned to implement Dimensional Modeling, realizing how a Star Schema significantly simplifies complex analytical queries like cumulative running totals and multi-level drill-downs.

## Challenges Faced

1. Challenge: Handling inconsistent date and phone formats across multiple source files.
   Solution: Built robust helper functions in Python using Regex and multiple datetime parsing attempts to ensure a unified format before loading.

2. Challenge: Calculating revenue contribution percentages in OLAP queries without collapsing row details.
   Solution: Utilized SQL Window Functions (SUM() OVER) to access global totals alongside individual line-item data within a single query.

3. Challenge: Maintaining referential integrity while populating the Data Warehouse.
   Solution: Orchestrated a specific load sequence where dimension tables were populated with surrogate keys before the fact table to prevent foreign key violations.
