--Q1. Create a function to calculate a shopper’s total spending, excluding shipping and tax amount, with Brewbean’s site in a particular year. 
--Exception handling is needed.
--Use an anonymous block to call the function and output the result.

SELECT * FROM bb_basket;

--Answer for Q1

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION total_spend
    (shopperid bb_basket.idshopper%TYPE)
    RETURN bb_basket.subtotal%TYPE
    IS total bb_basket.subtotal%TYPE;
BEGIN
    SELECT SUM(subtotal) INTO total FROM bb_basket
    WHERE idshopper = shopperid;
    RETURN total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 0;   
END;
/

DECLARE
    total bb_basket.subtotal%TYPE; 
BEGIN
    FOR i IN (SELECT idshopper, firstname, lastname FROM bb_shopper) LOOP
        total := total_spend(i.idshopper);
        DBMS_OUTPUT.PUT_LINE('Shopper ID: ' || i.idshopper || ', Total Spending: ' || total);
    END LOOP;
END;
/

SELECT firstname, lastname, total_spend(idshopper) Total_Spending
FROM bb_shopper;

--Q2. Create a procedure to allow an employee in the shipping department to update an order status to add shipping information. 
--The BB_BASKETSTATUS table lists events for each order so that a shopper can see the current status, date, and comments as each stage of 
--the order process are finished. 
--Use an anonymous block to test your procedure. 

SELECT * FROM bb_basketstatus;

--Answer for Q2

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE update_order (
    basketID IN bb_basketstatus.idstatus%TYPE,
    bdate IN bb_basketstatus.dtstage%TYPE,
    notes IN bb_basketstatus.notes%TYPE,
    shipper IN bb_basketstatus.shipper%TYPE,
    shippingnum IN bb_basketstatus.shippingnum%TYPE
)
IS
BEGIN
    UPDATE bb_basketstatus
    SET 
        dtstage = bdate,
        notes = notes,
        shipper = shipper,
        shippingnum = shippingnum
    WHERE idstatus = basketID;
    COMMIT; 
END;
/

BEGIN
    update_order(
        basketID => 123,
        bdate => TO_DATE('22-10-23', 'DD-MM-YY'),
        notes => 'This is an order status',
        shipper => 'Shipper',
        shippingnum => '1234uiop'
    );
    COMMIT;
END;
/

--Q3. Create a function to insert a new product into an existing order, include the product id, unit price, quantity. 
--The output of the function is the message to notify the calling program whether the update succeeded or not. 
--Use an anonymous block to call the function and output the result.

SELECT * FROM bb_basketitem;

--Answer for Q3

CREATE OR REPLACE FUNCTION new_order(
    bitemid bb_basketitem.idbasketitem%TYPE,
    pid bb_basketitem.idproduct%TYPE,
    unprice bb_basketitem.price%TYPE,
    quan bb_basketitem.quantity%TYPE,
    bid bb_basketitem.idbasket%TYPE
)
RETURN VARCHAR2
IS
BEGIN
    INSERT INTO bb_basketitem (idbasketitem, idproduct, price, quantity, idbasket)
    VALUES (bitemid, pid, unprice, quan, bid);
    COMMIT; 
    RETURN 'Success'; 
EXCEPTION
    WHEN OTHERS THEN RETURN 'No Success';
END new_order;
/

DECLARE
    resultmes VARCHAR2(20); 
BEGIN
    resultmes := new_order(34, 16, 20.10, 3, 3);
    DBMS_OUTPUT.PUT_LINE('Result: ' || resultmes);
END;
/

SELECT * FROM bb_basketitem;

--Q4. Create a function to determine the total pledge amount for a project. Use the function in an SQL statement to list all projects, 
--displaying project ID, project name, and project pledge total amount. Format the pledge total amount to show a dollar sign. 
--Add at least two rows in dd_pledge for the project “Covid-19 relief fund” which you created.
--Use an anonymous block to call the function and output the result.

SELECT * FROM dd_pledge;
SELECT * FROM dd_project;

--Answer for Q4

CREATE OR REPLACE FUNCTION tot_pledge_amt
    (in_idproj IN NUMBER) 
    RETURN NUMBER 
    IS total_amt NUMBER := 0;
BEGIN
    SELECT SUM(pledgeamt) INTO total_amt FROM dd_pledge 
    WHERE idproj = in_idproj;
    RETURN NVL(total_amt, 0);
END;
/

INSERT INTO dd_project (idproj, projname)
VALUES (2, 'Covid-19 relief fund');

INSERT INTO dd_pledge (idpledge, idproj, pledgeamt, pledgedate)
VALUES (143, 2, 1000, TO_DATE('2023-10-21', 'YYYY-MM-DD'));

INSERT INTO dd_pledge (idpledge, idproj, pledgeamt, pledgedate)
VALUES (163, 2, 500, TO_DATE('2023-10-22', 'YYYY-MM-DD'));

SELECT 
    idproj, projname, TO_CHAR(tot_pledge_amt(idproj), '$999,999.99') AS total_Amount
FROM dd_project;

--Q5. Create a procedure to allow company employee to add new product to the database. This procedure needs only IN parameters. 
--Use an anonymous block to test your procedure. 

SELECT * FROM bb_product;

--Answer for Q5

CREATE OR REPLACE PROCEDURE add_new_prod(
    prodid IN NUMBER,
    prodname IN VARCHAR2,
    proddescription IN VARCHAR2,
    price IN NUMBER,
    depid IN NUMBER,
    stock IN NUMBER
    )
    IS
BEGIN
    INSERT INTO bb_product (idproduct, productname, description, price, iddepartment, stock)
    VALUES (prodid, prodname, proddescription, price, depid, stock);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New product added successfully.');
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

BEGIN
    add_new_prod(55, 'new product', 'new product description', 9.97, 3, 10);
END;
/
