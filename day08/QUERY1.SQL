use scott;
show tables;

create table ORDERS(
	order_id int primary key,
    info varchar(20)
);

create table PRODUCT1 (
	p_id int, 
    o_id int references ORDERS(order_id)
);

INSERT INTO ORDERS (ORDER_ID, INFO)  VALUES (1, 'Mobile'), (2, 'Laptop'), (3, 'Accessory');
INSERT INTO PRODUCT1 VALUES (101, 1), (102, 1), (201, 2), (301, 3), (302, 3);

SELECT * FROM ORDERS;

-- REFERENCE OF PRIMARY AND FOREIGN KEY
SELECT O.order_id, O.info, P.p_id
FROM ORDERS O
JOIN PRODUCT1 P
ON O.order_id = P.o_id;


