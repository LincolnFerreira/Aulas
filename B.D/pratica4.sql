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
('SocioEmocional'),
('Arq comp'),
('Algoritmos'),
('Banco de Dados');

desc Professor;

alter table Disciplina add column  fkProfessor int, add foreign key (fkProfessor) references Professor(idProfessor);

select * from Disciplina;
select * from Professor;

update Disciplina set fkProfessor = 2 where  idDisc = 6 ;

select * from Professor join Disciplina on idProfessor = fkProfessor;

select Disciplina.*, Professor.nome from Professor join Disciplina on idProfessor = fkProfessor;
	
select Professor.nome, Disciplina.* from Professor join Disciplina on idProfessor = fkProfessor where Professor.sobrenome = "Dado";

