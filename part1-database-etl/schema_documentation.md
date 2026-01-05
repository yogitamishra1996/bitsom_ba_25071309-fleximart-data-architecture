1. Entity-Relationship Description
   This database follows a relational structure designed for FlexiMart’s e-commerce operations.

ENTITY: customers

Purpose: Stores comprehensive personal and registration details for all customers.

Attributes:

customer_id: Unique surrogate identifier (Primary Key).

first_name: Customer's given name.

last_name: Customer's family name.

email: Unique electronic mail address used for login and communication.

phone: Standardized contact number in +91-XXXXXXXXXX format.

city: Residential city of the customer.

registration_date: The date the customer account was officially created.

Relationships:

One customer can place MANY orders (1:M relationship with the orders table).

ENTITY: products

Purpose: Maintains the inventory catalog and pricing details for all items sold.

Attributes:

product_id: Unique surrogate identifier (Primary Key).

product_name: Full descriptive name of the product.

category: Broad classification such as "Electronics" or "Fashion".

price: Unit price of the item.

stock_quantity: Current number of items available in the warehouse.

Relationships:

One product can appear in MANY order line items (1:M relationship with the order_items table).

ENTITY: orders

Purpose: Records high-level transaction data for every purchase.

Attributes:

order_id: Unique order identifier (Primary Key).

customer_id: Reference to the customer who placed the order (Foreign Key).

order_date: Date the transaction was initiated.

total_amount: Final monetary value of the complete order.

status: Current lifecycle state (e.g., Pending, Completed, Cancelled).

Relationships:

MANY orders belong to ONE customer (M:1 with customers).

One order contains MANY individual line items (1:M with order_items).

ENTITY: order_items

Purpose: Stores the granular specific products and quantities for each order.

Attributes:

order_item_id: Unique line-item identifier (Primary Key).

order_id: Reference to the parent order (Foreign Key).

product_id: Reference to the specific product purchased (Foreign Key).

quantity: Number of units of the product purchased.

unit_price: Price per unit recorded at the time of purchase.

subtotal: Calculated field (quantity × unit_price).

2. Normalization Explanation (3NF)
   The FlexiMart database is meticulously designed in Third Normal Form (3NF) to ensure maximum data integrity and eliminate redundancy.

Functional Dependencies
Customers: customer_id → first_name, last_name, email, phone, city, registration_date. All attributes depend solely on the Primary Key.

Products: product_id → product_name, category, price, stock_quantity.

Orders: order_id → customer_id, order_date, total_amount, status.

Justification for 3NF
The design fulfills 1NF by ensuring atomic values in every column and 2NF because all non-prime attributes are fully functionally dependent on their Primary Keys. It satisfies 3NF because it contains no transitive dependencies; for instance, the customer's city is determined only by the customer_id, not through another non-key attribute.

Avoiding Anomalies
Insert Anomaly: New products can be added to the inventory catalog without requiring a corresponding customer order.

Update Anomaly: Updating a customer’s email address requires a single change in the customers table, automatically reflecting across all their related orders.

Delete Anomaly: Deleting a cancelled order from the orders table does not lose the underlying customer data or product catalog information.

3. Sample Data Representation
   Table: customers | customer_id | first_name | last_name | email | phone | city | | :--- | :--- | :--- | :--- | :--- | :--- | | 1 | Rahul | Sharma | rahul.sharma@gmail.com | +91-9876543210 | Bangalore | | 2 | Priya | Patel | priya.patel@yahoo.com | +91-9988776655 | Mumbai |

Table: products | product_id | product_name | category | price | stock_quantity | | :--- | :--- | :--- | :--- | :--- | | 1 | Samsung Galaxy S21 | Electronics | 45999.00 | 150 | | 2 | Nike Running Shoes | Fashion | 3499.00 | 80 |

Table: orders | order_id | customer_id | order_date | total_amount | status | | :--- | :--- | :--- | :--- | :--- | | 1 | 1 | 2024-01-15 | 45999.00 | Completed | | 2 | 2 | 2024-01-16 | 5998.00 | Completed |
