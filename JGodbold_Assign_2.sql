/*
Jayden Godbold
CSC 355-602T631
Assignment 2
April 7, 2022
*/

DROP TABLE SHIPMENT;
DROP TABLE DRIVER;
DROP TABLE ROUTE;





CREATE TABLE DRIVER
(
DID			CHAR(3),
Name		VARCHAR(20),
City		VARCHAR(20),
Hours		NUMBER(2,0)
				CHECK(1 <= Hours AND Hours <= 99),

CONSTRAINT PK_DRIVER
		PRIMARY KEY (DID)
);
INSERT INTO DRIVER VALUES ('123','Jayden Godbold','Chicago','20');
INSERT INTO DRIVER VALUES ('111','Eric Schwabe','Denver','40');
INSERT INTO DRIVER VALUES ('222','Prof Joe','Toronto','82');
INSERT INTO DRIVER VALUES ('333','Amber Settle','Atlanta','99');






CREATE TABLE ROUTE
(
RID			CHAR(6),
Region		VARCHAR(20),

CONSTRAINT PK_ROUTE
		PRIMARY KEY (RID)
);
INSERT INTO ROUTE VALUES ('123456','North America');
INSERT INTO ROUTE VALUES ('141414','South America');
INSERT INTO ROUTE VALUES ('202020','Europe');





CREATE TABLE SHIPMENT
(
DriverID	CHAR(3),
RouteID		CHAR(6),
ShipDate	DATE,	

CONSTRAINT PK_SHIPMENT
		PRIMARY KEY (DriverID,RouteID),
		
CONSTRAINT FK_SHIPMENTDID
		FOREIGN KEY (DriverID)
			REFERENCES DRIVER(DID),
		
CONSTRAINT FK_SHIPMENTRID
		FOREIGN KEY (RouteID)
			REFERENCES ROUTE(RID)
);
INSERT INTO SHIPMENT VALUES ('333','123456',DATE '2021-01-01');
INSERT INTO SHIPMENT VALUES ('333','141414',DATE '2021-01-02');
INSERT INTO SHIPMENT VALUES ('333','202020',DATE '2021-01-03');
INSERT INTO SHIPMENT VALUES ('222','123456',DATE '2021-01-01');
INSERT INTO SHIPMENT VALUES ('111','141414',DATE '2021-01-01');
INSERT INTO SHIPMENT VALUES ('123','202020',DATE '2021-01-01');


SELECT * FROM DRIVER;
SELECT * FROM ROUTE;
SELECT * FROM SHIPMENT;
COMMIT;