-- Creating the tables
CREATE TABLE SUPPLIER (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE PART (
    PID INT PRIMARY KEY,
    Pname VARCHAR(255),
    Color VARCHAR(255)
);

CREATE TABLE SHIPMENT (
    Sid INT,
    PID INT,
    Cost INT,
    PRIMARY KEY (Sid, PID),
    FOREIGN KEY (Sid) REFERENCES SUPPLIER(Sid),
    FOREIGN KEY (PID) REFERENCES PART(PID)
);

-- Inserting data into the tables
INSERT INTO SUPPLIER VALUES (1, 'Supplier1', 'Address1'), (2, 'Supplier2', 'Address2'), (3, 'Supplier3', 'Address3'), (4, 'Supplier4', 'Address4'), (5, 'Supplier5', 'Address5');
INSERT INTO PART VALUES (6, 'Part1', 'Green'), (7, 'Part2', 'Blue'), (8, 'Part3', 'Red'), (9, 'Part4', 'Yellow'), (10, 'Part5', 'Green');
INSERT INTO SHIPMENT VALUES (1, 6, 100), (2, 7, 200), (3, 8, 300), (4, 9, 400), (5,10, 500);

-- Queries
-- i. Find the Sid’s of suppliers who supply a green part
SELECT Sid FROM SHIPMENT JOIN PART ON SHIPMENT.PID = PART.PID WHERE Color = 'Green';

-- ii. For every supplier print the name of the supplier and the total number of parts that he/she supplies
SELECT Sname, COUNT(*) as TotalParts FROM SUPPLIER JOIN SHIPMENT ON SUPPLIER.Sid = SHIPMENT.Sid GROUP BY Sname;

-- iii. Update the part color supplied by supplier s3 to yellow
UPDATE PART SET Color = 'Yellow' WHERE PID IN (SELECT PID FROM SHIPMENT WHERE Sid = (SELECT Sid FROM SUPPLIER WHERE Sname = 'Supplier3'));
