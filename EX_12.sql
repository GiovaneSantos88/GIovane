create database curso_etec;

use  curso_etec;
go

create table professor
(id_prof int  not null primary key,
nm_prof varchar  (50) not null,
tt_hs_prof int not null,
vl_hora_prof numeric (7,2) not null);
go

create table professor_bk_insert
(id_prof int  not null primary key,
id_cur int not null,
nm_prof varchar  (50) not null,
tt_hs_prof int not null,
vl_hora_prof numeric (7,2) not null);
go

create table professor_bk_delete
(id_prof int  not null primary key,
id_cur int not null,
nm_prof varchar  (50) not null,
tt_hs_prof int not null,
vl_hora_prof numeric (7,2) not null);
go

create trigger trg_insertprofessor on professor_bk_delete
after insert
	as begin
		insert into  professor_bk_delete
		select * from inserted
	end
go
create trigger trg_deleteprofessor on  professor_bk_delete
after delete
	as begin 
		insert into  professor_bk_delete
		select * from deleted
	end 
go
select * from  professor_bk_delete;
select * from  professor_bk_insert;

insert into professor (id_prof, nm_prof,tt_hs_prof,vl_hora_prof)
values (5, 'Edson Dionisio', 997402801,8),
		(8, 'maitê Silva', 997402801,6),
		(12,'Marilia Késsia',997402801,6);