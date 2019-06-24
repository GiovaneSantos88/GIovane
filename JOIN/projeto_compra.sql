create database projeto_compra;
go

use projeto_compra;
go


create table cliente
(
	id_cliente int identity (1,1) not null,
	nom_cliente varchar (50) not null,
	end_clinete varchar (60) not null
);
create table Compra
(
	id_compra int identity (1,1) not null,	
	constraint		cliente_id_cliente_fk				foreign key			(id_cliente)		references				cliente		(id_cliente), 
	vl_compra	numeric (7,2) not null,
	dt_compra	date not null
);

insert into cliente
value
		('Maria','Rua floriang, 20'),
		('Jose','Rua Alcantara, 113'),
		('Carlos','Av.Tiradentes,10'),
		('Josefina','Trav Clara Camarao');

select * from clientre;

insert into compra
value 
	(5020.20,'2017-10-01',1),
	(3510.55,'2017-10-01',2),
	(1000.00,'2017-10-30',1),
	(1200.10,'2017-11-01',4),
	(8000.00,'2017-11-02',1);
	
	select *from compra;

	/*join ou inner join*/
	select *
	from cliente a inner join Compra n ON a.id_cliente = b.id_clinete;

	select *
	from Compra b join clinete a ON b.id_clinete = a.id_cliente;

	select * 
	from cliente a join Compra a ON a.id_cliente = b.id_cliente;
	/*right join lista as linhas referentes a tabela a direita da expressão*/
	select *
	from cliente a right join Compra b ON a.id_cliente = b.id_cliente;

	/*left join lista as linhas referentes a tabela a esqueeda da expressão*/
	select *
	from cliente a left join Compra b ON a.id_clente = b.id_cliente;
	
	select * 
	from cliente a full join Compra b ON a.id_cliente = b.id_cliente;


	
   
