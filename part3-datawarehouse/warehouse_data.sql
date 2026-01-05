-- --- POPULATE dim_date (30 Records: Jan & Feb 2024) ---
INSERT INTO dim_date (date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend) VALUES
-- January 2024 Sequence (20 Records)
(20240101, '2024-01-01', 'Monday', 1, 1, 'January', 'Q1', 2024, FALSE),
(20240102, '2024-01-02', 'Tuesday', 2, 1, 'January', 'Q1', 2024, FALSE),
(20240103, '2024-01-03', 'Wednesday', 3, 1, 'January', 'Q1', 2024, FALSE),
(20240104, '2024-01-04', 'Thursday', 4, 1, 'January', 'Q1', 2024, FALSE),
(20240105, '2024-01-05', 'Friday', 5, 1, 'January', 'Q1', 2024, FALSE),
(20240106, '2024-01-06', 'Saturday', 6, 1, 'January', 'Q1', 2024, TRUE),
(20240107, '2024-01-07', 'Sunday', 7, 1, 'January', 'Q1', 2024, TRUE),
(20240108, '2024-01-08', 'Monday', 8, 1, 'January', 'Q1', 2024, FALSE),
(20240109, '2024-01-09', 'Tuesday', 9, 1, 'January', 'Q1', 2024, FALSE),
(20240110, '2024-01-10', 'Wednesday', 10, 1, 'January', 'Q1', 2024, FALSE),
(20240111, '2024-01-11', 'Thursday', 11, 1, 'January', 'Q1', 2024, FALSE),
(20240112, '2024-01-12', 'Friday', 12, 1, 'January', 'Q1', 2024, FALSE),
(20240113, '2024-01-13', 'Saturday', 13, 1, 'January', 'Q1', 2024, TRUE),
(20240114, '2024-01-14', 'Sunday', 14, 1, 'January', 'Q1', 2024, TRUE),
(20240115, '2024-01-15', 'Monday', 15, 1, 'January', 'Q1', 2024, FALSE),
(20240116, '2024-01-16', 'Tuesday', 16, 1, 'January', 'Q1', 2024, FALSE),
(20240117, '2024-01-17', 'Wednesday', 17, 1, 'January', 'Q1', 2024, FALSE),
(20240118, '2024-01-18', 'Thursday', 18, 1, 'January', 'Q1', 2024, FALSE),
(20240119, '2024-01-19', 'Friday', 19, 1, 'January', 'Q1', 2024, FALSE),
(20240120, '2024-01-20', 'Saturday', 20, 1, 'January', 'Q1', 2024, TRUE),

-- February 2024 Sequence (10 Records)
(20240201, '2024-02-01', 'Thursday', 1, 2, 'February', 'Q1', 2024, FALSE),
(20240202, '2024-02-02', 'Friday', 2, 2, 'February', 'Q1', 2024, FALSE),
(20240203, '2024-02-03', 'Saturday', 3, 2, 'February', 'Q1', 2024, TRUE),
(20240204, '2024-02-04', 'Sunday', 4, 2, 'February', 'Q1', 2024, TRUE),
(20240205, '2024-02-05', 'Monday', 5, 2, 'February', 'Q1', 2024, FALSE),
(20240206, '2024-02-06', 'Tuesday', 6, 2, 'February', 'Q1', 2024, FALSE),
(20240207, '2024-02-07', 'Wednesday', 7, 2, 'February', 'Q1', 2024, FALSE),
(20240208, '2024-02-08', 'Thursday', 8, 2, 'February', 'Q1', 2024, FALSE),
(20240209, '2024-02-09', 'Friday', 9, 2, 'February', 'Q1', 2024, FALSE),
(20240210, '2024-02-10', 'Saturday', 10, 2, 'February', 'Q1', 2024, TRUE);

-- --- 2. POPULATE dim_product (15 Products across 3 Categories) ---
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001', 'Samsung Galaxy S21', 'Electronics', 'Smartphones', 45999.00),
('P002', 'Apple MacBook Pro', 'Electronics', 'Laptops', 150000.00),
('P003', 'Sony WH-1000XM5', 'Electronics', 'Audio', 29990.00),
('P004', 'Nike Air Max', 'Fashion', 'Footwear', 12995.00),
('P005', 'Levis 511 Jeans', 'Fashion', 'Clothing', 3499.00),
('P006', 'Adidas Originals T-Shirt', 'Fashion', 'Clothing', 1499.00),
('P007', 'Organic Almonds 1kg', 'Groceries', 'Dry Fruits', 899.00),
('P008', 'Basmati Rice 5kg', 'Groceries', 'Grains', 650.00),
('P009', 'OnePlus Nord CE 3', 'Electronics', 'Smartphones', 26999.00),
('P010', 'Dell 27-inch Monitor', 'Electronics', 'Monitors', 32999.00),
('P011', 'Puma RS-X Sneakers', 'Fashion', 'Footwear', 8999.00),
('P012', 'H&M Formal Shirt', 'Fashion', 'Clothing', 1999.00),
('P013', 'Organic Honey 500g', 'Groceries', 'Sweeteners', 450.00),
('P014', 'Masoor Dal 1kg', 'Groceries', 'Pulses', 120.00),
('P015', 'Samsung 55-inch TV', 'Electronics', 'Televisions', 64999.00);

