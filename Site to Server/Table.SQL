
drop table bus cascade constraint;
drop table persons cascade constraint;
drop table found_addicted_people cascade constraint;
--drop table money cascade constraint;

clear screen;


create table persons(
	pid int not null,
	pname varchar2(20),
	page int,
	plocation VARCHAR2(20),
	drug_addicted VARCHAR2(20),
	amount_drug VARCHAR2(20),
	PRIMARY KEY(pid));
	
	
drop sequence p_seq;
create sequence p_seq start with 1 increment by 1 nomaxvalue; 


create table bus(
	bid int not null,
	bname varchar2(20),
	total_seats int,
	isRunning VARCHAR2(20),
	pid int,
	primary key(bid),
	foreign key(pid) references persons(pid));

drop sequence b_seq;
create sequence b_seq start with 1 increment by 1 nomaxvalue; 
	
	
	
create table found_addicted_people(
   aid int not null,
   pid int,
   PRIMARY KEY(aid),
   foreign key(pid) references persons(pid));




drop sequence f_seq;
create sequence f_seq start with 1 increment by 1 nomaxvalue; 


insert into persons values(p_seq.nextval,'Abir',24,'dhk','no','0kg');
insert into persons values(p_seq.nextval,'A',24,'dhk','yes','3kg');
insert into persons values(p_seq.nextval,'B',26,'dhk','yes','4kg');
insert into persons values(p_seq.nextval,'C',24,'dhk','no','0kg');





insert into bus values (b_seq.nextval,'Green',40,'yes',1);

insert into found_addicted_people values (f_seq.nextval,2);
insert into found_addicted_people values (f_seq.nextval,3);

--DELETE from persons where pid=5;
--select * from bus;
--select * from found_addicted_people;
--select * from persons where pid=2;
--SELECT * from persons;

commit;
(SELECT * from Persons@server) UNION (SELECT * from persons);
(SELECT * from Bus@server) UNION (SELECT * from bus);
(SELECT * from Found_addicted_people@server) UNION (SELECT * from found_addicted_people);

