Section A: Limitations of RDBMS
The current relational database (RDBMS) faces significant challenges when handling a highly diverse and evolving product catalog.

Attribute Diversity: In an RDBMS, every row in a table must follow the same column structure. Storing products with unique attributes—such as RAM for laptops versus size/color for shoes—results in a "sparse" table with many NULL values or requires complex "Entity-Attribute-Value" (EAV) modeling, which degrades performance.

Rigid Schema: Adding new product types with unique fields requires frequent ALTER TABLE commands. In production environments, schema migrations can be slow, resource-intensive, and may require downtime.

Nested Data: Relational databases struggle with hierarchical data like customer reviews. To store reviews, a separate table and a JOIN operation are necessary. As the number of reviews grows, these joins become computationally expensive.

Section B: NoSQL Benefits
MongoDB addresses these limitations through its document-oriented architecture:

Flexible Schema: MongoDB uses a dynamic schema (BSON). Each document in a collection can have a different set of fields. This allows FlexiMart to store a laptop and a pair of shoes in the same products collection, each with only their relevant attributes.

Embedded Documents: Instead of using separate tables, MongoDB allows reviews to be embedded directly within the product document as an array. This makes data retrieval extremely fast because all information for a single product is stored in one place, eliminating the need for joins.

Horizontal Scalability: MongoDB is designed for "sharding," which distributes data across multiple servers. As FlexiMart's catalog and traffic grow, the system can scale out by adding more commodity hardware rather than needing a single, massive, expensive server.

Section C: Trade-offs
While MongoDB offers flexibility, it has specific disadvantages compared to MySQL:

Increased Storage Overhead: MongoDB documents store both the field names (keys) and the values in every record. This leads to higher data redundancy and storage consumption compared to the normalized, compact rows of MySQL.

Complex Transactions: Although MongoDB supports multi-document ACID transactions, they are generally less efficient and more complex to implement than the native, deeply integrated transactional support in relational systems like MySQL, which can lead to data consistency challenges in highly complex financial operations.
