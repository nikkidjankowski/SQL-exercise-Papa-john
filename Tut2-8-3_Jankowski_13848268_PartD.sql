
-- Database Fundamentals Assignment, Part D FALL 2020
-- Nicole Denali Jankowski
-- 13848268@student.uts.edu.au 
-- Script name: Tut2-8-3_Jankowski_13848268_PartD.sql
-- purpose: create sql for papa johns database
-- date: 28 may 2020
-- https://www.papajohns.com/order/stores-near-me


DROP TABLE  IF EXISTS Customer CASCADE;
DROP TABLE  IF EXISTS CustomerOrder;
DROP TABLE  IF EXISTS Restaurant CASCADE;
DROP TABLE  IF EXISTS Membership;



CREATE TABLE Customer(
    CustomerID SERIAL UNIQUE PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    EmailAddress VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(14) NOT NULL,
    CreditCard BIGINT NOT NULL,
    AddressID INT NOT NULL 
    
);

INSERT INTO Customer (FirstName, LastName, EmailAddress, PhoneNumber, CreditCard, AddressID)
    VALUES ('Paul','Smith','paulsmith@gmail.com', '(465)384-9586', '473829485734', '1');

INSERT INTO Customer (FirstName, LastName, EmailAddress, PhoneNumber, CreditCard, AddressID)
    VALUES ('Sam','Rob','samrob@gmail.com', '(999)000-4855', '1111111111111111', '2');

INSERT INTO Customer (FirstName, LastName, EmailAddress, PhoneNumber, CreditCard, AddressID)
    VALUES ('Jenn','Anniston','jennanniston@gmail.com', '(444)555-3336', '8888884888888888', '3');

INSERT INTO Customer (FirstName, LastName, EmailAddress, PhoneNumber, CreditCard, AddressID) 
    VALUES ('Ryan','Block','ryanblockh@gmail.com', '(455)996-3333', '5555344444444444', '4');

INSERT INTO Customer (FirstName, LastName, EmailAddress, PhoneNumber, CreditCard, AddressID)
    VALUES ('Donald','Trump','donaldtrump@gmail.com', '(422)465-1556', '7677777777777777', '5');





CREATE TABLE CustomerOrder(
    OrderID SERIAL UNIQUE PRIMARY KEY,
    OrderDate date NOT NULL,
    CourseID INT NOT NULL,
    CustomerID INT NOT NULL, 
    CONSTRAINT FK_CustomerID_Order FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    ON UPDATE NO ACTION ON DELETE NO ACTION 
);

INSERT INTO CustomerOrder (CustomerID, CourseID, OrderDate)
    VALUES (1, 1, '09/23/2001');

INSERT INTO CustomerOrder (CustomerID, CourseID, OrderDate)
    VALUES (2, 2, '10/23/2001');

INSERT INTO CustomerOrder (CustomerID, CourseID, OrderDate)
    VALUES (3, 3, '11/23/2001');

INSERT INTO CustomerOrder (CustomerID, CourseID, OrderDate)
    VALUES (3, 4, '05/13/2004');

INSERT INTO CustomerOrder (CustomerID, CourseID, OrderDate)
    VALUES (5, 5, '01/04/2005');



CREATE TABLE Restaurant(
    RestaurantID SERIAL UNIQUE PRIMARY KEY,
    RestaurantName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(14) NOT NULL,
    AddressID BIGINT NOT NULL
        
);

INSERT INTO Restaurant (RestaurantName, PhoneNumber, AddressID)
    VALUES ('Papa Johns idaho', '(848)049-4854', '10');

INSERT INTO Restaurant (RestaurantName, PhoneNumber, AddressID)
    VALUES ('Papa Johns colorado', '(445)000-1111', '12');

INSERT INTO Restaurant (RestaurantName, PhoneNumber, AddressID)
    VALUES ('Papa Johns california', '(939)090-0909', '13');

INSERT INTO Restaurant (RestaurantName, PhoneNumber, AddressID)
    VALUES ('Papa Johns oklahoma', '(989)989-8989', '16');

INSERT INTO Restaurant (RestaurantName, PhoneNumber, AddressID)
    VALUES ('Papa Johns iowa', '(112)232-4343', '19');





CREATE TABLE Membership(
    RestaurantID INT NOT NULL,
    CustomerID INT NOT NULL,
    MembershipPassword VARCHAR(10) NOT NULL,
    CONSTRAINT FK_RestaurantID_Restaurant FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
    ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK_CustomerID_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
    ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT PK_Membership_Customer_Restaurant PRIMARY KEY (CustomerID, RestaurantID)
    
);


INSERT INTO Membership (RestaurantID, CustomerID, MembershipPassword)
    VALUES (1, 3, 'jann123');

