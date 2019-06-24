/*Criando Banco para atividade de insert básico*/
create database ETEC_HAS_FUNC

use ETEC_HAS_FUNC;

create table Cargo
	(cd_cargo	int		identity(1,1)	primary key	not null,
	 ds_cargo	varchar(40)	not null);

create table Departamento
	(cd_depto	int		identity(10,10)	primary key	not null,
	 nm_depto	varchar(40)	not null,
	 sg_depto	varchar(5)	not null);

create table Funcionario
	(cd_func	int		identity(1,1)	primary key	not null,
	 cd_cargo	int				not null,
	 cd_depto	int				not null,
	 nm_pnome	varchar(50)		not null,
	 nm_unome	varchar(30)		not null,
	 dt_inicio	date			not null,
	 vl_salario	numeric(9,2)	not null,
	 end_func	varchar(150)	not null,
	 constraint Cargo_cd_cargo	foreign key	(cd_cargo)	references	Cargo(cd_cargo),
	 constraint Departamento_cd_depto	foreign key (cd_depto)	references	Departamento(cd_depto));

insert into Cargo
values	('Analista'),
		('Programador'),
		('Contador'),
		('Analista RH'),
		('Vendedor'),
		('Analista Financeiro'),
		('Assitente Administrativo');

insert into Departamento (nm_depto, sg_depto)
values	('Contabilidade', 'CT'),
		('Informatica', 'INF'),
		('Recursos Humanos', 'RH'),
		('Administrativo', 'ADM'),
		('Vendas', 'VDA'),
		('Financeiro', 'FIN'),
		('Pessoal', 'PES');


insert into Funcionario (cd_cargo, cd_depto, nm_pnome, nm_unome, dt_inicio, vl_salario, end_func)
values (4,50,'Antonio', 'Isaías', '2015-05-01', 3000.00, 'Rua A, 115'),
	   (1,50,'Maria', 'Santos', '2015-06-01', 2500.00, 'Av X, 30'),
	   (4,50,'Joao',	'Silveira', '2015-06-02', 3000.00, 'Av E,20'),
	   (4,50,'Jose', 'Silva', '2015-06-02', 3000.00, 'Rua B, 4'),
	   (1,50,'Amelia', 'Caetano', '2015-06-03', 2800.00, 'Av Y, 10'),
	   (3,30,'Analicia', 'Silveira', '2015-06-03', 3200.00, 'Av M, 15'),
	   (2,20,'Ana', 'Silva', '2015-06-10', 5530.00, 'Av J, 24'),
	   (2,20,'Joana', 'Araujo', '2015-06-30', 4200.00, 'Rua S, 10'),
	   (5,60,'Carlos', 'Oliveira', '2015-06-30', 6000.00, 'Rua N, 15'),
	   (6,40,'Oseias', 'Santos', '2015-07-01', 1200.00, 'Rua T, 20'),
	   (5,60,'Otacilio', 'Cristo', '2015-07-01', 6320.00, 'Av Q, 3'),
	   (1,10,'Vinicius', 'Marcelino', '2015-08-01', 2900.00, 'Rua K, 12');

select*from Cargo

select*from Departamento

select*from Funcionario

 
 -- select da tabela cargo atraves do codigo do salario e descriçao do cargo--
Select cd_cargo as 'codigo do cargo ',ds_cargo  as 'descriçao do cargo' 
 from  Cargo
 where cd_cargo =3;

select  cd_depto as 'codigo do departamento',sg_depto as 'sigla do departamento' 
 from Departamento
 where cd_depto in (20,40);  
-- where cd_depto = 20 or cd_depto = 40--

-- select da tabela funcionario a partir do  salario--
select cd_cargo as 'codigo do departamento', cd_cargo as 'codigo do funcionario', cd_depto as 'codigo do departamento', nm_pnome as 'primeiro nome', nm_unome as 'ultimo nome',vl_salario as ' valor do salario' 
from Funcionario
where vl_salario >= (2500.00);

select * from  Funcionario
where dt_inicio between '2015-06-01' AND '2105-06-30';

-- seleciona a tabela funcionario --
 select cd_func,
nm_pnome + nm_unome
FROM Funcionario
WHERE nm_pnome like'%a%';

-- update da tabela cargo --
update  Cargo
set  ds_cargo = 'progamador web' 
where cd_cargo='2'  
--update da tabela departamento --
update Departamento
set sg_depto ='vdas' 
 where cd_depto='50' 

 --update da tabela funcionario--
 update Funcionario
set vl_salario = vl_salario* '20'

--update da tabela departamento--
update Departamento
set cd_depto='80' 
 where nm_depto ='informatica' 

