--1
select A.NAME_OF_SCHOOL, A.COMMUNITY_AREA_NAME, A.AVERAGE_STUDENT_ATTENDANCE 
from CHICAGO_PUBLIC_SCHOOLS A inner join CENSUS_DATA B 
on A.COMMUNITY_AREA_NUMBER = B.COMMUNITY_AREA_NUMBER
where B.HARDSHIP_INDEX = 98

--2
select * from CHICAGO_CRIME_DATA A left outer join CENSUS_DATA B 
on A.COMMUNITY_AREA_NUMBER = B.COMMUNITY_AREA_NUMBER where 
A.LOCATION_DESCRIPTION = 'SCHOOL, PUBLIC, GROUNDS'

--2.1
create view NEW_VIEW(School_Name,Safety_Rating,Family_Rating,
Environment_Rating,Instruction_Rating,Leaders_Rating,Teachers_Rating)
as select NAME_OF_SCHOOL,Safety_Icon,Family_Involvement_Icon,
Environment_Icon,Instruction_Icon,Leaders_Icon,Teachers_Icon
from CHICAGO_PUBLIC_SCHOOLS

select School_Name, Leaders_Rating from NEW_VIEW;

--3.1
--#SET TERMINATOR @
CREATE OR REPLACE PROCEDURE UPDATE_LEADERS_SCORE (IN in_School_ID INTEGER, IN in_Leader_Score INTEGER)
  LANGUAGE SQL
  
	BEGIN 

		UPDATE CHICAGO_PUBLIC_SCHOOLS
		SET Leaders_Score = in_Leader_Score
			WHERE School_ID = in_School_ID;
			
		IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN
	      	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Very Weak';
	    ELSEIF in_Leader_Score < 40 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Weak';	
	    ELSEIF in_Leader_Score < 60 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Average';
	    ELSEIF in_Leader_Score < 80 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Strong';
	    ELSEIF in_Leader_Score < 100 THEN
	       	UPDATE CHICAGO_PUBLIC_SCHOOLS
				SET Leaders_Icon = 'Very Strong';
	   	END IF;
		
	END@

CALL UPDATE_LEADERS_SCORE(400018, 50)
SELECT SCHOOL_ID, Leaders_Icon FROM CHICAGO_PUBLIC_SCHOOLS
WHERE SCHOOL_ID = 400018



















