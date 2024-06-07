--1. Determine which author or authors wrote the books most frequently purchased by customers of JustLee Books.

SELECT * FROM bookauthor;
SELECT * FROM author;
SELECT * FROM orderitems;

--Answer for Q1

SELECT (a.lname || ' ' || a.fname) AS author
FROM bookauthor ba
JOIN author a USING (authorid)
WHERE ba.isbn IN 
    (SELECT oi.isbn
    FROM orderitems oi
    GROUP BY oi.isbn
    HAVING SUM(oi.quantity) = 
        (SELECT MAX(totalquantity)
        FROM 
            (SELECT SUM(quantity) AS totalquantity
            FROM orderitems
            GROUP BY isbn)));

--2. List the shipping city and state for the order that had the longest shipping delay.

SELECT * FROM orders;

SELECT shipcity, shipstate, (shipdate-orderdate) AS "SHIPPING DELAY"
FROM orders
WHERE shipdate-orderdate =
    (SELECT MAX(shipdate-orderdate)
    FROM orders);

--Answer for Q2

SELECT shipcity, shipstate
FROM orders
WHERE shipdate-orderdate =
    (SELECT MAX(shipdate-orderdate)
    FROM orders);

--3. Determine which customers placed orders for the least expensive book (in terms of regular -- retail price) carried by JustLee Books.

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderitems;
SELECT * FROM books;

--Answer for Q3

SELECT customer#, (lastname || ' ' || firstname) AS name
FROM customers 
JOIN orders USING(customer#) 
JOIN orderitems USING(order#) 
JOIN books USING(isbn)
WHERE retail =
    (SELECT MIN(retail)
    FROM books);

--4. List the information on crime charges for each charge that has had a fine above average and a sum paid below average.

SELECT * FROM crime_charges;

--Answer for Q4

SELECT * FROM crime_charges cchar
WHERE cchar.fine_amount > (SELECT AVG(fine_amount) FROM crime_charges)
AND cchar.amount_paid < (SELECT AVG(amount_paid) FROM crime_charges);

--5. List the names of all criminals who have had any of the crime code charges involved in crime ID 10089.

SELECT * FROM criminals;
SELECT * FROM crimes;
SELECT * FROM crime_charges;

--Answer for Q5

SELECT (crnl.last || ' ' || crnl.first) AS "CRIMINAL NAME"
FROM criminals crnl
JOIN crimes crm ON crnl.criminal_id = crm.criminal_id
JOIN crime_charges cchar ON crm.crime_id = cchar.crime_id
WHERE (cchar.fine_amount IS NOT NULL) AND (cchar.crime_id = 10089);

--6. Use a correlated subquery to determine which criminals have had at least one probation period assigned.

SELECT * FROM criminals;
SELECT * FROM sentences;

SELECT stnc.sentence_id, stnc.prob_id, stnc.type
    FROM sentences stnc
    WHERE stnc.prob_id IS NOT NULL;

--Answer for Q6

SELECT * FROM criminals crnl
WHERE EXISTS 
    (SELECT stnc.sentence_id
    FROM sentences stnc
    WHERE stnc.criminal_id = crnl.criminal_id
    AND stnc.prob_id IS NOT NULL);