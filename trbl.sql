/*REGRAS
			a. Data da Entrega: 15/04/2019 18:00
			b. Estes exercícios referem-se aos comandos: Create (Database, Table), Use, Alter, Insert, Upadate, Drop e Delete.
			c. Deve ser feito os scripts e seus testes utilizando o SQLServer;
			d. Atividade individual e fará parte da menção do 1º trimestre;
			e. A entrega deve ser em papel almaço, contendo os scripts criados. Colocar o nome completo na primeira folha;
			f. Consulte as apostilas em caso de dúvida.
*/
/* O QUE FAZER
		a. A PK deve ser criada automaticamente com o identity, observando o conteúdo que esta nos dados para o insert;
		b. Fazer o script de create ( Database e Tabelas) para os dois BD´s;
		c. Fazer o script de insert dos dados só para o BD ped_compra;
*/

create database ctrl_projeto;
go

use ctrl_projeto;
go

create table cargo
			(cod_cargo			int			identity	(1,1)	primary key			not null,
			 dsc_cargo			varchar					(40)						not null);

 go
create table funcionario
			(cod_func				int			identity			(1,1)			primary key			not null,
				constraint		funcionario_cod_func_fk		foreign key			(cod_func)		references			funcionario		(cod_func),
				constraint		cargo_cod_cargo_fk			foreign key			(cod_cargo)		references			cargo			(cod_cargo),
			nom_func				varchar							(60),
			val_salario_func		numeric							(7,2));

go

create table funcionario_projeto_fk
			(constraint         projeto_cod_proj_fk				foreign key		    (cod_proj)		references				projeto			(cod_proj),
				constraint		funcionario_cod_func_fk		    foreign key			(cod_func)		references				funcionario		(cod_func),
			qtd_hs_func											numeric							      (2));

go

create table cliente
			(cod_cli				int		    identity		(1,1),
			nom_cli					varchar						(50),
			ger_proj_cli			varchar						(50));

go

create table projeto
			(cod_proj				int			identity				(1,1),
				constraint		cliente_cod_cli_fk				foreign key			(cod_cli)		references				cliente			(cod_cli), 
				constraint		funcionario_cod_func		    foreign key			(cod_func)		references				funcionario		(cod_func),
			dsc_projt				varchar								(50),
			dat_ini_projt			date						not null,
			dat_fim_projt			date						not null,
			cst_ini_proj			numeric						(7,2)		not null,
			cst_fin_projt			numeric						(7,2)		not null
 );

