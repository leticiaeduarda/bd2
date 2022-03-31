-- selecionar banco de dados

use bd_livro_2

-- popular (sempre popular as tabelas relacionadas primeiro, ou dará erro com a fk)

insert into tb_editora
(cd_editora, editora)
values
(1, 'person')

insert into tb_editora
(cd_editora, editora)
values
(2, 'erica')

-- verificar tabela

select * from tb_editora

insert into tb_genero 
(cd_genero, genero) 
values  (1,'Informatica') 

select * from tb_genero

insert into tb_livro 
(isbn, titulo, cd_editora, cd_genero, dt_livro, preco)
values
(1,'banco de dados', 1, 1, '2019-08-10', 100)

select * from tb_livro

insert into tb_livro 
(isbn, titulo, cd_editora, cd_genero, dt_livro, preco)
values
(2,'engenharia de software', 1, 1, '2019-08-20', 200)

select * from tb_livro

-- deletar dados cadastrados

delete from tb_livro where isbn <3

delete from tb_genero where cd_genero <3

delete from tb_editora where cd_editora <3

-- popular tabelas

insert into tb_genero 
(cd_genero, genero) 
values
(1, 'Computacao'),
(2, 'Medicina'),
(3, 'Engenharia'),
(4, 'Juridico'),
(5 , 'Arquitetura'), 
(6, 'Biologia'), 
(7, 'Mecatronica') 

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
(9, 'Dickens')

insert into tb_livro 
(isbn, titulo, cd_editora, cd_genero, preco, dt_livro) 
values
(1,'banco de dados',1,1, 300, '10-02-2019'), 
(2,'Engenharia de Software',1,1, 350, '10-03-2019'), 
(3,'Ortopedia',3,2, 310, '10-04-2019'), 
(4,'Cardiologia',4,2, 320, '10-05-2019'), 
(5,'Estrutura Predial',5,3, 200, '10-06-2019'), 
(6,'Estrutura Hidraulica',6,3, 300, '10-07-2019'), 
(7,'Direito Penal',7,4, 150, '10-08-2019'), 
(8,'Direito Civil',8,4, 200, '10-09-2019'), 
(9,'Cores ',7,5, 200, '10-10-2019'), 
(10, 'Paisagismo ',8,5, 250, '10-11-2019'), 
(11,'Virus',9,6, 300, '10-12-2019'), 
(12,'Bacteria',9,6, 300, '10-12-2019')

-- verificar dados  cadastrados

select * from tb_editora
select * from tb_genero
select * from tb_livro


-- atualizar dados

update tb_livro
set cd_editora = 2, cd_genero = 2
where isbn = 1					-- sempre colocar 'where' ou então irá atualizar todos os dados da tabela

select * from tb_livro
