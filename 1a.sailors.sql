CREATE TABLE SAILORS (
    Sid INT(50) PRIMARY KEY,
    Sname VARCHAR(50),
    Rating INT(50),
    Age INT(5)
);
CREATE TABLE BOATS(
    Bid INT(50) PRIMARY KEY,
    Bname VARCHAR(50),
    Colour VARCHAR(50)
);
CREATE TABLE RESERVES(
    Rsid int(50),
    Rbid int(50),
    Day VARCHAR(10),
    FOREIGN KEY(Rsid) REFERENCES SAILORS(Sid),
    FOREIGN KEY(Rbid) REFERENCES BOATS(Bid)
);
INSERT INTO SAILORS VALUES(123,'christopher',5,23),
                          (321,'colombus',7,27),
                          (852,'vas',9,30),
                          (987,'differnece',6,31),
                          (147,'gallelio',8,35);
INSERT INTO BOATS VALUES(111,'BENKI','Green'),
                        (222,'GALI','Red'),
                        (333,'WATER','Yellow'),
                        (444,'AGNI','Purple'),
                        (555,'HILL','Blue');
INSERT INTO RESERVES VALUES(123,111,'monday'),
                           (321,222,'tuesday'),
                            (852,333,'wednesday'),
                            (987,444,'thursday'),
                            (147,555,'friday');

i)SELECT DISTINCT(Sname) FROM SAILORS,RESERVES WHERE Rsid=Sid;
ii)SELECT Rsid FROM BOATS,RESERVES WHERE Rbid=Bid and Colour='Red' or Colour='Green';
iii)SELECT Sid from SAILORS,RESERVES where Sid not in(select Rsid from RESERVES);

                        
