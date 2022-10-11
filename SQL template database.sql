/* Student name: Khalid Takar               
Student username: adck813           
*/

/* SECTION 1 CREATE TABLE STATEMENTS */

CREATE TABLE adck813Groups (
  `Group_ID`        varchar(10) NOT NULL, 
  `Group_Placement` int(10) NOT NULL,            
  `Group_points`    int(10) NOT NULL, 
  `Group_Letters`   char(10) NOT NULL, 
  PRIMARY KEY (`Group_ID`));

CREATE TABLE adck813Sponsorships (
  `PlayerSponsorID` int(10) NOT NULL, 
  `TeamSponsorID`   int(10) NOT NULL, 
  `budget`              varchar(255) NOT NULL, 
  `brand_exposure`    varchar(255) NOT NULL,       
  `brand_image`       varchar(255) NOT NULL,   
CONSTRAINT  
PRIMARY KEY (`PlayerSponsorID`, 
  `TeamSponsorID`));

CREATE TABLE adck813Teams(
  `TeamID`                       int(10) NOT NULL AUTO_INCREMENT, 
  `TeamName`                     varchar(50) NOT NULL, 
  `TeamPlacements`               varchar(255) NOT NULL, 
  `TopScorer`                    varchar(255) NOT NULL, 
  `TopAssister`                  varchar(255) NOT NULL, 
  `SquadSize`                    int(10) NOT NULL, 
  `ClubEarnings`                 varchar(255) NOT NULL, 
  `clubExposure`                 varchar(255) NOT NULL, 
  `PlayerSponsorID`  int(10) NOT NULL,
  `TeamSponsorID`    int(10) NOT NULL, 
PRIMARY KEY (`TeamID`,`TeamSponsorID`));


CREATE TABLE adck813Players (
  `PlayersID`                    int(10) NOT NULL AUTO_INCREMENT, 
  `BestPlayersName`                  varchar(255) NOT NULL, 
  `PlayersAge`                   int(10) NOT NULL, 
  `PlayersNationality`           varchar(10) NOT NULL, 
  `TeamID`                       int(10) NOT NULL, 
  `salary`                       varchar(255) NOT NULL,        
  `players_brand_image`          varchar(255) NOT NULL, 
  `PlayerSponsorID`  int(10) NOT NULL,
  `TeamSponsorID`    int(10) NOT NULL, 
PRIMARY KEY (`PlayersID`,`PlayerSponsorID`),
CONSTRAINT
FOREIGN KEY (`TeamID`) REFERENCES adck813Teams (`TeamID`));


CREATE TABLE adck813Fitness (
  `PatientID`         int(10) NOT NULL, 
  `injury_description` varchar(255) NOT NULL,     
  `injury_timeline`    varchar(255) NOT NULL, 
  `PlayersID`         int(10) NOT NULL, 
PRIMARY KEY (`PatientID`, 
  `PlayersID`),
FOREIGN KEY (`PlayersID`) REFERENCES adck813Players (`PlayersID`));

CREATE TABLE adck813Player_stats (
  `Goals`          int(10) NOT NULL, 
  `Assists`        int(10) NOT NULL, 
  `xG`             varchar(255) NOT NULL, 
  `xA`             varchar(255) NOT NULL, 
  `Appearances`    int(10) NOT NULL, 
  `CleanSheets` int(10) NOT NULL, 
  `PlayersID`   int(10) NOT NULL, 
PRIMARY KEY (`PlayersID`),
FOREIGN KEY (`PlayersID`) REFERENCES adck813Players (`PlayersID`));

CREATE TABLE adck813Stadiums (
  `Stadium_Name` char(50) NOT NULL, 
   Location      char(50) NOT NULL,                
   City          char(50) NOT NULL,
   Capacity      int(10) NOT NULL, 
  `TeamID`      int(10) NOT NULL, 
  `Team_Name`    char(50) NOT NULL,
CONSTRAINT
PRIMARY KEY (`Stadium_Name`,`TeamID`),
FOREIGN KEY (`TeamID`) REFERENCES adck813Teams (`TeamID`));

