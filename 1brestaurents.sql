CREATE TABLE RESTAURENTS(
    Name varchar(50),
    Address varchar(50),
    id int(10),
    cusine varchar(50),
    nearby_landmark varchar(50),
    online_delivery varchar(5),
    famous dish varchar(50)
);
INSERT INTO RESTAURENTS VALUES('Dominos pizza','sqare complex,new bel road,sanjaynagar,560094',111,'Italian','near petrol bunk','Y','Pizza'),
                              ('pizza hut','indra complex,bel road,srirampura,560025',222,'Italian','near police station','Y','Pizza'),
                              ('Mc dolnalds','mantri complex,sampige road,okalipura,560023',333,'American','near fire bunk','Y','Burger'),
                              ('La planio pizza','kranti complex,mallige road,ashwatnagar,560091',444,'Italian','near mennakshi mall','Y','Pizza'),
                              ('Truffles','kateera complex,gobi road,kormangla,560058',555,'Italian','near police station','Y','Pasta'),
                              ('Punjabi dhaba','rectangle complex,new jail road,gayatrinagar,560001',666,'North Indian','near petrol bunk','Y','Thali'),
                              ('Shanthi sagar','rhombus complex,mg road,ganaganagar,560084',777,'North Indian','near police station','Y','Thali'),
                              ('Udupi veg','triangle complex,church road,kaverinagar,560074',888,'South indian','near fire bunk','Y','Dose'),
                              ('Karavali hotel','straight complex,mosque road,kalyannagar,560069',999,'Costal food','near mall','Y','Fish'),
                              ('kadamba veg','reverse complex,new small road,indranagar,560092',101,'south indian','near bunk','Y','Poori');

SELECT Name,Address FROM RESTAURENTS WHERE cusine='Italian';
SELECT Name,Address,nearby_landmark FROM RESTAURENTS WHERE cusine='North Indian';