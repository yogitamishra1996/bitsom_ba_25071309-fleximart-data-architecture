Section 1: Schema Overview
This schema uses a Star Schema architecture to optimize FlexiMart's sales analysis.

FACT TABLE: fact_sales

1. Grain: One row per product per order line item.

2. Business Process: Sales transactions.

3. Measures (Numeric Facts):

4. quantity_sold: Number of units sold.

5. unit_price: Price per unit at time of sale.

6. discount_amount: Discount applied.

7. total_amount: Final amount (quantity × unit_price - discount).

8. Foreign Keys:

9. date_key → dim_date.

10. product_key → dim_product.

11. customer_key → dim_customer.

DIMENSION TABLE: dim_date

1. Purpose: Date dimension for time-based analysis.

2. Type: Conformed dimension.

3. Attributes:

4. date_key (PK): Surrogate key (integer, format: YYYYMMDD).

5. full_date: Actual date.

6. day_of_week: Monday, Tuesday, etc..

7. month: 1-12.

8. month_name: January, February, etc..

9. quarter: Q1, Q2, Q3, Q4.

10. year: 2023, 2024, etc..

11. is_weekend: Boolean.

DIMENSION TABLE: dim_product

1. Purpose: Stores descriptive attributes of products.

2. Attributes:

3. product_key (PK): Surrogate key.

4. product_id: Natural key from source.

5. product_name: Name of the product.

6. category: Broad classification.

7. subcategory: Specific classification.

8. unit_price: Current list price.

DIMENSION TABLE: dim_customer

1. Purpose: Stores demographic and regional information of customers.

2. Attributes:

3. customer_key (PK): Surrogate key.

4. customer_id: Natural key from source.

5. customer_name: Full name.

6. city: Customer's city.

7. state: Customer's state.

8. customer_segment: Segmentation (e.g., High Value).

Section 2: Design Decisions
The following design choices were made to optimize FlexiMart's analytical capabilities:

1. Granularity: I chose the transaction line-item level because it provides the highest level of detail. This allows users to slice and dice sales by individual products within an order, providing deep insight into product associations and specific item performance.

2. Surrogate Keys: I used surrogate keys instead of natural keys to decouple the data warehouse from source system changes. This ensures stability, improves join performance (using integers), and allows for tracking historical changes over time (Slowly Changing Dimensions) even if a source ID is recycled.

3. Drill-down and Roll-up: This star schema supports drill-down (moving from Year → Quarter → Month) by navigating the hierarchies within dim_date. Conversely, roll-up (aggregating from individual sales to total city revenue) is achieved by summing measures in fact_sales while grouping by attributes in dim_customer.

Section 3: Sample Data Flow
Example of a single transaction moving from the operational source to the analytical warehouse:

Source Transaction: Order #101, Customer "John Doe", Product "Laptop", Qty: 2, Price: 50000.

Becomes in Data Warehouse:

1. fact_sales: { date_key: 20240115, product_key: 5, customer_key: 12, quantity_sold: 2, unit_price: 50000, total_amount: 100000 }.

2. dim_date: { date_key: 20240115, full_date: '2024-01-15', month: 1, quarter: 'Q1', month_name: 'January', year: 2024 }.

3. dim_product: { product_key: 5, product_name: 'Laptop', category: 'Electronics' }.

4. dim_customer: { customer_key: 12, customer_name: 'John Doe', city: 'Mumbai' }.
