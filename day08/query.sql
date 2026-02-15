use scott;
show tables;

select * from customer;
select * from product;

DESCRIBE CUSTOMER;
DESCRIBE PRODUCT;
show create table customer;
show create table product;

ALTER TABLE customer
MODIFY CNO BIGINT NOT NULL;


INSERT INTO customer (CID, CNAME, CNO, ADDRESS) VALUES
(1,  'Avinash', 9876543210, 'Mumbai'),
(2,  'Rahul',   9123456789, 'Delhi'),
(3,  'Sneha',   9988776655, 'Pune'),
(4,  'Amit',    9112233445, 'Bangalore'),
(5,  'Neha',    9090909090, 'Chennai'),

(6,  'Karan',   9000011111, 'Hyderabad'),
(7,  'Pooja',   9222333444, 'Jaipur'),
(8,  'Rohit',   9333444555, 'Indore'),
(9,  'Anita',   9444555666, 'Bhopal'),
(10, 'Vikas',   9555666777, NULL),
(11, 'aeiou',  9876543345, NULL);


INSERT INTO product (PID, PNAME, PDESCRIPTION, CUSTOMER_ID) VALUES
-- CUSTOMER 1 (MULTIPLE PRODUCTS)
(101, 'Laptop',        'Gaming Laptop',           1),
(102, 'Mouse',         'Wireless Mouse',          1),
(103, 'Keyboard',      'Mechanical Keyboard',     1),
(104, 'Monitor',       '27 inch Display',         1),

-- CUSTOMER 2
(105, 'Mobile',        'Android Smartphone',      2),
(106, 'PowerBank',     '10000mAh',                2),

-- CUSTOMER 3
(107, 'Headphones',    'Noise Cancelling',        3),
(108, 'Charger',       NULL,                      3),
(109, 'USB_Cable',     'Type C Cable',            3),
-- CUSTOMER 4
(110, 'Tablet',        '10 inch Tablet',          4),
-- CUSTOMER 6
(111, 'Camera',        'DSLR Camera',             6),
(112, 'Tripod',        'Camera Tripod',           6),
-- CUSTOMER 7
(113, 'SmartWatch',    'Fitness Watch',           7),
(114, 'Earbuds',       'Bluetooth Earbuds',       7),
(115, 'Cover',         'Mobile Cover',            7),
-- CUSTOMER 8
(116, 'Printer',       'Laser Printer',           8),
-- CUSTOMER 9
(117, 'Router',        'WiFi Router',             9),
(118, 'Extender',      'WiFi Range Extender',     9),
-- PRODUCTS WITH NO CUSTOMER
(119, 'GiftCard',      'Store Gift Card',         NULL),
(120, 'Warranty',     NULL,                      NULL),
(121, 'Subscription', 'Premium Plan',             NULL),
(122, 'Voucher',      'Discount Voucher',         NULL),
(123, 'DemoProduct',  'Testing Purpose',          NULL);


CREATE TABLE Students (
    Student_ID INT AUTO_INCREMENT 2 PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255)
);

SELECT * FROM STUDENTS;

INSERT INTO Students (First_Name, Last_Name)
VALUES (2, 'John', 'Doe');

DROP TABLE STUDENTS;
SHOW TABLES;