INSERT INTO Membership (RestaurantID, CustomerID, MembershipPassword)
    VALUES (2, 3, 'jann123');

INSERT INTO Membership (RestaurantID, CustomerID, MembershipPassword)
    VALUES (2, 1, 'paulsm1993');

INSERT INTO Membership (RestaurantID, CustomerID, MembershipPassword)
    VALUES (5, 4, 'ryry1999');

INSERT INTO Membership (RestaurantID, CustomerID, MembershipPassword)
    VALUES (1, 2, 'sammy19');

INSERT INTO Membership (RestaurantID, CustomerID, MembershipPassword)
    VALUES (3, 5, 'trump2020');


-- 3.a.1
-- Get all the information of all the customers stored in the database.
-- SELECT STATEMENT:
SELECT * FROM Customer;

-- RESULT TABLE:

-- customerid | firstname | lastname |      emailaddress      |  phonenumber  |    creditcard    | addressid 
--------------+-----------+----------+------------------------+---------------+------------------+-----------
--         1 | Paul      | Smith    | paulsmith@gmail.com    | (465)384-9586 |     473829485734 |         1
--           2 | Sam       | Rob      | samrob@gmail.com       | (999)000-4855 | 1111111111111111 |         2
--           3 | Jenn      | Anniston | jennanniston@gmail.com | (444)555-3336 | 8888884888888888 |         3
--          4 | Ryan      | Block    | ryanblockh@gmail.com   | (455)996-3333 | 5555344444444444 |         4
--          5 | Donald    | Trump    | donaldtrump@gmail.com  | (422)465-1556 | 7677777777777777 |         5

-- 3.a.2
-- Get all the information of all orders stored in the database.
-- SELECT STATEMENT:
SELECT * FROM CustomerOrder;
-- RESULT TABLE:
-- orderid | orderdate  | courseid | customerid 
---------+------------+----------+------------
--       1 | 2001-09-23 |        1 |          1
--      2 | 2001-10-23 |        2 |          2
--       3 | 2001-11-23 |        3 |          3
--       4 | 2004-05-13 |        4 |          3
--       5 | 2005-01-04 |        5 |          5

-- 3.a.3
-- Get all the information of all the restaurants stored in the database.
-- SELECT STATEMENT:
SELECT * FROM Restaurant;
-- RESULT TABLE:
-- restaurantid |    restaurantname     |  phonenumber  | addressid 
--------------+-----------------------+---------------+-----------
--           1 | Papa Johns idaho      | (848)049-4854 |        10
--            2 | Papa Johns colorado   | (445)000-1111 |        12
--            3 | Papa Johns california | (939)090-0909 |        13
--            4 | Papa Johns oklahoma   | (989)989-8989 |        16
--            5 | Papa Johns iowa       | (112)232-4343 |        19
-- 3.a.4
-- Get all the information of all the memberships stored in the database.
-- SELECT STATEMENT:
SELECT * FROM Membership;
-- RESULT TABLE:
--restaurantid | customerid | membershippassword 
--------------+------------+--------------------
--           1 |          3 | jann123
--            2 |          3 | jann123
--            2 |          1 | paulsm1993
--            5 |          4 | ryry1999
--           1 |          2 | sammy19
--           3 |          5 | trump2020

-- 3.b: Get the information on all customers and their orders.
-- 3.b: SELECT STATEMENT:
SELECT * 
FROM Customer NATURAl JOIN CustomerOrder; 

-- 3.b: RESULT TABLE:

-- customerid | firstname | lastname |      emailaddress      |  phonenumber  |    creditcard    | addressid | orderid | orderdate  | courseid 
------------+-----------+----------+------------------------+---------------+------------------+-----------+---------+------------+----------
--         1 | Paul      | Smith    | paulsmith@gmail.com    | (465)384-9586 |     473829485734 |         1 |       1 | 2001-09-23 |        1
--        2 | Sam       | Rob      | samrob@gmail.com       | (999)000-4855 | 1111111111111111 |         2 |       2 | 2001-10-23 |        2
--          3 | Jenn      | Anniston | jennanniston@gmail.com | (444)555-3336 | 8888884888888888 |         3 |       3 | 2001-11-23 |        3
--          3 | Jenn      | Anniston | jennanniston@gmail.com | (444)555-3336 | 8888884888888888 |         3 |       4 | 2004-05-13 |        4
--         5 | Donald    | Trump    | donaldtrump@gmail.com  | (422)465-1556 | 7677777777777777 |         5 |       5 | 2005-01-04 |        5



-- 3.C: Get all the information on every memberships and their the restaurant information.
-- 3.C: SELECT STATEMENT:
SELECT * 
FROM Membership INNER JOIN Restaurant 
ON Membership.RestaurantID = Restaurant.RestaurantID;

