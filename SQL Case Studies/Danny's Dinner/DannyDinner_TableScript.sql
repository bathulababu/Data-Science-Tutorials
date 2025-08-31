CREATE TABLE dannysdinner.sales (
	customer_id VARCHAR(1),
    order_date DATE,
    product_id INTEGER
);

INSERT INTO dannysdinner.sales
	(customer_id, order_date, product_id)
VALUES 
	('A', '2025-08-01', 1),
    ('A', '2025-08-01', 2),
    ('A', '2025-08-07', 2),
    ('A', '2025-08-10', 3),
    ('A', '2025-08-11', 3),
    ('A', '2025-08-11', 3),
    ('B', '2025-08-01', 2),
	('B', '2025-08-02', 2),
	('B', '2025-08-04', 1),
	('B', '2025-08-11', 1),
	('B', '2025-08-16', 3),
	('B', '2025-08-01', 3),
	('C', '2025-08-01', 3),
	('C', '2025-08-01', 3),
	('C', '2025-08-07', 3);
    
CREATE TABLE dannysdinner.menu (
	product_id INTEGER,
    product_name VARCHAR(5),
    price INTEGER
);

INSERT INTO dannysdinner.menu
	(product_id, product_name, price)
VALUES
	(1, 'rice', 10),
    (2, 'cuury', 15),
    (3, 'curd', 12);
    
CREATE TABLE dannysdinner.members (
	customer_id VARCHAR(1),
    join_date DATE
);

INSERT INTO dannysdinner.members
	(customer_id, join_date)
VALUES
	('A', '2025-08-07'),
    ('B', '2025-08-09');
