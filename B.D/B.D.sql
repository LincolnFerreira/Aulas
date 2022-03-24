create database sprint1;

use sprint1;

create table Professor (
    idProfessor int primary key auto_increment,
    nome varchar (50),
    sobrenome varchar (30),
    especialidade1 varchar(40),
    especialidade2 varchar(40)

);

insert into Professor (nome,sobrenome,especialidade1,especialidade2) values
 ('Caio','Silvia','Algoritmo','Javascript'),
 ('Vivian','Dado','Banco de Dados','Modelagem de banco'),
 ('Chola','Dell Isola','Arquitetura Computacional',' Arduíno'),
 ('Monica','Herrero','Técnologia da informação','Documentação'),
 ('Dan','Souza','SocioEmocional','Psicologo'),
 ('Rafael','Brandão','Pesquisa e Inovação','Html e Css');

create table Disciplina (
    idDisc int primary key auto_increment,
    nomeDisc varchar(45)
);

insert into Disciplina (nomeDisc) values 
('Informática Geral'),
('Pesquisa e Inovação'),
('SocioEmocional');

alter table Disciplina add column  fkProfessor int, add foreign key (fkProfessor) references Professor(idProfessor);

update Disciplina set fkProfessor = 1 where idProfessor <= 4;

update Disciplina set fkProfessor = 3 where idProfessor in (5);

update Disciplina set fkProfessor = 2 where idProfessor in (6); 

select Disciplina.*, Professor.nomeDisc from Disciplina join Disciplina on idDisc = fkProfessor;

