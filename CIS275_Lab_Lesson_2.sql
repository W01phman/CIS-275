/********************************************************************************************
CIS275 at PCC
CIS275 Lab Week 2: using SQL SERVER and different databases
Let your instructor know about any issues you may find in the instructions
*******************************************************************************************

                                   CERTIFICATION:

   By typing my name below I certify that the enclosed is original coding written by myself
without unauthorized assistance, such as seeing answers to  versions of specific 
questions or using AI to get answers. I agree to abide by class restrictions and understand 
that if I have violated them, I may receive reduced credit (or none) for this assignment.

                CONSENT:   [Jaron Wolph]
                DATE:      [4/19/26]

*******************************************************************************************
*/
--(I did a bit of minor editing because of apostrophes which were part of the results):
--Very important: Make sure the name of the database is on the top of each query even if 
--  they all use the same database.

GO
PRINT '|---' + REPLICATE('+----',15) + '|'
PRINT 'Read the questions below and insert your queries where prompted. 
For the entire term, your results should match the samples shown, though DO NOT force it by 
  using the sample data in your queries since your queries must work when new data is added or changed.  
For example, if the sample shows results only for CustID 100, do not use WHERE CustID = 100.
  
When you are finished, you should be able to run the file as a script to execute all answers
  sequentially (without errors!).' + CHAR(10)
PRINT 'Queries should be well-formatted. SQL is not case-sensitive, but it is good form to
  capitalize keywords and to capitalize table names as they appear in the database; you should
  also put each projected column on its own line and use indentation for neatness. Example:

   SELECT Name,
          CustomerID AS "Customer ID"  -- Always use double quotes for aliases
   FROM   CUSTOMER
   WHERE  CustomerID < 106;            -- All SQL stetments should end with a semicolon

Whatever format you choose for your queries, make sure that it is readable and consistent.

Place the name of the database on the top of each query. 
Format all queries with the column names in the sample.

There are several ways to solve many problems. 
  Unless specified to use a particular one, pick one that works for you.

Be sure to remove the double-dash comment indicator when you insert your code!';
PRINT '|---' + REPLICATE('+----',15) + '|' + CHAR(10) + CHAR(10)
GO

PRINT 'CIS 275, Lab Week 2, Question 1  [3 pts possible]:
What are the order numbers?
---------------------
Create a query that returns all order numbers that have an order amount
     between $1000 and $1700.
You will be using the Invoices table. 
The name of the database is AP. 
You need to use the following:
- WHERE 
- AND
- BETWEEN 
Display only the VendorID and InvoiceTotal columns.
Hint: correct results will look like this.

VendorID    InvoiceTotal
----------- ---------------------
107         1600.00
83          1575.00
34          1083.58
103         1367.50
121         1000.46
' + CHAR(10)

GO

--
-- [Insert your code here]
USE AP;

Select VendorID, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal BETWEEN 1000 AND 1700;
--


GO

PRINT 'CIS 275, Lab Week 2, Question 2  [3 pts possible]:
Write a SELECT statement that finds all vendors whose state name starts with N. 
You will be using the Vendors table. The name of the database is AP.
You need to use the following:
   - WHERE 
   - LIKE
   - Wildcard

Display Vendor''s Name and Vendor''s State.
This time, use CONVERT to make the name 20 characters wide and state 5 characters wide. 
Note that some characters of the name will be chopped off.
Use AS to rename the columns. Always use double quotes with AS to make your code portable.
Display results in ascending order by VendorName.
You should get 10 records.

Hint: Correct results will look like this:

Vendor Name          State
-------------------- -----
American Booksellers NY
Baker & Taylor Books NC
Cahners Publishing C NV
Newbrige Book Clubs  NJ
Rich Advertising     NJ
RR Bowker            NJ
Simon Direct Inc     NJ
The Mailers Guide Co NY
United Parcel Servic NV
Venture Communicatio NY
' + CHAR(10)

GO

--
-- [Insert your code here]
USE AP;

SELECT
    CONVERT(VARCHAR(20), VendorName) AS "Vendor Name",
    CONVERT(VARCHAR(5), VendorState) AS "Vendor State"
FROM Vendors
WHERE VendorState LIKE 'N%'
ORDER BY 1 ASC;
--


GO

PRINT 'CIS 275, Lab Week 2, Question 3  [3 pts possible]:
Excluding Vendors?
--------------------
Produce a list of distinct Vendors with the following specifications:
- Inlcude only vendors that end with ''Inc''
- Ignore all vendors who reside in Massachusettes or Florida
- Sort the result in alphabetical order by Vendor name
- Use LIKE operator
- Use DISTINCT keyword
You will be using Vendors table, which is within the AP database.
Display Vendor name, Vendor Default Account Number, Vendor ID, and Vendor State 
   with the vendor name no more than 30 characters wide and the others 18. 
