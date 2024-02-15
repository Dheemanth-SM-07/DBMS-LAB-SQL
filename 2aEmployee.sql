CREATE TABLE EMPLOYEE(
    Fname varchar(50),
    Lname varchar(50),
    SSN INT(10) PRIMARY KEY,
    ADDRESS VARCHAR(50),
    sex varchar(5),
    Salary int(50),
    Superssn int(10),
    Dno int(50),
    FOREIGN KEY(Dno) REFERENCES DEPARTMENT(Dnumber)
);
CREATE TABLE DEPARTMENT(
    Dname varchar(50),
    Dnumber int(50) PRIMARY KEY,
    Mgrssn int(10),
    Mgrstartdate date,
    FOREIGN KEY(Mgrssn) REFERENCES EMPLOYEE(SSN)
);
CREATE TABLE PROJECT(
    Pno int(10) PRIMARY KEY,
    Pname varchar(50),
    Dnum int(50),
    FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(Dnumber)
);
CREATE TABLE WORKS_ON(
    ESSN int(10),
    Wpno int(10),
    HOURS INT(5),
    PRIMARY KEY(ESSN,Wpno),
    FOREIGN KEY(ESSN) REFERENCES EMPLOYEE(SSN),
    FOREIGN KEY(Wpno) REFERENCES PROJECT(Pno)
);
INSERT INTO EMPLOYEE VALUES(
    ('Sara','Jhon',1111,'bangalore','W',20000,1211,25),
    ('Smith','stewe',2222,'Chennai','M',30000,2122,35),
    ('Sony','sweety',3333,'Jaipur','W',40000,3233,45),
    ('Matt','Henry',4444,'Mumbai','M',50000,4344,55),
    ('Mary','Khan',5555,'Hyderabad','W',60000,5455,65)
);
INSERT INTO DEPARTMENT VALUES(
    ('CSE',25,1111,2008-11-11),
    ('ISE',35,2222,2009-12-12),
    ('CSE(AIML)',45,3333,2010-09-13),
    ('CSE(CY)',55,4444,2011-08-08),
    ('AIDS',65,5555,2012-10-10)
);
INSERT INTO PROJECT VALUES(
    (2589,'Cloud Computing',25),
    (9852,'Deep learning',35),
    (7852,'Artificial intelligence',45),
    (2587,'Full stack',55),
    (3698,'Ethcial Hacking',65)
);
INSERT INTO WORKS_ON(
    (1111,2589,1),
    (2222,9852,2),
    (3333,7852,3),
    (4444,2587,4),
    (5555,3698,5)
);

SELECT Fname,Lname FROM EMPLOYEE WHERE Salary >all(SELECT Salary FROM EMPLOYEE WHERE Dno=35);

SELECT DISTINCT ESSN FROM WORKS_ON WHERE Wpno IN (2589,9852,7852);

SELECT Wpno,SUM(HOURS) FROM WORKS_ON GROUP BY Wpno;
