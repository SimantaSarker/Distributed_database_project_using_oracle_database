set serveroutput on;
set verify off;

CREATE OR REPLACE TRIGGER HELLO3
AFTER insert
ON Persons
DECLARE
BEGIN
dbms_output.put_line('Data inderted..');
END;
/


CREATE OR REPLACE TRIGGER HELLO1
AFTER delete 
ON Persons
DECLARE
BEGIN
dbms_output.put_line('Data DELETED SUCCESSFULLY..');
END;
/


create or replace procedure insert_program

	is
	 num Persons.pid%TYPE:=0;
	
	
begin
	
    select count(pid) into num from ((select * from Persons) UNION (select * from persons@site));
	
	FOR i IN 1..2 LOOP
	    num:=num+1;
		insert into persons@site values(num,'Rafi',28,'jaflong','no','0kg');
	    commit;
	
	
	END LOOP;
	 

end insert_program;
/


