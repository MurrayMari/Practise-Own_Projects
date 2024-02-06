CREATE DATABASE WeddingGuestPlanning;
    USE WeddingGuestPlanning;
   -- COMMENT;  I'm getting married next year, lets see if SQL can help me organise my Guest list, RSVPs, and table planning

CREATE TABLE Guest_List (
	Guest_List_id INT NOT NULL AUTO_INCREMENT,
	Full_Name VARCHAR(30) NOT NUll , 
    email_address VARCHAR(55),
    Reason_For_Invite VARCHAR(30),
    UNIQUE(Full_Name), -- unique constraint
	PRIMARY KEY(Guest_List_id )
);

INSERT INTO Guest_List(Full_Name, email_address, Reason_for_invite)
VALUES
('Jack Harkness','faceofboe@gmail.com', 'Bride\'s family'),
('Rose Tyler','rosey@hotmail.com', 'Bride\'s family'),
('Susan Foreman','foreman.s@gmail.com', 'Bride\'s family'),
('Arthur Dent','arthur.dent@hotmail.com', 'Bride\'s family'),
('Ford Perfect','perfectford@hotmail.com', 'Bride\'s family'),	
('Bill Potts', 'pottsb@gmail.com', 'Bride\'s family'),
('Clara Oswald', NULL, 'Bride\'s family'),
('Ryan Sinclair', NULL, 'Bride\'s family'),
('Sarah Jane Smith','sjs73@gmail.com', 'Bride\'s family'),
('Luke Smith', NULL, 'Bride\'s family'),
('John Smith', NULL, 'Bride\'s family'),	
('Zaphod Beeblebrox','zbeeblebrox@hotmail.com', 'Bride\'s family'),
('Agrajag Beeblebrox', NULL, 'Bride\'s family'),
('Marvin Beeblebrox', NULL, 'Bride\'s family'),		
('Lando Calrissian', 'bluecape@gmail.com', 'Bride\'s family'),
('Admiral Ackbar', NULL, 'Bride\'s family'),		
('Jennifer McFly', NULL, 'Bride\'s family'),		
('Marty McFly','DELOREAN@btinternet.com', 'Bride\'s family'),	
('Luke Skywalker', 'skywalker@hotmail.com', 'Groom\'s family'),
('Han Solo', 'millenniumfalcon@gamil.com', 'Groom\'s family'),
('Neil Stillman', 'neilastillman@gmail.com', 'Groom\'s family'),
('Marjan Fayaz', 'marjantorshizi@gmail.com', 'Groom\'s family'),
('Isabelle Stillman','stillmanisabelle@gmail.com', 'Groom\'s family'),
('Anakin Skywalker','a.skywalker@gmail.com', 'Groom\'s family'),
('Amy Pond', 'girl.who.waited@gmail.com', 'Groom\'s family'),
('Rory Williams', NULL, 'Groom\'s family'),
('Martha Jones', NULL, 'Groom\'s family'),
('Donna Noble', NULL, 'Groom\'s family'),
('Yazmin Khan','khanyazmin@gmail.com', 'Groom\'s family'),
('Biff Tannen','almanac@gmail.com', 'Groom\'s family'),
('George McFly', NULL, 'Groom\'s family'),
('Lorraine Baines McFly','msmcfly@gmail.com', 'Groom\'s family'),
('Tony Stark','stark@stark.com', 'Groom\'s family'),
('Steve Rogers','dontlookmyage@gmail.com', 'Groom\'s family'),
('Bruce Banner','notalwaysgreen@gmail.com', 'Groom\'s family'),
('Natasha Romanoff','n.romanoff@gmail.com', 'Groom\'s family'),
('Peter Parker', NULL, 'Groom\'s family'),
('Jane Foster','fosterreseacrh@gmail.com', 'Groom\'s family'),	
('Stephen Strange','drstrange@gmail.com', 'Groom\'s family'),
('Wanda Maximoff','scarletwitch@gmail.com', 'Groom\'s family'),
('Clint Barton', NULL, 'Groom\'s family');	