CREATE TABLE adck813Team_Groups (
  `Group_ID` varchar(10) NOT NULL, 
  `TeamID`  int(10) NOT NULL, 
PRIMARY KEY (`Group_ID`, `TeamID`),
CONSTRAINT
FOREIGN KEY (`Group_ID`) REFERENCES adck813Groups (`Group_ID`),
FOREIGN KEY (`TeamID`) REFERENCES adck813Teams (`TeamID`));

/* SECTION 2 INSERT STATEMENTS */

insert into adck813Groups values ('A01',1,16,'A'),
                                 ('A02',2,9,'A'),
                                 ('A03',3,4,'A'),
                                 ('A04',4,3,'A'),
                                 ('B01',1,10,'B'),
                                 ('B02',2,8,'B'),
                                 ('B03',3,8,'B'),
                                 ('B04',4,6,'B'),
                                 ('C01',1,16,'C'),
                                 ('C02',2,13,'C'),
                                 ('C03',3,3,'C'),
                                 ('C04',4,3,'C'),
                                 ('D01',1,13,'D'),
                                 ('D02',2,11,'D'),
                                 ('D03',3,7,'D'),
                                 ('D04',4,2,'D'),
                                 ('E01',1,14,'E'),
                                 ('E02',2,13,'E'),
                                 ('E03',3,5,'E'),
                                 ('E04',4,1,'E'),
                                 ('F01',1,13,'F'),
                                 ('F02',2,10,'F'),
                                 ('F03',3,8,'F'),
                                 ('F04',4,1,'F'),
                                 ('G01',1,15,'G'),
                                 ('G02',2,15,'G'),
                                 ('G03',3,4,'G'),
                                 ('G04',4,1,'G'),
                                 ('H01',1,12,'H'),
                                 ('H02',2,12,'H'),
                                 ('H03',3,9,'H'),
                                 ('H04',4,3,'H');

insert into adck813Sponsorships values (01,03,'£30,000,000','exceeding expectations','solid'),
                          (02,04,'£13,000,000','below expectations','below average'),
                          (03,02,'£5,000,000','hurting brand image','beyond poor'),
                          (04,01,'£17,500,000','meeting expectations','average'),
                          (05,07,'£54,600,000','room to go global',' above solid'),
                          (06,05,'£100,000,000','surpassed industry norms','super-global'),
                          (07,06,'£25,500,000','slightly above predicted expectations','above average'),
                          (08,13,'£320,000,000','trending yearly,most talked about','known by all'),
                          (09,12,'£70,000,000','close to nearly breaking industry barrier','near super-global'),
                          (10,09,'£48,750,000','room to go global','above solid'),
                          (11,08,'£35,250,000','exceeding expectations','solid'),
                          (12,10,'£1,925,000','not contributing to the brand basically a subsidy','irrelevant'),
                          (13,11,'£7,650,000','hurting brand image','beyond poor'),
                          (14,15,'£20,000,000','meeting expectations','average'),
                          (15,14,'£230,000,000','aproaching known by all','beyond super-global');


