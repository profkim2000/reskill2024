drop table member;
create table member 
(
	ID varchar(20) primary key, 
	name varchar(10) NOT NULL,
	password varchar(20) NOT NULL
);

insert into member (ID, name, password) values ('intel', '김길동', 'intel123');
insert into member (ID, name, password) values ('apple', '박길동', 'apple123');
