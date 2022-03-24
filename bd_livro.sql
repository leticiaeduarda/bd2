create database bd_livro;
use bd_livro;

create table tb_genero
(cd_genero int not null primary key,
genero char(30)
);

create table tb_editora
(cd_editora int not null primary key,
editora char(30)
);

create table tb_livro
(isbn int not null primary key,
titulo char(50),
cd_editora int,
cd_genero int,
dt_livro date,
preco decimal(12,2)		-- tipo money funciona apenas no SQL Server
); 

alter table tb_livro
add constraint fk_genero foreign key (cd_genero)
references tb_genero (cd_genero);
 
alter table tb_livro
add constraint fk_editora foreign key (cd_editora)
references tb_editora (cd_editora);
 