insert into adck813Teams values (01,'Bayern Munich','semi-finals','Robert Lewandowski','Joshua Kimmich',30,'£3.3 bn','£250mil',01,01),
                                (02,'Atletico Madrid','Round of 16','Luis Suarez','Juan Felix',24,'£1.9 bn','£85 mil',02,02),     
                                (03,'Red Bull Salzburg','Transfer to Europa League','Patson Daka','Patson Daka',27,'£0.75 bn','£25 mil',03,03),
                                (04,'Lokomotiv Moscow','knocked out of Group','Éder','Grzegorz Krychowiak',24,'£0.5 bn','£15 mil',04,04),
                                (05,'Real Madrid','semi-finals','Karim Benzema','Luka Modric',29,'£4.1 bn','£350 mil',05,05),
                                (06,'Borussia Mönchengladbach','Round of 16','Éder','Grzegorz Krychowiak',23,'£0.5 bn','£15 mil',06,06),
                                (07,'Shakhtar Donetsk','Transfer to Europa League','Éder','Grzegorz Krychowiak',21,'£0.5 bn','£15 mil',07,07),
                                (08,'Inter Milan','Knocked out of Group','Romelu Lukaku','Lautaro Martínez',20,'£2.2 bn','£95 mil',08,08),
                                (09,'Manchester City','Finalist','Riyad Mahrez','Kevin De Bruyne',25,'£2.1 bn','£105 mil',09,09),
                                (10,'FC Porto','Quarter-Finals','Sérgio Oliveira','Jesús Corona',26,'£1.0 bn','£45 mil',10,10),
                                (11,'Olympiacos','Transfer to Europa League','Mady Camara','Mathieu Valbuena',22,'£0.6 bn','£20 mil',11,11),
                                (12,'Marseille','Knocked out of Group','Dimitri Payet','Florian Thauvin',27,'£0.8 bn','35 mil',12,12),
                                (13,'Liverpool','Quarter-Finals','Mohammed Salah','Trent Alexander-Arnold',24,'£3.0 bn','£225 mil',13,13),
                                (14,'Atalanta','Round of 16','Luis Muriel','Hans Hateboer',19,'£0.75 bn','£30 mil',14,14),
                                (15,'AFC Ajax','Transfer to Europa League','Dušan Tadic','Dušan Tadic',25,'£0.6 bn','£20 mil',15,15),
                                (16,'Midtjylland','Knocked out of Group','Alexander Scholz','Anders Dreyer',20,'£0.4 bn','£10 mil',16,16),
                                (17,'Chelsea','Winners','Olivier Giroud','Timo Werner',28,'£2.6 bn','£240 mil',17,17),
                                (18,'Sevilla','Round of 16','Youssef En-Nesyri','Ivan Rakitic',27,'£1.6bn','£65 mil',18,18),
                                (19,'Krasnodar','Transfer to Europa League','Marcus Berg','Tonny Vilhena',18,'£0.25 bn','£4 mil',19,19),
                                (20,'Rennes','Knocked out of Group','Serhou Guirassy','	Martin Terrier',19,'£0.30 bn','£7.5 mil',20,20),
                                (21,'Borussia Dortmund','Quarter-Finals','Erling Haaland','Jadon Sancho',26,'£2.2bn','£95 mil',21,21),
                                (22,'Lazio','Round of 16','Ciro Immobile','Joaquín Correa',24,'£1.1 bn','£50 mil',22,22),
                                (23,'Club Brugge','Transfer to Europa League','Hans Vanaken','Ruud Vormer',25,'£0.7 bn','£30 mil',23,23),
                                (24,'Zenit Saint Petersburg','Knocked out of Group','Sebastián Driussi','Artem Dzyuba',21,'£0.6 bn', '£20 mil',24,24),
                                (25,'Juventus','Round of 16','Alvaro Morata','Juan Cuadrado',24,'£2.7 bn','£150 mil',25,25),
                                (26,'Barcelona','Round of 16','Lionel Messi','Lionel Messi',23,'£3.4 bn','£200 mil',26,26),
                                (27,'Dynamo Kyiv','Transfer to Europa League','Viktor Tsygankov','Carlos de Pena',24,'£0.45 bn','£12.5 mil',27,27),
                                (28,'Ferencváros','Knocked out of Group','Franck Boli','Tokmac Nguen',23,'£0.25bn','£4 mil',28,28),
                                (29,'Paris Saint-Germain','Semi-Finals','Kylian Mbappé','Ángel Di María',27,'£2.9 bn','£250 mil',29,29),
                                (30,'RB Leipzig','Round of 16','José Angeliño','José Angeliño',26,'£1.4 bn','£75 mil',30,30),
                                (31,'Manchester United','Transfer to Europa League','Marcus Rashford','Paul Pogba',22,'£3.5 bn','£300 mil',31,31),
                                (32,'Istanbul Basaksehir','Knocked out of Group','Irfan Kahveci','Edin Višca',24,'£0.3bn','£20 mil',32,32);                                                         
                                 

