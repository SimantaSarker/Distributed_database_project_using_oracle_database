set serveroutput on;
set verify off;


create or replace FUNCTION rank_addicted_person
return integer
is

    num1 found_addicted_people.aid%TYPE:=0;
	
begin
	
	FOR i IN ((SELECT * from Found_addicted_people@server) UNION (SELECT * from found_addicted_people )) LOOP
	    num1:=num1+1;
		--dbms_output.put_line(num1);
	END LOOP;
	return num1;

end rank_addicted_person;
/


declare 
 
	num found_addicted_people.aid%TYPE;
	
begin 
   num:=rank_addicted_person;
   dbms_output.put_line('Total Drug addicted people in the bus are: '|| num);
   
end; 
/



((SELECT * from Found_addicted_people@server) UNION (SELECT * from found_addicted_people));
((SELECT * from Persons@server UNION SELECT * from persons));

--two persons name,location,amount of drag find korbo ekane 


create or replace procedure details_drag_addicted_persons
is
   

begin
	FOR R IN (select * from ((SELECT * from Persons@server UNION SELECT * from persons) natural join (SELECT * from Found_addicted_people@server UNION SELECT * from found_addicted_people))) LOOP
	
	   dbms_output.put_line(R.pname || '        ' || R.page ||'         '|| R.plocation || '       ');
	   
	END LOOP;
	
end details_drag_addicted_persons;
/

BEGIN
	
	details_drag_addicted_persons;

end;
/




