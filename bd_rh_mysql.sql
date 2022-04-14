-- excluir banco de dados: drop database xxxxx

-- 1- criar banco de dados
create database bd_rh;

-- 2- usar o banco de dados
use bd_rh;

-- 3- criar tabelas
create table tb_cargo
(cd_cargo int not null primary key,
cargo char(20)
);

create table tb_setor
(cd_setor int not null primary key,
setor char(30)
);

create table tb_funcionario
(matricula int not null primary key,
funcionario char(50),
dt_nascimento date,
cd_setor int,
cd_cargo int,
salario decimal(12,2)
);

-- 4- alterar tabela para incluir relacionamento de chave estrangeira
alter table tb_funcionario
add constraint fk_cargo foreign key (cd_cargo)
references tb_cargo (cd_cargo);

alter table tb_funcionario
add constraint fk_setor foreign key (cd_setor)
references tb_setor (cd_setor);

-- popular
insert into tb_setor (cd_setor, setor) 
values 
(1, 'Enfermaria'),
(2, 'Administracao'),
(3, 'Informatica'),
(4, 'Engenharia'),
(5, 'Juridico'),
(6, 'Logistica'),
(7, 'Presidencia');

insert into tb_cargo 
(cd_cargo, cargo) 
values 
(1, 'Enfermeiro(a)'),
(2, 'Administrador(a)') ,
(3, 'Analista') ,
(4, 'Engenheiro(a)') ,
(5, 'Advogado(a)') ,
(6, 'Gerente') ,
(7, 'Executivo(a)') ;

insert into tb_funcionario  
(matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  
(1,'Ana Clara', '1977-07-05',  5, 1, 3000),
(2,'Patricia Azevedo', '1944-07-04', 1, 1, 4000),
(3,'Jose Maria', '1971-05-10', 3, 1, 6000),
(4,'Sonia Abrantes', '1979-05-29',  4, 1, 7000), 
(5,'Valdir Reinaldo', '1960-09-22',  2, 2, 16000), 
(6,'Jose Alberto', '1955-01-13',  2, 2, 15000);

-- 1) Listar  a cd_setor = 3  na tabela tb_funcionário
select * from tb_funcionario
where cd_setor = 3;

-- 2) Excluir cd_cargo  = 1 na tabela tb_cargo
-- ERRO: não pode excluir a chave estrangeira relacionada
-- a outra tabela por causa da INTEGRIDADE REFERENCIAL
-- para evitar inconsistência
delete from tb_cargo
where cd_cargo = 1;

-- 3) Alterar na tabela tb_funcionario  matricula = 2  salario (7000)
update tb_funcionario
set salario = 7000
where matricula = 2;

-- 4) Alterar – aumentar os salarios dos tb_funcionario em 20%
update tb_funcionario
set salario = salario * 1.2;

-- 5) Listar a tabela (tb_funcionario)  salario > 7000
select * from tb_funcionario
where salario > 7000;

-- pt.2: restrições
-- 1) lista os funcionarios cd_setor = 1 e cd_cargo = 1
select * from tb_funcionario
where cd_setor = 1 and cd_cargo = 1;

-- 2) lista os funcionarios cd_setor = 1 ou cd_cargo = 1
select * from tb_funcionario
where cd_setor = 1 or cd_cargo = 1;

-- 3) lista os funcionarios (nome) termina com a letra a  
select * from tb_funcionario
where funcionario like '%a';

-- 4) lista os funcionarios (nome) tem a letra a 
select * from tb_funcionario
where funcionario like '%a%';

-- 5) lista os funcionarios (nome)  com o nome inicia com jose
select * from tb_funcionario
where funcionario like 'jose%';

-- 6) lista os 2 ultimos registros 
select * from tb_funcionario
order by matricula desc
limit 2;