insert into adck813Players values (01,'Robert Lewandowski',33,'Polish',01,'£280,000 p/w','Legend',01,01),
                                   (02,'Juan Felix',22,'Portugal',02,'£125,000 p/w','Rising-Star',02,02),
                                   (03,'Patson Daka',23,'Zambia',03,'£100,000 p/w','Hidden Gem',03,03),
                                   (04,'Guilherme',36,'Russia',04,'£45,000 p/w','For the history books',04,04),
                                   (05,'Karim Benzema',34,'France',05,'£230,000 p/w','Global',05,05),
                                   (06,'Marcus Thuram',24,'France',06,'£115,000 p/w','Rising-Star',06,06),   
                                   (07,'Andriy Pyatov',37,'Ukraine',07,'£35,000 p/w','For the history books',07,07), 
                                   (08,'Lautaro Martínez',24,'Argentina',08,'£150,000 p/w','A star back home',08,08),  
                                   (09,'Riyad Mahrez',24,'Algeria',09,'£175,000 p/w','A star back home',09,09), 
                                   (10,'Sérgio Oliveira',24,'Portugal',10,'£100,000 p/w','Adored by Fans',10,10), 
                                   (11,'Bruma',24,'Portugal',11,'£65,000 p/w','A Key Player',11,11), 
                                   (12,'Dimitri Payet',24,'France',12,'£135,000 p/w','A Well known Player',12,12), 
                                   (13,'Mohammed Salah',29,'Egypt',13,'£275,000 p/w','Legend',13,13),
                                   (14,'Duván Zapata',30,'Columbia',14,'£140,000 p/w','A Well known Player',14,14), 
                                   (15,'David Neres',24,'Brazil',15,'£95,000 p/w','Hidden Gem',15,15), 
                                   (16,'Pione Sisto',26,'Denmark',16,'£55,000 p/w','Unremarkable Footballer',16,16), 
                                   (17,'Mason Mount',22,'England',17,'£145,000 p/w','Rising-Star',17,17), 
                                   (18,'Youssef En-Nesyri',24,'Morocco',18,'£150,000 p/w','A Wanted Talent',18,18), 
                                   (19,'Rémy Cabella',31,'France',19,'£90,000 p/w','Adored by fans',19,19),
                                   (20,'Eduardo Camavinga',19,'France',20,'£70,000 p/w','Generational player',20,20),
                                   (21,'Erling Haaland',21,'France',21,'£170,000 p/w','Generational player',21,21),
                                   (22,'Ciro Immobile',31,'Italy',22,'£200,000 p/w','Global',22,22),
                                   (23,'Simon Mignolet',32,'Italy',23,'£70,000 p/w','Unremarkable Footballer',23,23),
                                   (24,'Dejan Lovren',32,'Croatia',24,'£90,000 p/w','A key Player',24,24),
                                   (25,'Cristiano Ronaldo',36,'Portugal',25,'£300,000 p/w','Iconic Player',25,25),
                                   (26,'Lionel Messi',34,'Argentina',26,'£300,000 p/w','Iconic Player',26,26),
                                   (27,'Mykola Shaparenko',24,'Ukraine',27,'£60,000 p/w','Unremarkable Footballer',27,27),
                                   (28,'Ádám Bogdán',34,'Hungary',28,'£55,000 p/w','close to retire',28,28),
                                   (29,'Kylian Mbappé',23,'France',29,'215,000 p/w','Generational Player',29,29),
                                   (30,'Péter Gulácsi',23,'Hungary',30,'90,000 p/w','A Key Player',30,30),
                                   (31,'Paul Pogba',28,'Spain',31,'200,000 p/w','Global',31,31),
                                   (32,'Demba Ba',36,'Senegal',32,'90,000 p/w','For the history books',32,32);
                        
       