Make sure all your columns are named as shown below.
Hint: Correct results will have 11 rows and will look like this:

Vendor Name                    Default Account #  Vendor ID        Vendor State
------------------------------ ------------------ ---------------- ------------------
Bertelsmann Industry Svcs. Inc 400                99               CA
Bill Marvin Electric Inc       523                11               CA
Boucher Communications Inc     540                84               PA
Enterprise Communications Inc  536                31               VA
Evans Executone Inc            522                89               CA
Expedata Inc                   589                14               CA
Fresno Rack & Shelving Inc     523                58               CA
Malloy Lithographing Inc       400                110              MI
Roadway Package System, Inc    553                115              CA
Simon Direct Inc               540                76               NJ
Yesmed, Inc                    589                119              CA   
' + CHAR(10)

GO

--
-- [Insert your code here]
USE AP;

SELECT DISTINCT
    CONVERT( VARCHAR(30), VendorName) "Vendor Name",
    CONVERT(VARCHAR(18), DefaultTermsID) "Default Account #",
    CONVERT(VARCHAR(18), VendorID) "Vendor ID",
    CONVERT(VARCHAR(18), VendorState) "Vendor State"
FROM Vendors
WHERE VendorName LIKE '%Inc'
    AND VendorState NOT IN ('FL', 'MA')
ORDER BY 1 ASC;

GO


GO

PRINT 'CIS 275, Lab Week 2, Question 4  [3 pts possible]:
The favorite States?
--------------------
Find the last names of customers who reside in the following states:
OR
WA
Your query should include:
- Using IN and LIKE operators
- Only list customers whose zipcode contains the number 2 in it
- Give all columns relevant names
- The result should be ordered in ASC by the customer name
- USE Customers table from the Examples database

Produce the following columns: Customer Last Name, Customer States, and Customer Zip Codes.

Hint: Correct results will have 4 rows and will look like this:
Customer Last Name State Zip Code
------------------ ----- ----------
Jablonski          WA    98128
Latimer            OR    97827
Steel              WA    99362
Wilson             OR    97219
' + CHAR(10)

GO

--
-- [Insert your code here]
USE Examples;

SELECT
    CustomerLast AS "Customer Last Name",
    CustState AS "State",
    CustZip AS "Zip Code"
FROM Customers
Where CustState IN ('OR', 'WA')
    AND CustZip Like '%2%'
Order By CustomerLast ASC;

/*SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Vendors';
--
 */
GO


GO

PRINT 'CIS 275, Lab Week 2, Question 5  [3 pts possible]:
PO BOX Address2
----------------
Write a query to find all Vendors who have P.O. Boxes in address2. 
Here are the conditions:
- You must use Like and OR Operators
- Some P.O. Box addresses do not include a period so be sure to include them also
- The Vendors table within the Examples database will be used
- There are 9 records
- Do not forget to rename columns
- The output should look like the following (note the spacing and sort)

P.O. Box Address     Vendor Name
-------------------- ----------------------------------------
PO Box 944230        Bill Jones
PO Box 61000         Computerworld
P.O. Box 1952        Fresno Photoengraving Company
PO Box 61000         Kent H Landsberg Co
PO Box 1124          Malloy Lithographing Inc
PO Box 205           Open Horizons Publishing
PO Box 826276        State of California
PO Box 7005          US Postal Service
P.O. Box 29479       Wells Fargo Bank
' + CHAR(10)

GO

--
-- [Insert your code here]
USE Examples;

Select
    VendorAddress2 AS "Address 2",
    VendorName AS "Vendor Name"
From Vendors
Where VendorAddress2 Like 'PO Box%'
    Or VendorAddress2 Like 'P.O. Box%'
Order By VendorName Desc
--
GO


PRINT 'CIS 275, Lab Week 2, Question 6  [3 pts possible]:
--Returns
---------
It is very normal that some vendors return the items they have purchased. 
The management wants to know which vendors have returned items they purchased.
Make sure you consider the following:
-Use the vendors table from the Examples database
-Format Vendor ID 9 characters wide, Vendor Name 20 characters, and Returns 10 characters.
-Add a dollar sign to the dollar values. Use any of the methods mentioned in Lecture 2, Sample Code. 
-As always, since you do not know the results before you write your code, do not use 
   any of the values (98, American Express, $556.19) in your code.
-Correct results will have 1 row and will look like this:

Vendor ID Vendor Name          Return Amount
--------- -------------------- -------------
98        American Express     $556.19
' + CHAR(10)
GO

--
-- [Insert your code here]
USE Examples;

Select
    Convert(VARCHAR(9), VendorID) "Vendor ID",
    Convert(VARCHAR(20), VendorName) "Vendor Name",
    '$' + Convert(VARCHAR(10), YTDReturns) "Returns"
From Vendors v
Where YTDReturns > 0;


	

--
GO


