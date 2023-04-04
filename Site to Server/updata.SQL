set serveroutput on;
set verify off;

CREATE OR REPLACE TRIGGER HELLO3
AFTER insert
ON persons
DECLARE
BEGIN
dbms_output.put_line('Data inderted..');
END;
/


CREATE OR REPLACE TRIGGER HELLO1
AFTER delete 
ON persons
DECLARE
BEGIN
dbms_output.put_line('Data deleted successfully..');
END;
/


create or replace procedure insert_program

	is
	 num persons.pid%TYPE:=0;
	
	
begin
	
    select count(pid) into num from ((select * from Persons@server) UNION (select * from persons));
	
	
	FOR i IN 1..2 LOOP
	    num:=num+1;
		insert into Persons@server values(num,'Ali',28,'jaflong','no','0kg');
	    commit;
	
	
	
	END LOOP;
	 

end insert_program;
/


