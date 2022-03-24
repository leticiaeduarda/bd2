create database bd_livro_2;
use bd_livro_2;

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
cd_editora int not null foreign key references tb_editora(cd_editora),
cd_genero int not null foreign key references tb_genero(cd_genero),
dt_livro date,
preco decimal(12,2)		-- tipo money funciona apenas no SQL Server
);
 