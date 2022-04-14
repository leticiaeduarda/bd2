
-- drop database (comando DDL)

create database bd_livro_2;			-- comando DDL

use bd_livro_2;		

-- comando DDL
create table tb_genero
(cd_genero int not null primary key,	
genero char(30)
);

-- comando DDL
create table tb_editora
(cd_editora int not null primary key,
editora char(30)
);

-- comando DDL
create table tb_livro
(isbn int not null primary key,
titulo char(50),
cd_editora int,
foreign key (cd_editora) references tb_editora(cd_editora),
cd_genero int,
foreign key (CD_GENERO) references tb_genero(cd_genero),
dt_livro date,	
preco decimal(12,2)
);

-- criar o relacionamento

-- comando DDL
alter table tb_livro
add constraint fk_genero foreign key (cd_genero) 
references tb_genero (cd_genero) ;
 
-- comando DDL 
alter table tb_livro 		
add constraint fk_editora foreign key (cd_editora) 
references tb_editora (cd_editora) ;

-- popular tabelas

-- comando DML: manipulação de dados
insert into tb_genero 
(cd_genero, genero) 
values
(1, 'Computacao'),
(2, 'Medicina'),
(3, 'Engenharia'),
(4, 'Juridico'),
(5 , 'Arquitetura'), 
(6, 'Biologia'), 
(7, 'Mecatronica'); 

-- comando DQL
select * from tb_genero;

-- comando DML: manipulação de dados
insert into tb_editora 
(cd_editora, editora) 
values
(1, 'novatec'),
(2, 'amazon'), 
(3, 'coopmed'), 
(4, 'livraria florence'), 
(5 , 'blucher'), 
(6,'Mundial'), 
(7,'saraiva'), 
(8,'Editora Forum'),
(9, 'Dickens');

-- comando DQL
select * from tb_editora;

-- comando DML: manipulação de dados
insert into tb_livro 
(isbn, titulo, cd_editora, cd_genero, preco, dt_livro) 
values
(1,'banco de dados',1,1, 300, '2019-10-02'), 
(2,'Engenharia de Software',1,1, 350, '2019-10-03'), 
(3,'Ortopedia',3,2, 310, '2019-10-04'), 
(4,'Cardiologia',4,2, 320, '2019-10-05'), 
(5,'Estrutura Predial',5,3, 200, '2019-10-09'), 
(6,'Estrutura Hidraulica',6,3, 300, '2019-10-08'), 
(7,'Direito Penal',7,4, 150, '2019-10-06'), 
(8,'Direito Civil',8,4, 200, '2019-10-07'), 
(9,'Cores ',7,5, 200, '2019-10-09'), 
(10, 'Paisagismo ',8,5, 250, '2019-10-09'), 
(11,'Virus',9,6, 300, '2019-10-03'), 
(12,'Bacteria',9,6, 300, '2019-10-09');

-- comando DQL
select * from tb_livro;

--  1) Listar  a cd_editora = 9  na tabela tb_livro
-- comando DQL: query de dados
select * from tb_livro
where cd_editora=9;

-- 2) Excluir cd_editora  = 1 na tabela tb_editora
-- comando DML: manipulação de dados
delete from tb_editora
where cd_editora = 1;
-- ERRO: não pode excluir a chave estrangeira relacionada
-- a outra tabela por causa da INTEGRIDADE REFERENCIAL
-- para evitar inconsistência

 -- 3) Alterar na tabela tb_livro  isbn = 3 preco (500)
 -- comando DML: manipulação de dados
 update tb_livro
 set preco = 500
 where isbn = 3;
 
 -- 4) Alterar – aumentar os precos do tb_livro em 20%
 -- comando DML: manipulação de dados
 -- remover restrição de alterações críticas pois dará erro
 -- edit > preferences > SQL editor > desmarcar 'safe updates'
 update tb_livro
 set preco = preco * 1.2;
 
 -- 5) Listar a tabela (tb_livro)  preco >  400
 -- comando DQL: query de dados
 select * from tb_livro
 where preco > 400;
