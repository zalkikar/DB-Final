INSERT INTO Product
	( LineOfBusiness, GovtAgency, PSGName, PPGName, SeriesName, PlanName )
VALUES
    ( 11, "DOT", "aa", "ab", "ac", "life insurance" ),
    ( 12, "DOT", "aa", "ab", "ac", "life insurance" );


INSERT INTO Customer
	( CustSSN, CustFirstName, CustLastName, CustMiddleInitial, CustSuffix, CustDOB, Gender, CustSalutation, CustAlias, CustAliasSalutation )
VALUES
    ( 123456789, "Mitch", "Dolby", "B", "4th", 1313546014, "M", "Mr.", "Mitch", "Mr.Mitch" ),
    ( 123456788, "Emma", "Dolby", "R", "2nd", 907379614, "F", "Ms.", "Emma", "Ms.Emma" );


INSERT INTO Account
	( AccountID, AccountName, StartDate )
VALUES
    ( 101, "Account 1", 111111119),
    ( 102, "Account 2", 111111119);


INSERT INTO CUSTOMER_MEMBER_ACCOUNT
	( CustSSN, AccountID, [Type] )
VALUES
    ( 123456788, 101, "BILLING" ),
    ( 123456789, 101, "BILLING" ),
    ( 123456789, 102, "NONBILLING" );


INSERT INTO GenericModelIns
    ( CustSSN, Age, Gender, [Weight], Height, City, Country, SmokingHabits, CancerHistory, CardiovascularHistory, DrinkingHabits, ActivityHabits )
VALUES
    ( 123456788, NULL, NULL, 145, 69, NULL, NULL, 1, 1, 1, NULL, NULL ),
    ( 123456789, NULL, NULL, 120, 66, NULL, NULL, 1, 0, 0, NULL, NULL );


/* DERIVING GENERIC MODEL INS FROM OTHER DATA ALREADY PRESENT IN CUSTOMER TABLE */

/* sqlite supports subqueries instead of joins for update statement */
UPDATE GenericModelIns
SET  Gender = CASE WHEN cust.gend= 'M' THEN 1 ELSE 0 END
FROM (SELECT Gender AS gend, CustSSN FROM Customer) AS cust
WHERE GenericModelIns.CustSSN =cust.CustSSN;

/* sqlite supports subqueries instead of joins for update statement */
/* The time in years is equal to the seconds divided by 31,556,952 */
UPDATE GenericModelIns
SEt Age = (strftime('%s','now') - cust.bd)/31556952
FROM (SELECT CustDOB AS bd, CustSSN FROM Customer ) AS cust
WHERE GenericModelIns.CustSSN =cust.CustSSN;