-- COMMENT;  Check for Guest_list input has gone correctly
-- SELECT * FROM Guest_list;
    
CREATE TABLE RSVP (
	Guest_List_id INT NOT NULL,
    RSVP_Answer VARCHAR(30) NOT NULL DEFAULT 'Yes', -- may be wishful thinking, but default RSVP is yes
    Are_Child BOOLEAN DEFAULT False, -- not many children invited so default is not a child
    Will_Need_Transport_To_Venue VARCHAR(30),
    FOREIGN KEY (Guest_List_id) REFERENCES Guest_List(Guest_List_id)
    );
   
INSERT INTO RSVP(Guest_List_id, RSVP_answer, Are_Child, Will_Need_Transport_To_Venue)
VALUES
(1,'Yes', NULL, NULL),
(2, 'Yes', NULL, NULL),
(3, 'Yes', NULL, NULL),
(4, 'Maybe', NULL, NULL),
(5, 'Maybe', NULL, NULL),
(6, 'Yes', NULL, 'Yes'),
(7, 'Yes', TRUE, 'Yes'),
(8, 'Yes', NULL, 'Yes'),
(9, 'Yes', NULL, 'Yes'),
(10,'Yes', TRUE, 'Yes'),
(11, 'Yes', NULL, 'Yes'),	
(12, 'Yes', NULL, 'Yes'),
(13, 'Yes', TRUE, 'Yes'),
(14, 'Yes', NULL, 'Yes'),	
(15, 'No', NULL, NULL),
(16, 'No', NULL, NULL),		
(17, 'Yes', NULL, 'Yes'),		
(18, 'Yes', NULL, 'Yes'),	
(19, 'Yes', NULL, NULL),
(20, 'Yes', NULL, NULL),
(21, 'Yes', NULL, NULL),
(22, 'Yes', NULL, NULL),
(23, 'Yes', NULL, NULL),
(24, 'Yes', NULL, NULL),
(25, 'Yes', NULL, 'Yes'),
(26, 'No', NULL, NULL),
(27, 'Yes', NULL, 'Yes'),
(28, 'Yes', NULL, 'Yes'),
(29, 'Yes', NULL, 'Yes'),
(30, 'Yes', NULL, 'Yes'),
(31, 'Yes', NULL, 'Yes'),
(32, 'Maybe', NULL, NULL),
(33, 'Maybe', NULL, NULL),
(34, 'Yes', NULL, 'Yes'),
(35, 'No', NULL, NULL),
(36, 'No', NULL, NULL),
(37, 'No', NULL, NULL),
(38, 'Yes', NULL, 'Yes'),	
(39, 'Yes', NULL, 'Yes'),
(40, 'No', NULL, NULL),
(41, 'No', NULL, NULL);	

-- COMMENT;  Check if RSVP input has gone correctly
-- SELECT * FROM RSVP;
    
CREATE TABLE DinnerTables (
    Table_number INTEGER,
    Dinner_choice VARCHAR(45),
    Guest_List_id INT NOT NULL,
    FOREIGN KEY (Guest_List_id) REFERENCES Guest_List(Guest_List_id)
);
INSERT INTO DinnerTables(Guest_List_id, Table_number, Dinner_choice)
VALUES
(1, 1, 'Beef'),
(2, 1, 'Veg'),
(3, 1, 'Fish'),
(4, NULL, NULL),
(5, NULL, NULL),
(6, 2,'Beef'),
(7, 2, 'Child meal'),
(8, 2, 'Fish'),
(9, 2, 'Veg'),
(10, 2, 'Child meal'),
(11, 2, 'Chicken'),
(12, 2, 'Fish'),
(13, 2, 'Child meal'),
(14, 2, 'Fish'),	
(15, NULL, NULL),
(16, NULL, NULL),		
(17, 3,'Beef'),		
(18, 3,'Chicken'),		
(19, 1, 'Beef'),
(20, 1, 'Chicken'),
(21, 1, 'Beef'),
(22, 4, 'Veg'),
(23, 1, 'Veg'),
(24, 1, 'Beef'),
(25, 4, 'Chicken'),
(26, NULL, NULL),
(27, 4, 'Gluten-Free'),
(28, 4, 'Beef'),
(29, 4, 'Veg'),
(30, 4, 'Beef'),
(31, 4, 'Veg'),
(32, NULL, NULL),
(33, NULL, NULL),
(34, 4, 'Chicken'),
(35, NULL, NULL),
(36, NULL, NULL),
(37, NULL, NULL),
(38, 4, 'Fish'),	
(39, 4, 'Chicken'),
(40, NULL, NULL),
(41, NULL, NULL);	