-- 3.C: RESULT TABLE:

--  restaurantid | customerid | membershippassword | restaurantid |    restaurantname     |  phonenumber  | addressid 
--------------+------------+--------------------+--------------+-----------------------+---------------+-----------
--           1 |          3 | jann123            |            1 | Papa Johns idaho      | (848)049-4854 |        10
--           2 |          3 | jann123            |            2 | Papa Johns colorado   | (445)000-1111 |        12
--           2 |          1 | paulsm1993         |            2 | Papa Johns colorado   | (445)000-1111 |        12
--            5 |          4 | ryry1999           |            5 | Papa Johns iowa       | (112)232-4343 |        19
--            1 |          2 | sammy19            |            1 | Papa Johns idaho      | (848)049-4854 |        10
--            3 |          5 | trump2020          |            3 | Papa Johns california | (939)090-0909 |        13




-- 3.D: Get all members identification and the restaurants used in their memberships as well as those restaurants’ phone numbers.

-- 3.D: SELECT STATEMENT:

SELECT CustomerID, RestaurantName, PhoneNumber
FROM (SELECT * 
FROM Membership INNER JOIN Restaurant 
ON Membership.RestaurantID = Restaurant.RestaurantID) AS CRP ;

-- 3.D: RESULT TABLE:

--  customerid |    restaurantname     |  phonenumber  
------------+-----------------------+---------------
--          3 | Papa Johns idaho      | (848)049-4854
--          3 | Papa Johns colorado   | (445)000-1111
--          1 | Papa Johns colorado   | (445)000-1111
--          4 | Papa Johns iowa       | (112)232-4343
--          2 | Papa Johns idaho      | (848)049-4854
--          5 | Papa Johns california | (939)090-0909


-- 3.E: List all restaurant names that are affiliated with memberships and have the member’s first and last name.

-- 3.E: SELECT STATEMENT:

SELECT Restaurant.RestaurantName, Customer.FirstName, Customer.LastName 
FROM Customer INNER JOIN Membership 
ON Customer.CustomerID = Membership.CustomerID
INNER JOIN Restaurant
ON Membership.RestaurantID = Restaurant.RestaurantID
;

-- 3.E: RESULT TABLE:

--     restaurantname     | firstname | lastname 
-----------------------+-----------+----------
-- Papa Johns idaho      | Jenn      | Anniston
-- Papa Johns colorado   | Jenn      | Anniston
-- Papa Johns colorado   | Paul      | Smith
-- Papa Johns iowa       | Ryan      | Block
-- Papa Johns idaho      | Sam       | Rob
-- Papa Johns california | Donald    | Trump


-- 3.F: List all members’s ID numbers and the number of restaurants their membership uses.

-- 3.F: SELECT STATEMENT:

SELECT CustomerID, COUNT(RestaurantID) AS NumberofRestaurants
FROM Membership
GROUP BY CustomerID;


-- 3.F: RESULT TABLE:

--  customerid | numberofrestaurants 
------------+---------------------
--         3 |                   2
--          5 |                   1
--          4 |                   1
--          2 |                   1
--          1 |                   1

-- 3.G: Get the customer’s ID numbers and the total number of orders each customer has made. 

-- 3.G: SELECT STATEMENT:

SELECT CustomerID, COUNT(OrderID) AS NumberofOrders
FROM CustomerOrder
GROUP BY CustomerID;

-- 3.G: RESULT TABLE:

--  customerid | numberoforders 
------------+----------------
--          3 |              2
--          5 |              1
--          2 |              1
--          1 |              1



-- 3.H: Find the first name of the customer with the most amount of orders.
-- 3.H: SELECT STATEMENT:


SELECT FirstName
FROM customer AS cust, 

(SELECT MAX(numoforder) AS maxnumorder
FROM 
(SELECT customerid, COUNT(orderid) AS numoforder
FROM CustomerOrder
GROUP BY customerid) AS a ) AS b,

(SELECT customerid, COUNT(orderid) AS numoforder
FROM CustomerOrder
GROUP BY customerid) AS c

WHERE c.numoforder = b.maxnumorder
AND c.customerid = cust.customerid 
GROUP BY 1
;


-- 3.H: RESULT TABLE:

-- firstname 
-- -----------
-- Jenn


-- 3.I: List the last names of all customers that have a gmail email.

-- 3.I: SELECT STATEMENT:

SELECT LastNamesWithGmail
FROM 
(SELECT LastName
 FROM Customer
WHERE EmailAddress LIKE '%gmail%') AS LastNamesWithGmail
;

-- 3.H: RESULT TABLE:

--  lastnameswithgmail 
-- --------------------
--  (Smith)
--  (Rob)
--  (Anniston)
--  (Block)
--  (Trump)
