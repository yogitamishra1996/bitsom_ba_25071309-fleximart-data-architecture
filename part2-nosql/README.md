FlexiMart NoSQL Implementation - Part 2

Overview
This section of the project focuses on transitioning FlexiMart's product catalog from a rigid relational structure to a flexible, document-oriented NoSQL database using MongoDB. This move supports highly diverse product attributes and nested customer reviews.

Deliverables

1. nosql_analysis.md: A detailed report justifying the use of NoSQL over RDBMS for diverse product catalogs.

2. products_catalog.json: A sample dataset containing 10+ diverse products with nested specifications and review arrays.

3. mongodb_operations.js: A collection of MongoDB Shell commands for data loading, querying, and complex aggregations.

Key Analysis Points

1. Schema Flexibility: Documentation on how MongoDB allows different products (like Laptops and Shoes) to coexist in the same collection without "NULL" value issues.

2. Performance: Evaluation of embedded documents for reviews to eliminate costly table joins.

3. Trade-offs: Honest assessment of storage overhead and transaction complexity compared to MySQL.

Implementation Details

1. The provided mongodb_operations.js covers five critical operations:

2. Load Data: Commands to import the JSON catalog into the products collection.

3. Filtered Queries: Retrieving specific electronics based on price thresholds.

4. Aggregation Pipelines: Calculating average user ratings across nested review arrays.

5. Atomic Updates: Appending new reviews using the $push operator.

6. Categorical Analysis: Grouping products to find average pricing and counts per category.

How to Run

1. Start MongoDB: Ensure your MongoDB service (or MongoDB Atlas cluster) is running.

2. Import Data: Run the following command in your terminal:

   mongoimport --db fleximart --collection products --file products_catalog.json --jsonArray

3. Execute Operations: Open the mongosh terminal and copy-paste the operations from mongodb_operations.js to see the results.