insert into adck813Stadiums values ('Allianz Arena','Munich','Germany',75024,01,'Bayern Munich'),
                        ('Wanda Metropolitano','Madrid','Spain',68456,02,'Atletico Madrid'),    
                        ('Red Bull Arena','Salzburg','Austria',30188,03,'Red Bull Salzburg'),    
                        ('RZD Arena','Moscow','Russia',27084,04,'Lokomotiv Moscow'),    
                        ('Santiago Bernabéu','Madrid','Spain',81044,05,'Real Madrid'),    
                        ('BORUSSIA-PARK','Mönchengladbach','Spain',59724,06,'Borussia Mönchengladbach'),    
                        ('Donbass Arena','Donetsk','Ukraine',52187,07,'Shakhtar Donetsk'),    
                        ('San Siro','Milan','Italy',80018,08,'Inter Milan'),    
                        ('Eithad Stadium','Manchester','England',55097,09,'Manchester City'),
                        ('Estádio do Dragão','Porto','Portugal',50033,10,'FC Porto'),
                        ('Karaiskaki Stadium','Pireas','Greece',32115,11,'Olympiacos'),
                        ('Orange Vélodrome','Marseille','France',67394,12,'Olympique de Marseille'),
                        ('Anfield Stadium','Liverpool','England',53394,13,'Liverpool FC'),
                        ('Gewiss Stadium','Bergamo','Italy',21300,14,'Atalanta'),
                        ('Amsterdam ArenA','Amsterdam','Holland',55500,15,'AFC Ajax'),
                        ('MCH Arena','Herning','Denmark',11432,16,'FC Midtjylland'),
                        ('Stamford Bridge','London','England',41837,17,'Chelsea FC'),
                        ('Ramon Sanchez-Pizjuan Stadium','Seville','Spain',41837,18,'Sevilla FC'),
                        ('Krasnodar stadium','Krasnodar','Russia',35074,19,'FC Krasnodar'),
                        ('Roazhon Park','Rennes','France',29778,20,'Rennes FC'),
                        ('Signal Iduna Park','Dortmund','Germany',81365,21,'Borussia Dortmund'),  
                        ('Stadio Olimpico','Rome','Italy',72698,22,'S.S.Lazio'),
                        ('Jan Breydel Stadium','Bruges','Beligium',29042,23,'Club Brugge'),
                        ('Gazprom Arena','Saint Petersburg','Russia',68000,24,'Zenit Saint Petersburg'),
                        ('Allianz Stadium','Turin','Italy',29778,25,'Juventus'),
                        ('Camp Nou','Barcelona','Spain',99354,26,'FC Barcelona'),
                        ('NSC Olimpiyskiy','Kyiv','Ukraine',70050,27,'FC Dynamo Kyiv'),
                        ('Groupama Arena','Budapest','Hungary',29778,28,'Ferencváros FC'),
                        ('Le Parc des Princes','Paris','France',47929,29,'Paris Saint-Germain'),
                        ('Red Bull Arena','Leipzig','Germany',41939,30,'RB Leipzig'),
                        ('Old Trafford','Manchester','England',76000,31,'Manchester United'),
                        ('Basaksehir Fatih Terim Stadium','Istanbul','Turkey',17319,32,'Istanbul Basaksehir');


insert into adck813Fitness values (01,'torn ACL','8 months',05),
                        (02,'sprained ankle','2 weeks',06),    
                        (03,'broken collarbone','7 months',01),    
                        (04,'stiff muscle','1 week',08),    
                        (05,'concussion','3 weeks',09),    
                        (06,'dislocated elbow','4 weeks',07),    
                        (07,'hamstring','2 months',10),    
                        (08,'Covid-19','1 week',11),    
                        (09,'Fractured leg','1 season',02),
                        (10, 'dislocated shoulder','5 weeks',13),
                        (11, 'Fractured Foot', 'half a season',12),
                        (12, 'sprained knee', '3 months',04),
                        (13, 'torn MCL', '10 months',03),
                        (14, 'sprained wrist', '1 month',15),
                        (15, 'fractured wrist', '4 months',14);   

