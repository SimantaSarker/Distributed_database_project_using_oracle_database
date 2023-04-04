set serveroutput on;
set verify off;

declare 
 
	opt number := &options;
	
	
begin 
	
	if opt = 1 then
	dbms_output.put_line('Data insert into persons table!');
	insert_program;
	elsif opt = 2 then
	dbms_output.put_line('Data deleted from persons table!');
	elsif opt = 3 then
	dbms_output.put_line('Data deleted from persons table!');
	end if;
end; 
/

