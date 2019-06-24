create database curso_etec;
go

use curso_etec
go

create table cliente
	(id_cliente		int		identity(1,1)	not null primary key,
	 nm_cliente		varchar(50)				not null,
	 end_cliente	varchar(60)				not null);
go

create table compra
	(id_compra		int		identity(1,1)	not null primary key,
	 id_cliente		int						not null,
	 vl_compra		numeric (7,2)			not null,
	 dt_compra		date					not null,
	 Constraint id_cliente foreign key (id_cliente) references cliente);
go

insert into cliente
	values ('Maria', 'Rua Floriano, 20'),
		   ('Jose', 'Rua Alcantara, 113'),
		   ('Carlos', 'Av. Tiradentes, 10'),
		   ('Josefina', 'Trav. Clara Camarao, 25');
go

select * from cliente

insert into compra
	values (1, 5020.20, '2017-10-01'),
		   (2, 3510.55, '2017-10-01'),
		   (1, 1000.00, '2017-10-30'),
		   (4, 1200.10, '2017-11-01'),
		   (1, 8000.00, '2017-11-02');
go


select * from compra	


select * 
	from cliente a inner join compra b ON a.id_cliente = b.id_cliente;


select *
	from compra b join cliente a ON b.id_cliente = a.id_cliente;

select *
	from cliente a join compra b ON a.id_cliente = b.id_cliente;


select *
	from cliente a right join compra b ON a.id_cliente = b.id_cliente;
	

select *
	from cliente a left join compra b ON a.id_cliente = b.id_cliente;
	
select *
	from cliente a full join compra b ON a.id_cliente = b.id_cliente;

	
select a.id_cliente, a.nm_cliente
	from cliente a join compra b ON a.id_cliente = b.id_cliente
	order by nm_cliente;
	
select a.id_cliente as 'Codigo Cliente' , a.nm_cliente as 'Nome Cliente'
	from cliente a join compra b ON a.id_cliente = b.id_cliente;

select a.nm_cliente, b.dt_compra, b.vl_compra
	from cliente a join compra b ON a.id_cliente = b.id_cliente
	order by nm_cliente;

select a.id_cliente, a.nm_cliente, b.vl_compra
	from cliente a join compra b ON a.id_cliente = b.id_cliente
	order by nm_cliente;

select a.nm_cliente, b.dt_compra, b.vl_compra
	from cliente a join compra b ON a.id_cliente = b.id_cliente
	where b.dt_compra = '2017-10-01'
	order by nm_cliente;

select a.id_cliente, a.nm_cliente, b.vl_compra
	from cliente a join compra b ON a.id_cliente = b.id_cliente and b.vl_compra > 1200
	order by nm_cliente;

select distinct a.id_cliente, a.nm_cliente
	from cliente a join compra b ON a.id_cliente = b.id_cliente
	order by nm_cliente;


	
	 					 

		    