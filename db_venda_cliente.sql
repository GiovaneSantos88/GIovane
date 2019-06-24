/* drop database venda_cliente */;

Create database venda_cliente;
go

Use venda_cliente;
go

create table produto
	(cod_pod      int      identity (1,1) not null primary key,
	 dsc_prod     varchar  (50)           not null,
	 pr_venda     numeric  (7,2)          not null,
	 pr_promocao  numeric (7,2));    

go

create table cliente
	(cod_cli      int      identity (1,1) not null primary key,
	 nom_cli      varchar  (60)           not null);
go 

create table nf_cliente
	(nr_nf        int      identity (1,1) not null primary key,
	 cod_cli      int                     not null,
	 dat_nf       date                    not null,
	 vl_tot_nf    numeric (7,2)           not null,
	 vl_tot_desc  numeric (7,2),
	 constraint nf_cli_fk foreign key (cod_cli) references  cliente);
go

create table prod_nf
	(nr_nf        int                     not null,
	 cod_prod     int                     not null,
	 qtd_prod     numeric (5,2)           not null,
	 vl_uni_vda   numeric (7,2)           not null,
	 vl_uni_desc  Numeric (7,2),
	 constraint prodnf_nf_fk    foreign key (nr_nf)    references nf_cliente,
	 constraint prodnf_prod_fk  foreign key (cod_prod) references produto);
go

insert into produto
	values  ('Papinha bebe','10.00','9.00'),
		    ('Suco maça infantil','3.30',NULL),
			('Leite Ninho','8.25','8.00'),
			('Suplemento ','13.20',NULL),
			('Sopa em pote','5.10',NULL),
			('Creme leite','4.30','3.50');
go

insert into cliente
	values  ('José Martins'),
		    ('Maria Salazar'),
		    ('Antonio Carlos'),
		    ('Marcos Maciel'),
		    ('Mario Felipelo'),
		    ('Daniel Dantas'),
		    ('Cristina Santos');
go 

insert into nf_cliente
	values  (1,'2018-08-20','300.00','23.75'),
		    (3,'2018-08-25','160.00','5.00'),
			(2,'2018-08-25','35.00','8.00'),
			(1,'2018-08-26','25.50',null),
			(3,'2018-08-27','193.35','3.00');
go

insert into prod_nf
	values  (1,1,'20.00','10.00','1.00'),
			(1,3,'15.00','8.25','0.25'),
			(2,3,'20.00','8.25','0.25'),
			(3,6,'10.00','4.30','0.80'),
			(4,5,'5.00','5.10',null),
			(5,1,'3.00','8.25','1.00'),
			(5,4,'13.00','13.20',null);
go


/* EXERCICIO A */
SELECT	COUNT(*) AS 'Notas Fiscais'

FROM	nf_cliente;



/* EXERCICIO B */
SELECT  COUNT(DISTINCT nr_nf) AS 'Notas Fiscais'

FROM		prod_nf


/* EXERCICIO C */
SELECT		COUNT(nr_nf) AS 'Nota Fiscal'
		
FROM		nf_cliente

WHERE		vl_tot_nf > 150.00;




/* EXERCICIO D */
SELECT		SUM (vl_tot_nf )'Soma Nota Fiscal', 
			MAX (vl_tot_nf )'Máximo Nota Fiscal',
			AVG (vl_tot_nf )'Médio Nota Fiscal', 
			MIN (vl_tot_nf )'Mínimo Nota Fiscal'

FROM		nf_cliente;




/* EXERCICIO E */
SELECT		MIN(nom_cli)'Primeiro nome A-Z',
			MAX(nom_cli)'Ultimo nome A-Z'

FROM		cliente;




/* EXERCICIO F */
SELECT		SUM(vl_tot_desc)'Soma Desconto Nota Fiscal', 
			MAX (vl_tot_desc)'Máximo Desconto Nota Fiscal',
			AVG (vl_tot_desc)'Médio Desconto Nota Fiscal', 
			MIN (vl_tot_desc)'Mínimo Desconto Nota Fiscal'

FROM		nf_cliente;


SELECT		nr_nf,cod_cli,dat_nf,vl_tot_nf,vl_tot_desc

FROM		nf_cliente

WHERE		vl_tot_desc IS NOT NULL

ORDER BY	dat_nf DESC




/* EXERCICIO G */
SELECT		
			SUM(vl_tot_desc) AS 'Total do Desconto' , 
	
		SUM (vl_tot_nf) AS 'Total Nota Fiscal'

FROM		nf_cliente

GROUP BY	cod_cli;


SELECT		SUM(vl_tot_nf) AS 'Total Nota Fiscal',
			SUM(vl_tot_desc) AS 'Total do Desconto' 
			
FROM		nf_cliente

WHERE		vl_tot_desc IS NOT NULL

GROUP BY	cod_cli

ORDER BY	cod_cli DESC;



/* EXERCICIO H */
SELECT		
		SUM(vl_tot_desc) AS 'Total do Desconto' , 
		SUM (vl_tot_nf) AS 'Total Nota Fiscal'

FROM		nf_cliente

GROUP BY	cod_cli;



/* EXERCICIO I */
SELECT		SUM(vl_tot_nf) AS 'Total Nota Fiscal',
			SUM(vl_tot_desc) AS 'Total do Desconto' 
			
FROM		nf_cliente

WHERE		vl_tot_desc IS NOT NULL

GROUP BY	cod_cli

ORDER BY	cod_cli DESC;






/* EXERCICIO J */

SELECT		SUM(vl_tot_nf) AS 'Total Nota Fiscal',
			SUM(vl_tot_desc) AS 'Total do Desconto'
			
FROM		nf_cliente

GROUP BY	dat_nf;





/* EXERCICIO K */
SELECT		nr_nf AS 'Nota fiscal',count(qtd_prod) AS 'Qtde total'

FROM		prod_nf    

GROUP BY	nr_nf

ORDER BY	nr_nf;     



/* verificando estrutura das tabelas */
sp_help produto;
go
sp_help cliente;
go
sp_help nf_cliente;
go
sp_help prod_nf;
go

/* selecionando todos os dados das tabelas */
select * from produto;
go
select * from cliente;
go
select * from nf_cliente;
go
select * from prod_nf;
go

DROP DATABASE venda_cliente