insert into adck813Player_stats values (5,2,'2.89','0.14',11,6,01),
                                       (3,0,'0.89','0.0',8,4,02),
                                       (0,1,'0.0','0.23',4,1,03),
                                       (0,0,'0.0','0.0',5,3,04),
                                       (6,0,'3.1','0.0',8,5,05),
                                       (2,4,'1.1','2.4',8,3,06),
                                       (0,0,'0.0','0.0',0,0,07),
                                       (1,1,'0.21','0.23',6,3,08),
                                       (4,2,'1.89','2.3',12,5,09),
                                       (4,0,'1.89','0.0',8,6,10),
                                       (0,1,'0.0','0.07',4,0,11),
                                       (2,0,'0.78','0.0',6,1,12),
                                       (6,1,'3.1','0.07',10,3,13),
                                       (3,2,'1.45','0.32',8,1,14),
                                       (1,0,'0.24','0.01',4,0,15),
                                       (0,1,'0.0','0.1',4,0,16),
                                       (2,2,'1.25','1.32',11,9,17),
                                       (6,0,'2.34','0.01',9,3,18),
                                       (1,2,'0.21','0.32',6,1,19),
                                       (0,1,'0.0','0.22',4,1,20),
                                       (10,3,'3.56','2.41',8,2,21),
                                       (5,1,'2.36','0.32',5,1,22),
                                       (0,0,'0.0','0.0',6,1,23),
                                       (0,1,'0.0','0.22',5,2,24),
                                       (4,2,'2.76','0.42',6,2,25),
                                       (5,2,'2.89','0.42',6,1,26),
                                       (0,0,'0.0','0.0',4,0,27),
                                       (0,0,'0.0','0.0',0,0,28),
                                       (8,4,'2.76','2.4',10,4,29),
                                       (0,0,'0.0','0.0',7,4,30),
                                       (0,2,'0.0','2.3',5,2,31),
                                       (1,1,'0.45','0.14',5,1,32);


insert into adck813Team_Groups values ('A01',01),
                                  ('A02',02),
                                  ('A03',03),
                                  ('A04',04),
                                  ('B01',05),
                                  ('B02',06),
                                  ('B03',07),
                                  ('B04',08),
                                  ('C01',09),
                                  ('C02',10),
                                  ('C03',11),
                                  ('C04',12),
                                  ('D01',13),
                                  ('D02',14),
                                  ('D03',15),
                                  ('D04',16),
                                  ('E01',17),
                                  ('E02',18),
                                  ('E03',19),
                                  ('E04',20),
                                  ('F01',21),
                                  ('F02',22),
                                  ('F03',23),
                                  ('F04',24),
                                  ('G01',25),
                                  ('G02',26),
                                  ('G03',27),
                                  ('G04',28),
                                  ('H01',29),
                                  ('H02',30),
                                  ('H03',31),
                                  ('H04',32);

/* SECTION 3 UPDATE STATEMENTS */

UPDATE `adck813Stadiums` SET `Stadium_Name` = 'Johan Cruijff ArenA' WHERE `adck813Stadiums`.`Stadium_Name` = 'Amsterdam ArenA' AND `adck813Stadiums`.`TeamID` = 15 AND `adck813Stadiums`.`Location`='Amsterdam';
UPDATE adck813Players
SET `BestPlayersName`= 'Karim Benzema',`salary`='£270,000 p/w',`players_brand_image`='Legend'
WHERE `PlayersID` = 5;


/* SECTION 4 SINGLE TABLE QUERIES */