-- -- COMMENT; Check if DinnerTables input has gone correctly
-- SELECT * FROM DinnerTables;

-- PLEASE UNCOMMENT FROM HERE DOWN

-- -- COMMENT;  We need to chase our RSVP 'maybes', the hotel needs the final numbers
-- -- COMMENT; Lets see who is still on the fence using join

-- SELECT Full_Name, Reason_For_Invite, t1.Guest_List_id 
-- FROM Guest_List t1
-- LEFT JOIN
-- RSVP t2
-- 	ON
-- t1.Guest_List_id = t2.Guest_List_id
-- WHERE 
--  RSVP_Answer = 'Maybe'
--   ORDER BY Reason_For_Invite DESC; -- so we know which of us needs to do the chasing of relations

-- -- COMMENT;  Arthur Dent and Ford Perfect have changed to Yes, run the below to update their RSVP
-- UPDATE RSVP SET RSVP_answer = 'Yes' WHERE Guest_List_id = 4;
-- UPDATE RSVP SET RSVP_answer = 'Yes' WHERE Guest_List_id = 5;
-- -- They will also need a seat at dinner as well as their food choice added.
-- UPDATE DinnerTables SET Table_number = 3, Dinner_choice = 'Beef' WHERE Guest_List_id = 4;
-- UPDATE DinnerTables SET Table_number = 3, Dinner_choice = 'Gluten-Free' WHERE Guest_List_id = 5 ;

-- -- COMMENT;  Fearghal and Elka have changed to No, run the below to update their RSVPs
-- UPDATE RSVP SET RSVP_answer = 'No' WHERE Guest_List_id = 32;
-- UPDATE RSVP SET RSVP_answer = 'No' WHERE Guest_List_id = 33; 
--  
-- -- COMMENT;  lets check the tables to see if that worked
 -- SELECT * FROM RSVP ORDER BY RSVP_answer;
--  SELECT * FROM DinnerTables ORDER BY Table_number;

-- -- COMMENT; So now we've all our RSVPs, lets delete the 'No's from the Dinner_Tables table using a join
-- DELETE t1
-- FROM 
-- DinnerTables t1
-- LEFT JOIN
-- RSVP t2
-- 	ON
-- t1.Guest_List_id = t2.Guest_List_id
-- WHERE 
--  RSVP_Answer = 'No';
-- -- COMMENT;  Check if that worked
-- SELECT * FROM DinnerTables; -- If there are no NULL values it worked 

-- -- COMMENT; Do we need to hire a babysitter?? How many children are coming?
-- -- COMMENT; Lets check with function count()
-- SELECT COUNT(Are_Child) 
--  FROM RSVP
--  WHERE Are_Child = True;

-- -- COMMENT; Which family are they from? Lets join tables to check
-- SELECT Reason_For_Invite, Full_Name
-- FROM Guest_list t1
-- LEFT JOIN RSVP t2
-- ON
-- t1.Guest_List_id = t2.Guest_List_id
-- WHERE 
--  Are_Child = True
--  ORDER BY t1.Full_Name DESC;
--  
-- -- COMMENT; Maybe we can just set up a table for them to make beaded jewellery 
-- -- COMMENT;  How long are their names? I can cute letter beads for them, lets use CHAR_LENGTH  
-- SELECT CHAR_LENGTH(Full_Name), Full_Name
-- FROM Guest_list t1
-- LEFT JOIN RSVP t2
-- ON
-- t1.Guest_List_id = t2.Guest_List_id
-- WHERE 
--  Are_Child = True
--  ORDER BY t1.Full_Name DESC;
 