-- --- 3. POPULATE dim_customer (12 Customers across 4 Cities) ---
INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001', 'Rahul Sharma', 'Bangalore', 'Karnataka', 'High Value'),
('C002', 'Priya Patel', 'Mumbai', 'Maharashtra', 'High Value'),
('C003', 'Amit Kumar', 'Delhi', 'Delhi', 'Medium Value'),
('C004', 'Sneha Reddy', 'Hyderabad', 'Telangana', 'Medium Value'),
('C005', 'Vikram Singh', 'Chennai', 'Tamil Nadu', 'Medium Value'),
('C006', 'Anjali Mehta', 'Bangalore', 'Karnataka', 'Low Value'),
('C007', 'Ravi Verma', 'Pune', 'Maharashtra', 'Low Value'),
('C008', 'Pooja Iyer', 'Bangalore', 'Karnataka', 'High Value'),
('C009', 'Karthik Nair', 'Kochi', 'Kerala', 'Medium Value'),
('C010', 'Deepa Gupta', 'Delhi', 'Delhi', 'Low Value'),
('C011', 'Arjun Rao', 'Hyderabad', 'Telangana', 'High Value'),
('C012', 'Lakshmi Krishnan', 'Chennai', 'Tamil Nadu', 'Medium Value');

-- --- 4. POPULATE fact_sales (40 Sales Transactions) ---
-- Note: Realistic patterns (Weekend spikes, varied quantities)
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES
(20240106, 1, 1, 1, 45999.00, 1000.00, 44999.00), -- Weekend High-value
(20240106, 5, 1, 2, 3499.00, 0.00, 6998.00),    -- Weekend
(20240107, 2, 2, 1, 150000.00, 5000.00, 145000.00), -- Weekend High-value
(20240115, 7, 3, 5, 899.00, 0.00, 4495.00),     -- Weekday Grocery
(20240120, 3, 4, 1, 29990.00, 990.00, 29000.00),  -- Weekend
(20240121, 15, 11, 1, 64999.00, 2000.00, 62999.00); -- Weekend High-value

-- January Weekday Transactions (Steady flow)
(20240101, 10, 5, 1, 1200.00, 100.00, 1100.00),
(20240102, 12, 6, 2, 450.00, 0.00, 900.00),
(20240103, 8, 7, 1, 15000.00, 500.00, 14500.00),
(20240104, 20, 8, 10, 50.00, 0.00, 500.00),
(20240105, 14, 9, 1, 2500.00, 200.00, 2300.00),
(20240108, 11, 10, 3, 300.00, 0.00, 900.00),
(20240109, 4, 12, 1, 12000.00, 1000.00, 11000.00),
(20240110, 18, 13, 1, 7500.00, 0.00, 7500.00),
(20240111, 6, 14, 4, 250.00, 50.00, 950.00),
(20240112, 9, 15, 1, 55000.00, 3000.00, 52000.00),

-- January Weekend Spike (High Volume/Value)
(20240113, 1, 16, 1, 45999.00, 1500.00, 44499.00),
(20240113, 22, 17, 2, 1200.00, 0.00, 2400.00),
(20240114, 2, 18, 1, 150000.00, 10000.00, 140000.00),
(20240114, 25, 19, 5, 200.00, 0.00, 1000.00),
(20240120, 16, 20, 1, 35000.00, 1500.00, 33500.00),
(20240120, 17, 21, 2, 4500.00, 200.00, 8800.00),
(20240121, 3, 22, 1, 29990.00, 0.00, 29990.00),

-- End of January / Payday Period
(20240125, 5, 23, 1, 3499.00, 499.00, 3000.00),
(20240131, 1, 24, 1, 45999.00, 2000.00, 43999.00),
(20240131, 7, 25, 10, 899.00, 899.00, 8091.00),

-- February Transactions (Mixed)
(20240201, 10, 26, 2, 1200.00, 0.00, 2400.00),
(20240202, 15, 27, 1, 64999.00, 5000.00, 59999.00),
(20240203, 4, 28, 1, 12000.00, 1000.00, 11000.00), -- Weekend
(20240203, 19, 29, 3, 1500.00, 100.00, 4400.00), -- Weekend
(20240204, 2, 30, 1, 150000.00, 0.00, 150000.00), -- Weekend
(20240204, 21, 31, 1, 25000.00, 2000.00, 23000.00), -- Weekend
(20240205, 8, 32, 1, 15000.00, 0.00, 15000.00),
(20240206, 12, 33, 4, 450.00, 0.00, 1800.00),
(20240207, 14, 34, 1, 2500.00, 100.00, 2400.00),
(20240208, 6, 35, 2, 250.00, 0.00, 500.00),
(20240209, 11, 36, 5, 300.00, 150.00, 1350.00),
(20240210, 1, 37, 1, 45999.00, 3000.00, 42999.00), -- Weekend Spike
(20240210, 23, 38, 2, 800.00, 0.00, 1600.00),
(20240210, 24, 39, 1, 12000.00, 500.00, 11500.00);