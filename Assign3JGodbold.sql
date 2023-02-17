--Jayden Godbold
--CSC 355 Section 631
--Assignment 3
--April 20, 2022

--Example1

SELECT CID, Artist, YearReleased 
	FROM CD	
	WHERE Artist = 'Alice Stein' AND YearReleased >= 2017
	ORDER BY YearReleased;
	
--EXAMPLE 2

SELECT Name
	FROM CDSTORE
	WHERE Name LIKE 'CD%'
	ORDER BY Name ASC;
	
--EXAMPLE 3

SELECT COUNT(CID), YearReleased
	FROM CD
	GROUP BY YearReleased
	ORDER BY YearReleased;
	
--EXAMPLE 4

SELECT Artist, AVG(Price)
	FROM CD
	GROUP BY Artist
	ORDER BY AVG(Price);
	
--EXAMPLE 5

SELECT StoreID, SUM(Quantity)
	FROM CDORDER
	GROUP BY StoreID
	ORDER BY SUM(Quantity);
	
--Example 6

SELECT StoreID, OrderDate, CDSTORE.Name, CDSTORE.SID
	FROM CDORDER INNER JOIN CDSTORE ON StoreID = CDSTORE.SID
	WHERE OrderDate like '%APR%';
	
--Example 7

SELECT Name, State, CD.Title
	FROM CDSTORE 
	JOIN CDORDER ON SID = CDORDER.StoreID
	JOIN CD ON SID = CDORDER.StoreID
    WHERE cdstore.state LIKE 'NY'
    ORDER BY Name ASC;
	
--EXAMPLE 8

SELECT Title, CDORDER.Quantity
	FROM CD
	INNER JOIN CDORDER ON CID = CDORDER.CDID
	ORDER BY CDORDER.Quantity DESC;