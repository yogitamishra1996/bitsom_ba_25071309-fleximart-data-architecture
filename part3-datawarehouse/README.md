FlexiMart Data Warehouse & Analytics - Part 3
Overview
This component of the project focuses on the design and implementation of an analytical Data Warehouse (DW) for FlexiMart. By transforming operational data into a Star Schema, we enable high-performance reporting and business intelligence, allowing stakeholders to identify sales patterns, product performance, and customer value segments.

Deliverables

1. star_schema_design.md: Technical documentation explaining the schema grain, surrogate keys, and data flow.

2. warehouse_schema.sql: SQL script to create the Dimensional Model (Fact and Dimension tables).

3. warehouse_data.sql: DML script populating the warehouse with 30+ dates, 15+ products, and 40+ sales transactions.

4. analytics_queries.sql: Advanced OLAP queries for monthly drill-downs, product revenue contribution, and customer segmentation.

Dimensional Model Design

1. The architecture utilizes a Star Schema to simplify query logic and improve join performance:

2. Fact Table (fact_sales): Captured at the transaction line-item grain, recording measures such as quantity_sold, unit_price, and total_amount.

3. Time Dimension (dim_date): A conformed dimension allowing for chronological analysis by year, quarter, month, and weekend indicators.

4. Product Dimension (dim_product): Stores descriptive attributes like category and subcategory to support roll-up reporting.

5. Customer Dimension (dim_customer): Contains regional data (city/state) and customer segments for targeted marketing analysis.

Analytical Capabilities
The provided analytics_queries.sql demonstrates three critical business intelligence scenarios:

1. Time-Series Drill-Down: Navigating from Yearly totals down to Quarterly and Monthly performance for the year 2024.

2. Revenue Contribution: Using Window Functions (SUM() OVER) to calculate the percentage each product contributes to total company revenue.

3. Market Segmentation: Applying CASE logic to categorize customers into 'High', 'Medium', and 'Low' value tiers based on historical spending.

Setup Instructions

1. Schema Creation: Run the warehouse_schema.sql script in your PostgreSQL/MySQL environment to build the star schema.

2. Data Population: Execute warehouse_data.sql to load the sample data. This script ensures referential integrity by populating dimensions before the fact table.

3. Analysis: Run the queries in analytics_queries.sql to generate the final business reports.
