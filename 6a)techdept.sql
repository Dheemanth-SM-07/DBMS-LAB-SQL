
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    SSN INT PRIMARY KEY,
    Addrs VARCHAR(255),
    Sex CHAR(1),
    Salary INT,
    SuperSSN INT,
    Dno INT
);

CREATE TABLE DEPARTMENT (
    Dname VARCHAR(255),
    Dnumber INT PRIMARY KEY,
    MgrSSN INT,
    MgrStartDate DATE,
    FOREIGN KEY (MgrSSN) REFERENCES EMPLOYEE(SSN)
);

CREATE TABLE DEPENDENT (
    Dname VARCHAR(255),
    ESSN INT,
    PRIMARY KEY (Dname, ESSN),
    FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN)
);


INSERT INTO EMPLOYEE VALUES ('John', 'Doe', 123, 'Address1', 'M', 60000, NULL, 1), ('Jane', 'Doe', 456, 'Address2', 'F', 80000, 123, 1), ('Robert', 'Smith', 789, 'Address3', 'M', 70000, 123, 2), ('Olivia', 'Johnson', 321, 'Address4', 'F', 90000, 123, 2), ('Michael', 'Williams', 654, 'Address5', 'M', 50000, 456, 3);
INSERT INTO DEPARTMENT VALUES ('Department1', 1, 123, '2024-01-01'), ('Department2', 2, 456, '2024-01-02'), ('Department3', 3, 789, '2024-01-03'), ('Tech Department4', 4, 321, '2024-01-04'), ('Tech Department5', 5, 654, '2024-01-05');
INSERT INTO DEPENDENT VALUES ('Dependent1', 123), ('Dependent2', 456), ('Dependent3', 789), ('Dependent4', 321), ('Dependent5', 654);


SELECT Dname, AVG(Salary) as AvgSalary FROM DEPARTMENT JOIN EMPLOYEE ON DEPARTMENT.Dnumber = EMPLOYEE.Dno GROUP BY Dname;

SELECT Fname, Lname FROM EMPLOYEE WHERE SSN IN (SELECT MgrSSN FROM DEPARTMENT WHERE MgrSSN IN (SELECT ESSN FROM DEPENDENT));

SELECT * FROM DEPARTMENT WHERE Dname LIKE '%tech%';
