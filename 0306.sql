create database Recurso_humano;

use Recurso_humano;
go

create table funcionario
(codigofunc int primary key not null,
nomefunc varchar (30) not null,
emailfinc varchar (40) not null,
telefonefunc numeric (9) not null);
go

create table funcionariobackupinsert
(codigofunc int primary key not null,
nomefunc varchar (30) not null,
emailfinc varchar (40) not null,
telefonefunc numeric (9) not null);
go

create table funcionariobackupdelete
(codigofunc int primary key not null,
nomefunc varchar (30) not null,
emailfinc varchar (40) not null,
telefonefunc numeric (9) not null);
go

create trigger trg_insertfuncionario on funcionario
after insert
	as begin
		insert into  funcionariobackupinsert
		select * from inserted
	end
go
create trigger trg_deletefuncionario on funcionario
after delete
	as begin 
		insert into funcionariobackupdelete
		select * from deleted
	end 
go

delete from funcionario
where codigofunc = 8;
go


insert into funcionario (codigofunc, nomefunc, emailfinc,  telefonefunc)
values (5, 'Edson Dionisio', 'edson.dionisio@gmail.com', 997402801),
		(8, 'maitê Silva', 'maite.silva@gmail.com',997402801),
		(12,'Marilia Késsia', 'maria,kessia@gmail.com',997402801);
go
select * from funcionario
select * from funcionariobackupinsert
select * from  funcionariobackupdelete

select * from sysobjects where type ='TR';