-- -- COMMENT; What transport will we need to get everyone to our venue?
-- -- COMMENT; Lets check by creaing a function 
 
-- DELIMITER //
-- CREATE FUNCTION Transport(
-- 	GuestNumbers INT
-- 	)
-- Returns VARCHAR(20)
-- DETERMINISTIC
-- BEGIN
-- 	DECLARE TransportSize VARCHAR(20);
-- 	IF GuestNumbers >= 15 THEN
-- 	SET TransportSize = 'Bus';
-- 	ELSEIF (GuestNumbers < 15 AND GuestNumbers >= 5) THEN
-- 		SET TransportSize = 'Mini-bus';
-- 	ELSEIF (GuestNumbers <= 4 AND GuestNumbers >= 3) THEN
-- 		SET TransportSize = 'Car';
-- 	ELSEIF GuestNumbers = 2 THEN
-- 		SET TransportSize = 'Tandem-Bicycle';
-- 	ELSEIF GuestNumbers = 1 THEN
-- 		SET TransportSize = 'Roller-skates';
-- 	END IF;
--     RETURN(TransportSize);
--  END //
--  DELIMITER ;
--  
--  SELECT Transport(COUNT(Will_Need_Transport_To_Venue)) 
--  FROM RSVP;
 
-- -- COMMENT; OK who is sitting with who for dinner and how mixed are the tables?
-- -- COMMENT;  lets use a join to check
-- SELECT
-- t1.Table_number,
-- t2.Full_Name,
-- t2.Reason_For_Invite
-- FROM 
-- DinnerTables t1
-- LEFT JOIN
-- Guest_list t2
-- 	ON
-- t1.Guest_List_id = t2.Guest_List_id
-- ORDER BY Table_number;

-- -- COMMENT;  What dinner options do we have again?
-- SELECT DISTINCT Dinner_choice from DinnerTables;

-- -- COMMENT;  My fiancé’s's aunt is celiac so lets make sure the people who ordered gluten free are obvious
-- -- COMMENT;  We can change to UPPERCASE letters with function UPPER
-- SET SQL_SAFE_UPDATES = 0; -- turns off safe mode the update doesn't use a primary key
-- UPDATE DinnerTables
-- SET Dinner_choice = UPPER(Dinner_choice)
-- WHERE Dinner_choice = 'Gluten-Free';
-- SET SQL_SAFE_UPDATES = 1; -- turns back on safe mode 
-- -- COMMENT;  Check if that worked 

-- SELECT * FROM DinnerTables
-- ORDER BY Dinner_choice;

-- -- COMMENT;  The hotel has contacted us, they don't have the fish option as it's gone bad
-- -- COMMENT; We need to make a procedure to change fish to the veg option
-- DELIMITER // 
-- CREATE PROCEDURE FishToVeg ( IN FTV_id INT, IN FTV_Dinner_choice VARCHAR(20))
-- BEGIN
-- UPDATE DinnerTables
-- SET
-- Dinner_choice = FTV_Dinner_choice WHERE FTV_id = Guest_List_id;
-- END //
-- DELIMITER ;

-- -- COMMENT; lets see who ordered fish and where they are sitting
-- SELECT Guest_List_id, Table_number
-- FROM DinnerTables
-- WHERE Dinner_choice = 'Fish'
-- ORDER BY Table_number;

-- -- COMMENT; lucky there's not many, lets call the procedure to update the table
-- CALL FishToVeg(3,'Veg');
-- CALL FishToVeg(8,'Veg');
-- CALL FishToVeg(12,'Veg');
-- CALL FishToVeg(14,'Veg');
-- CALL FishToVeg(38,'Veg');
-- -- COMMENT; Check if that worked 
-- SELECT * FROM DinnerTables;


-- -- COMMENT; I'm curious how many tables we have - lets use the function 'max' to check
-- SELECT MAX(Table_number)
-- FROM DinnerTables;
