-- excluir banco de dados: drop database xxxxx

-- 1- criar banco de dados
create database bd_rh;

-- 2- usar o banco de dados
use bd_rh;

-- 3- criar tabelas
create table tb_cargo
(cd_cargo int not null primary key,
cargo char(30));

create table tb_setor
(cd_setor int not null primary key,
setor char(30));

create table tb_funcionario
(matricula int not null primary key,
funcionario char(50),
dt_nascimento date,
cd_setor int,
cd_cargo int,
salario decimal(12,2));

-- 4- alterar tabela para incluir relacionamento de chave estrangeira
alter table tb_funcionario
add constraint fk_cargo foreign key (cd_cargo)
references tb_cargo (cd_cargo);

alter table tb_funcionario
add constraint fk_setor foreign key (cd_setor)
references tb_setor (cd_setor);
