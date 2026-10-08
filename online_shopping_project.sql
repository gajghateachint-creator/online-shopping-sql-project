CREATE DATABASE shopping_db;
USE shopping_db;
CREATE TABLE customer (
    cust_id VARCHAR(5) PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    area VARCHAR(10),
    phone_no VARCHAR(10)
);
CREATE TABLE category (
    category_id VARCHAR(5) PRIMARY KEY,
    category_name VARCHAR(30)
);
CREATE TABLE product (
    product_id VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(50),
    category_id VARCHAR(5),
    price DECIMAL(8,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);
CREATE TABLE orders (
    order_id VARCHAR(5) PRIMARY KEY,
    cust_id VARCHAR(5),
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(5),
    product_id VARCHAR(5),
    quantity INT,
    price DECIMAL(8,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE TABLE invoice (
    inv_no VARCHAR(5) PRIMARY KEY,
    order_id VARCHAR(5),
    inv_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE payment (
    payment_id VARCHAR(5) PRIMARY KEY,
    inv_no VARCHAR(5),
    payment_date DATE,
    payment_mode VARCHAR(20),
    payment_status VARCHAR(15),
    FOREIGN KEY (inv_no) REFERENCES invoice(inv_no)
);
INSERT INTO customer (cust_id, f_name, l_name, area, phone_no) VALUES
('C01', 'Amit',   'Sharma', 'DA', '9876543210'),
('C02', 'Priya',  'Verma',  'MU', '9876543211'),
('C03', 'Rajesh', 'Patil',  'GH', '9876543212'),
('C04', 'Pooja',  'Joshi',  'DA', '9876543213'),
('C05', 'Sneha',  'Kulkarni','PU', '9876543214'),
('C06', 'Rohan',  'Mehta',  'MU', '9876543215'),
('C07', 'Kiran',  'Desai',  'GH', '9876543216'),
('C08', 'Neha',   'Singh',  'NA', '9876543217'),
('C09', 'Vikram', 'Rao',    'PU', '9876543218'),
('C10', 'Anita',  'Nair',   'DA', '9876543219');
INSERT INTO category (category_id, category_name) VALUES
('CT01', 'Electronics'),
('CT02', 'Clothing'),
('CT03', 'Books'),
('CT04', 'Grocery'),
('CT05', 'Furniture');
INSERT INTO product (product_id, product_name, category_id, price, stock) VALUES
('P01', 'Laptop',      'CT01', 45000.00, 15),
('P02', 'Smartphone',  'CT01', 20000.00, 30),
('P03', 'Headphones',  'CT01',  1500.00, 50),
('P04', 'T-Shirt',     'CT02',   350.00, 100),
('P05', 'Jeans',       'CT02',  1200.00, 60),
('P06', 'Novel',       'CT03',   150.00, 80),
('P07', 'Notebook',    'CT03',   120.00, 200),
('P08', 'Rice Bag',    'CT04',   180.00, 90),
('P09', 'Study Table', 'CT05',  4500.00, 20),
('P10', 'Pen Drive',   'CT01',   450.00, 70);
INSERT INTO orders (order_id, cust_id, order_date, total_amount) VALUES
('O01', 'C01', '2023-06-10', 45300.00),
('O02', 'C02', '2023-07-05', 20150.00),
('O03', 'C03', '2023-07-20',  3700.00),
('O04', 'C04', '2023-08-12',  1980.00),
('O05', 'C02', '2023-08-25',  1250.00),
('O06', 'C05', '2023-09-03', 21500.00),
('O07', 'C01', '2023-09-15',   570.00),
('O08', 'C06', '2023-07-28',  3450.00);
SELECT * FROM orders;
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
('O01', 'P01', 1, 45000.00),
('O01', 'P06', 2,   150.00),
('O02', 'P02', 1, 20000.00),
('O02', 'P06', 1,   150.00),
('O03', 'P03', 2,  1500.00),
('O03', 'P04', 2,   350.00),
('O04', 'P03', 1,  1500.00),
('O04', 'P07', 4,   120.00),
('O05', 'P04', 1,   350.00),
('O05', 'P08', 5,   180.00),
('O06', 'P02', 1, 20000.00),
('O06', 'P03', 1,  1500.00),
('O07', 'P06', 3,   150.00),
('O07', 'P07', 1,   120.00),
('O08', 'P05', 2,  1200.00),
('O08', 'P04', 3,   350.00);
SELECT * FROM order_items;
INSERT INTO invoice (inv_no, order_id, inv_date, amount) VALUES
('I01', 'O01', '2023-06-11', 45300.00),
('I02', 'O02', '2023-07-06', 20150.00),
('I03', 'O03', '2023-07-21',  3700.00),
('I04', 'O04', '2023-08-13',  1980.00),
('I05', 'O05', '2023-08-26',  1250.00),
('I06', 'O06', '2023-09-04', 21500.00),
('I07', 'O07', '2023-09-16',   570.00),
('I08', 'O08', '2023-07-29',  3450.00);
SELECT * FROM invoice;
INSERT INTO payment (payment_id, inv_no, payment_date, payment_mode, payment_status) VALUES
('P01', 'I01', '2023-06-11', 'UPI',  'Success'),
('P02', 'I02', '2023-07-06', 'Card', 'Success'),
('P03', 'I03', '2023-07-21', 'UPI',  'Failed'),
('P04', 'I03', '2023-07-22', 'Card', 'Success'),
('P05', 'I04', '2023-08-13', 'UPI',  'Success'),
('P06', 'I05', '2023-08-26', 'Card', 'Failed'),
('P07', 'I06', '2023-09-04', 'UPI',  'Success'),
('P08', 'I07', '2023-09-16', 'Card', 'Success'),
('P09', 'I05', '2023-08-27', 'UPI',  'Success');
SELECT * FROM payment;
SELECT * FROM customer;
SELECT f_name, area
FROM customer
WHERE cust_id = 'C03';
SELECT f_name, l_name, phone_no
FROM customer;
SELECT COUNT(*) AS total_customers
FROM customer;
SELECT *
FROM customer
WHERE area IN ('DA', 'MU', 'GH');
UPDATE customer
SET area = 'JK'
WHERE cust_id = 'C01';
SELECT * FROM customer WHERE cust_id = 'C01';
SELECT *
FROM customer
WHERE f_name LIKE 'P%';
SELECT *
FROM customer
WHERE area LIKE '_A%';
UPDATE customer
SET phone_no = '567889'
WHERE f_name = 'Rajesh';
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM customer WHERE f_name = 'Rajesh';
SELECT * FROM customer WHERE f_name = 'Rajesh';
DELETE FROM customer
WHERE cust_id = 'C09';
SELECT * FROM customer;
SELECT * FROM category;
SELECT *
FROM product
WHERE price > 150;
SELECT *
FROM product
WHERE price BETWEEN 100 AND 180;
SELECT product_name, price
FROM product;
SELECT category_id, COUNT(*) AS total_products
FROM product
GROUP BY category_id;
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM product;
SELECT AVG(price) AS average_price
FROM product;
SELECT p.*
FROM product p
JOIN category c ON p.category_id = c.category_id
WHERE c.category_name IN ('Electronics', 'Clothing');
UPDATE product
SET price = 55000
WHERE product_name = 'Laptop';
SELECT * FROM product WHERE product_name = 'Laptop';
SELECT * FROM product WHERE product_name = 'Laptop';
SELECT *
FROM product
ORDER BY product_name ASC;
SELECT * FROM orders WHERE cust_id = 'C02';
SELECT COUNT(*) AS total_orders FROM orders;
SELECT * FROM orders WHERE order_date < '2023-08-01';
SELECT order_id, order_date FROM orders;
UPDATE orders SET total_amount = 12000 WHERE order_id = 'O05';
SELECT * FROM orders WHERE order_id = 'O05';
UPDATE orders SET total_amount = 12000 WHERE order_id = 'O05';
SELECT * FROM orders WHERE order_id = 'O05';
SELECT * FROM order_items;
SELECT product_id, SUM(quantity) AS total_qty
FROM order_items
GROUP BY product_id;
SELECT product_id, SUM(quantity) AS total_qty
FROM order_items
GROUP BY product_id
HAVING SUM(quantity) > 3;
SELECT order_id, SUM(quantity * price) AS total_price
FROM order_items
GROUP BY order_id;
SELECT * FROM product
WHERE product_id NOT IN (SELECT product_id FROM order_items);
SELECT * FROM invoice;
SELECT * FROM invoice WHERE order_id = 'O03';
DELETE FROM invoice WHERE inv_no = 'I08';
SELECT * FROM invoice;
UPDATE invoice SET inv_date = '2023-08-16' WHERE inv_no = 'I07';
SELECT * FROM invoice WHERE inv_no = 'I07';
SELECT * FROM invoice
WHERE inv_date BETWEEN '2023-07-01' AND '2023-08-31';
SELECT * FROM payment;
SELECT * FROM payment WHERE payment_status = 'FAILED';
SELECT * FROM payment WHERE payment_status = 'FAILED';
SELECT COUNT(*) AS successful_payments
FROM payment
WHERE payment_status = 'Success';
SELECT * FROM payment WHERE payment_mode = 'UPI';
DELETE FROM payment WHERE payment_id = 'P09';
SELECT * FROM payment;
SELECT c.f_name, c.l_name, o.order_id
FROM customer c
JOIN orders o ON c.cust_id = o.cust_id;
SELECT c.f_name, c.l_name, p.product_name, oi.quantity
FROM customer c
JOIN orders o ON c.cust_id = o.cust_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
ORDER BY c.cust_id;
SELECT c.cust_id, c.f_name, c.l_name, SUM(o.total_amount) AS total_spent
FROM customer c
JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.f_name, c.l_name;
SELECT i.inv_no, c.f_name, c.l_name
FROM invoice i
JOIN orders o ON i.order_id = o.order_id
JOIN customer c ON o.cust_id = c.cust_id;
SELECT * FROM customer
WHERE cust_id IN (SELECT cust_id FROM orders);
SELECT * FROM customer
WHERE cust_id NOT IN (SELECT cust_id FROM orders);
SELECT p.product_name, c.category_name
FROM product p
JOIN category c ON p.category_id = c.category_id;
SELECT c.category_name, SUM(oi.quantity * oi.price) AS total_sales
FROM order_items oi
JOIN product p ON oi.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_name;
SELECT c.cust_id, c.f_name, c.l_name, SUM(o.total_amount) AS total_spent
FROM customer c
JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.f_name, c.l_name
ORDER BY total_spent DESC
LIMIT 1;
SELECT DISTINCT p.product_name
FROM customer c
JOIN orders o ON c.cust_id = o.cust_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
WHERE c.area = 'DA';