GO

PRINT 'CIS 275, Lab Week 2, Question 7  [3 pts possible]:
Purchase ranges?
---------------
The management wants to see a list of vendors whose YTDPurchase is between 1000 and 3000 
and have made the purchases between 2015-02-01 and 2015-10-31.
-
Consider the following:
-Use the Vendors table from the Examples database
-Display results ordered by VendorName
-Show ONLY the Vendor Name, Transaction Date, and Purchases
-Use CAST or CONVERT to format columns
-Add a dollar sign to the YTDPurchase
-Make sure all columns have appropriate names (using AS where needed)
-Order result by vendors''name in ASC order
-Correct results will have 8 rows, and should look like this:

Vendor Name							Transaction date                        YTD Purchases
----------------------------------- --------------------------------------- -------------
Cardinal Business Media, Inc.		2015-10-23 00:00:00						$2905.00
Frank E Wilber Co					2015-09-12 00:00:00						$1934.70
Fresno Credit Bureau				2015-09-12 00:00:00						$2663.26
Retirement Plan Consultants			2015-10-09 00:00:00						$1660.00
Springhouse Corp					2015-07-29 00:00:00						$1942.25
State Board Of Equalization			2015-10-09 00:00:00						$2433.00
The Presort Center					2015-10-09 00:00:00						$2377.43
The Windows Deck					2015-07-29 00:00:00						$2975.00 
' + CHAR(10)

GO

--
-- [Insert your code here]
USE Examples;

Select
    VendorName AS "Vendor Name",
    Cast(LastTranDate AS DATETIME) AS "Transaction Date",
    '$' + Convert(VARCHAR(10), YTDPurchases) AS "YTD Purchases"
From Vendors
Where YTDPurchases Between 1000 And 3000
    And LastTranDate Between '2015-02-01' And '2015-10-31'
Order By VendorName Asc;




--
GO


GO

PRINT 'CIS 275, Lab Week 2, Question 8  [3 pts possible]:
No Purchase Report
--------------
The management would like to have a report to show the names of vendors who have not purchased anything.
-Consider the following:
-Use Vendors table from the Examples database
-Insert a $ sign using FORMAT or other methods
-The result will have 28 rows
-Format columns with proper spacing and column names

Correct results will look like this:

Vendor Name                         Year To Date Purchases            
----------------------------------- ----------------------
ASC Signs							$0.00
BFI Industries						$0.00
Bill Marvin Electric Inc			$0.00
Blanchard & Johnson Associates		$0.00
California Chamber Of Commerce		$0.00
California Data Marketing			$0.00
...
Yale Industrial Trucks-Fresno		$0.00
Zee Medical Service Co				$0.00
' + CHAR(10)

GO

--
-- [Insert your code here]
USE Examples;

Select
    

--



GO


PRINT 'CIS 275, Lab Week 2, Question 9  [3 pts possible]:
10 buyers
------------------------
Produce a list of the vendors who have made the top 10 purchases.  
-Consider the following:
-Use vendors table from the Examples database
-Exclude NULL and Zero values and limit columns to no more than 20 characters wide.
-Order output YTDPurchases in DESC order
-Insert a $ sign 
-The result will have 10 rows
-Format your results to look like this:

Purchases Year To Date Vendor
---------------------- --------------------
$213,039.65            Malloy Lithographing
$93,601.99             United Parcel Servic
$48,690.51             Yesmed, Inc
$44,995.75             Valprint
$39,420.56             Bertelsmann Industry
$30,486.44             Zylka Design
$29,742.98             Federal Express Corp
$29,522.50             Dean Witter Reynolds
$28,740.10             American Express
$27,462.56             Courier Companies, I
' + CHAR(10)

GO

--
-- [Insert your code here]



--
GO


GO

PRINT 'CIS 275, Lab Week 2, Question 10  [3 pts possible]:
Names that sound like Mary
-----------------
The metaphone for "Mary" is "MR". Find all other names that have the same metaphone.
-Consider the following:
-The database name is NAMES
-Format the columns with proper names and widths
-Order the results in name sequence
-There are 148 rows

Name            Metaphone
--------------- ---------
Maari           MR
Maaria          MR
Mahra           MR
Mahri           MR
Mahria          MR
Mahriah         MR
...
Mary            MR
Mauer           MR
...
' + CHAR(10)

GO

--
-- [Insert your code here]


--
GO



GO
-------------------------------------------------------------------------------------
-- This is an anonymous program block. DO NOT CHANGE OR DELETE.
-------------------------------------------------------------------------------------
BEGIN
    PRINT '|---' + REPLICATE('+----',15) + '|';
    PRINT ' End of CIS275 Lab Week 2' + REPLICATE(' ',50) + CONVERT(CHAR(12),GETDATE(),101);
    PRINT '|---' + REPLICATE('+----',15) + '|';
END;


