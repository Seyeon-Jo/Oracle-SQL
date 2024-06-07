--Assignment 3-9: Retrieving Pledge Totals
--Create a PL/SQL block that retrieves and displays information for a specific project based on Project ID. 
--Display the following on a single row of output: project ID, project name, number of pledges made, 
--total dollars pledged, and the average pledge amount.

SELECT * FROM dd_project;
SELECT * FROM dd_pledge;

--Answer for Q.3-9

SET SERVEROUTPUT ON;

DECLARE

proj_name       dd_project.projname%type;
proj_id         dd_project.idproj%type;
pledge_count    dd_pledge.pledgeamt%type;
pledge_average  dd_pledge.pledgeamt%type;
pledge_sum      dd_pledge.pledgeamt%type;

BEGIN

SELECT dd_project.idproj, projname, count(pledgeamt), sum(pledgeamt), avg(pledgeamt)
INTO proj_id, proj_name, pledge_count, pledge_sum, pledge_average
FROM dd_pledge, dd_project
WHERE dd_pledge.idproj = dd_project.idproj
AND dd_project.idproj = &proj_id
GROUP BY dd_project.idproj, projname;

DBMS_OUTPUT.PUT_LINE(
'Project ID: ' || proj_id ||
' Project Name: ' || proj_name ||
' Total Pledges Made: ' || pledge_count ||
' Total Dollars Pledged: ' || pledge_sum ||
' Average Dollars Pledges: ' || pledge_average);

END;

--Assignment 3-11: Retrieving and Displaying Pledge Data
--Create a PL/SQL block to retrieve and display data for all pledges made in a specified month.
--One row of output should be displayed for each pledge. Include the following in each row of output:
--• Pledge ID, donor ID, and pledge amount
--• If the pledge is being paid in a lump sum, display “Lump Sum.”
--• If the pledge is being paid in monthly payments, display “Monthly - #” (with the #representing the number 
--of months for payment).
--• The list should be sorted to display all lump sum pledges first.

SELECT * FROM dd_pledge;

--Answer for Q.3-11

SET SERVEROUTPUT ON;

DECLARE

pledges             dd_pledge%rowtype;
start_month_date    dd_pledge.pledgedate%type := '01-OCT-12';
end_month_date      dd_pledge.pledgedate%type := '31-OCT-12';

BEGIN

FOR pledges IN(
SELECT idpledge, iddonor, pledgeamt,
CASE
WHEN paymonths = 0 THEN 'Lump Sum.'
ELSE 'Monthly - ' || paymonths
END AS monthly_payment
FROM dd_pledge
WHERE pledgedate >= start_month_date AND pledgedate <= end_month_date
ORDER BY paymonths)

LOOP
DBMS_OUTPUT.PUT_LINE(
'Pledge ID: ' || pledges.idpledge ||
', Donor ID: ' || pledges.iddonor ||
', Pledge Amount: ' || TO_CHAR(pledges.pledgeamt, '$9999.99') ||
', Monthly Payments: ' || pledges.monthly_payment);
END LOOP;

END;

--Assignment 3-12: Retrieving a Specific Pledge
--Create a PL/SQL block to retrieve and display information for a specific pledge.
--Display the pledge ID, donor ID, pledge amount, total paid so far, and the difference between the pledged
--amount and total paid amount.

SELECT * FROM dd_pledge;

--Answer for Q.3-12

SET SERVEROUTPUT ON;

DECLARE

pledges                 dd_pledge%rowtype;
total_pledge_to_pay     dd_pledge.pledgeamt%type;
balance                 dd_pledge.pledgeamt%type;
months_paid             NUMBER(5);

BEGIN

SELECT *
INTO pledges
FROM dd_pledge
WHERE idpledge = &pledge_id;

months_paid := pledges.paymonths;

IF pledges.paymonths = 0 THEN total_pledge_to_pay := pledges.pledgeamt;
ELSE total_pledge_to_pay := months_paid * (pledges.pledgeamt/pledges.paymonths);
END IF;

balance := pledges.pledgeamt - total_pledge_to_pay;

DBMS_OUTPUT.PUT_LINE(
'Pledge ID: ' || pledges.idpledge ||
', Donor ID: ' || pledges.iddonor ||
', Amount Paid: ' || total_pledge_to_pay || '' ||
', Balance: ' || balance);

END;

--Assignment 3-13: Modifying Data
--Create a PL/SQL block to modify the fundraising goal amount for a specific project.
--In addition, display the following information for the project being modified: 
--project name, start date, previous fundraising goal amount, and new fundraising goal amount.

SELECT * FROM dd_project;

--Answer for Q.3-13

SET SERVEROUTPUT ON;

DECLARE

project_name            dd_project.projname%type;
date_start              dd_project.projstartdate%type;
fundraising_goal        dd_project.projfundgoal%type;
project_id              dd_project.idproj%type := '502';
new_fundraising_goal    dd_project.projfundgoal%type := '250000';

BEGIN

SELECT projname, projstartdate, projfundgoal
INTO project_name, date_start, fundraising_goal
FROM dd_project
WHERE idproj = project_id;

UPDATE dd_project
SET projfundgoal = new_fundraising_goal;

DBMS_OUTPUT.PUT_LINE(
'Project Name: ' || project_name ||
', Start DAte: ' || date_start ||
', Previous Goal: ' || fundraising_goal ||
', New Goal: ' || new_fundraising_goal);

END;