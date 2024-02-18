
CREATE TABLE AIRCRAFT (
    Aircraft_ID INT PRIMARY KEY,
    Aircraft_name VARCHAR(255),
    Cruising_range INT
);

CREATE TABLE EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Ename VARCHAR(255),
    Salary INT
);

CREATE TABLE CERTIFIED (
    Emp_ID INT,
    Aircraft_ID INT,
    PRIMARY KEY (Emp_ID, Aircraft_ID),
    FOREIGN KEY (Emp_ID) REFERENCES EMPLOYEE(Emp_ID),
    FOREIGN KEY (Aircraft_ID) REFERENCES AIRCRAFT(Aircraft_ID)
);


INSERT INTO AIRCRAFT VALUES (1, 'Boeing 747', 8000), (2, 'Airbus A380', 15000), (3, 'Boeing 777', 12000), (4, 'Airbus A320', 6000), (5, 'Boeing 737', 7000);
INSERT INTO EMPLOYEE VALUES (6, 'John', 60000), (7, 'Emma', 80000), (8, 'Robert', 70000), (9, 'Olivia', 90000), (10, 'Michael', 50000);
INSERT INTO CERTIFIED VALUES (1, 6), (2, 7), (3, 8), (4, 9), (1, 10);


SELECT Ename FROM EMPLOYEE WHERE Emp_ID IN (SELECT Emp_ID FROM CERTIFIED WHERE Aircraft_ID IN (SELECT Aircraft_ID FROM AIRCRAFT WHERE Aircraft_name LIKE 'Boeing%'));


SELECT * FROM AIRCRAFT ORDER BY Cruising_range ASC;

select distinct(Ename) from EMPLOYEE E,CERTIFIED C, AIRCRAFT A where A.cruising_range > 3000 and C.Aircraft_ID
NOT in(select Aircraft_ID from AIRCRAFT A where A.Aircraft_name='Boeing') and E.Emp_Id = C.Aircraft_ID;