/* 
1) List the player's name,player's nationality and salary for the player Cristiano Ronaldo
   
   
   
*/
   SELECT BestPlayersName,PlayersNationality,salary
   FROM adck813.adck813Players 
   WHERE BestPlayersName = 'Cristiano Ronaldo'; 
   


/* 
2) List the entire row of all stadiums which starts with allianz

*/
   SELECT * 
   FROM adck813.adck813Stadiums
   WHERE Stadium_Name like 'Allianz%';
/* 
3)  List the team names of all the team which has the letter B followed by two letters either side
     
*/
select distinct(TeamName) 
from adck813.adck813Teams 
where TeamName like '% B%';

/* 
4) List the entire row of all the player stats which has an expected goals that is in between 1.1 and 3.2

*/
 select * 
 from adck813.adck813Player_stats
 where xG >= 1.1 and xG <=3.2;

/* 
5) list the Average Age of all the players and rename it Average_Age

*/
select avg(PlayersAge) as 'Average_Age' 
from adck813Players;

/* 
6)  list the first 3 rows for all the players from the table

*/

SELECT * FROM adck813Players
LIMIT 3;

/* SECTION 5 MULTIPLE TABLE QUERIES */


/* 
1)  Concatenates the rows from two tables (Players and Fitness) and joins them through the primary key
*/
SELECT *
FROM adck813Players P1
INNER JOIN adck813Fitness P2
ON P1.PlayersID = P2.PlayersID;
/* 
2) Displays the rows of the team names and their stadium names ,team placement in the tournament and their top performing player from three different tables
*/
SELECT TeamName, TeamPlacements, Stadium_Name,BestPlayersName
FROM adck813Stadiums P1
INNER JOIN adck813Teams P2
ON P1.TeamID = P2.TeamID
INNER JOIN adck813Players P3
ON P2.TeamID = P3.TeamID;
/* 
3) Displays the best players name, their goals and assists,their expected goals and assists and their brand image and players ID.
*/ 
SELECT BestPlayersName,Goals,Assists,xG,xA,players_brand_image,P1.PlayersID
FROM adck813Players P1
LEFT JOIN adck813Player_stats P2
ON P1.PlayersID  = P2.PlayersID;
/* 
4)  selects the row from the players table where players ID from players and player stats table and when the appearances is greater than 5
*/
SELECT * 
FROM adck813Players P1
WHERE EXISTS
(SELECT PlayersID FROM adck813Player_stats P2
WHERE P1.PlayersID = P2.PlayersID
AND Appearances >=5);
/* 
5) Displays the row from sponsorships where team sponsor ID from teams and sponsorships table and when the brand exposure is equal to exceeding expectations of the club
*/

SELECT * 
FROM adck813Sponsorships P1
WHERE EXISTS
(SELECT TeamSponsorID,PlayerSponsorID FROM adck813Teams P2
WHERE P1.TeamSponsorID = P2.TeamSponsorID
AND brand_exposure ='exceeding expectations');
  
/* 
6)   Concatenates the rows from two tables (Teams and Stadiums) and joins them through the primary key

*/

SELECT TeamName,TeamPlacements,TopScorer,TopAssister,Stadium_Name,Location,City,Capacity
FROM adck813Teams P1
INNER JOIN adck813Stadiums P2
ON P1.TeamID = P2.TeamID;

/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM adck813Fitness;
DELETE FROM adck813Sponsorships;
DELETE FROM adck813Fitness WHERE PlayersID='8';
*/

/* SECTION 7 DROP TABLES (make sure the SQL is commented out in this section)
  DROP TABLE adck813Sponsorships;
  ALTER TABLE adck813Fitness 
  DROP COLUMN injury_timeline;
  DROP TABLE adck813Sponsorships,adck813Fitness,adck813Player_stats,adck813Stadiums,adck813Team_Groups,adck813Groups,adck813Players,adck813Teams;
  ALTER TABLE adck813Teams
  DROP COLUMN SquadSize;

*/