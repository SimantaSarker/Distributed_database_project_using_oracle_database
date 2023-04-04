set serveroutput on;
set verify off;


create or replace FUNCTION rank_addicted_person
return integer
is

    num1 Found_addicted_people.aid%TYPE:=0;
	
begin
	
	FOR i IN ((SELECT * from found_addicted_people@site) UNION (SELECT * from Found_addicted_people )) LOOP
	    num1:=num1+1;
		--dbms_output.put_line(num1);
	END LOOP;
	return num1;

end rank_addicted_person;
/


declare 
 
	num Found_addicted_people.aid%TYPE;
	
begin 
   num:=rank_addicted_person;
   dbms_output.put_line('Total Drug addicted people in the bus are: '|| num);
   
end; 
/



((SELECT * from found_addicted_people@site) UNION (SELECT * from Found_addicted_people));
((SELECT * from Persons UNION SELECT * from persons@site));

--two persons name,location,amount of drag find korbo ekane 


create or replace procedure details_drag_addicted_persons
is
   

begin
	FOR R IN (select * from ((SELECT * from Persons UNION SELECT * from persons@site) natural join (SELECT * from Found_addicted_people UNION SELECT * from found_addicted_people@site))) LOOP
	
	   dbms_output.put_line(R.pname || '        ' || R.page ||'         '|| R.plocation || '       ');
	   
	END LOOP;
	
end details_drag_addicted_persons;
/

BEGIN
	
	details_drag_addicted_persons;

end;
/




