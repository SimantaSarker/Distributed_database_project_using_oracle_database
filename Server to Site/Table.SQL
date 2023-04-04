
drop table Bus cascade constraint;
drop table Persons cascade constraint;
drop table Found_addicted_people cascade constraint;
--drop table Money cascade constraint;


clear screen;


create table Persons(
	pid int not null,
	pname varchar2(20),
	page int,
	plocation VARCHAR2(20),
	drug_addicted VARCHAR2(20),
	amount_drug VARCHAR2(20),
	PRIMARY KEY(pid));
	
	
drop sequence p_seq;
create sequence p_seq start with 1 increment by 1 nomaxvalue; 


create table Bus(
	bid int not null,
	bname varchar2(20),
	total_seats int,
	isRunning VARCHAR2(20),
	pid int,
	primary key(bid),
	foreign key(pid) references Persons(pid));

drop sequence b_seq;
create sequence b_seq start with 1 increment by 1 nomaxvalue; 
	
	
	
create table Found_addicted_people(
   aid int not null,
   pid int,
   PRIMARY KEY(aid),
   foreign key(pid) references Persons(pid));




drop sequence f_seq;
create sequence f_seq start with 1 increment by 1 nomaxvalue; 


insert into Persons values(5,'kabir',26,'khulna','no','0kg');
insert into Persons values(6,'Rahat',28,'dhk','yes','6kg');
insert into Persons values(7,'Banti',29,'Ctng','yes','9kg');
insert into Persons values(8,'Arnob',30,'dhk','no','0kg');





insert into Bus values (2,'volvo',40,'yes',5);

insert into Found_addicted_people values (3,6);
insert into Found_addicted_people values (4,7);




--DELETE from persons where pid=5;
--select * from bus;
--select * from found_addicted_people;
--select * from persons where pid=2;
--SELECT * from persons;




commit;
select * from persons@site union select * from Persons;
select * from bus@site union select * from Bus;
select * from found_addicted_people@site union select * from Found_addicted_people;
