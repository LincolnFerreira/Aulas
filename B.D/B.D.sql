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
	
select Professor.*, Disciplina.nomeDisc from Professor join Disciplina on idProfessor = fkProfessor where Professor.sobrenome = "Dado";

select Professor.especialidade1, Disciplina.nomeDisc from Professor join Disciplina on idProfessor = fkProfessor order by Professor.especialidade1;

-- ---------------------------------------------------------------------------------------------------------------------------


create database sprint2;

use sprint2;

create table Curso(
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(30)
);

insert into Curso (nome, sigla, coordenador) values 
('Programação', 'C#', 'Caio'),
('Banco de Dados', 'SQL', 'Vivian'),
('Flutter', 'FLU', 'Marcos');

create table Aluno(
	idAluno int primary key auto_increment,
    nome varchar(50),
    semestre int,
    falta int
);

insert into Aluno (nome, semestre, falta) values 
('Guilherme','2','1'),
('Heloisa','1','2'),
('Matheus','3','0'),
('Pedro Henrique','1','5');

alter table Aluno add fkAluno int, add foreign key (fkAluno) references Curso (idCurso);

update Aluno set fkAluno = '1' where idAluno in (2);
update Aluno set fkAluno = '2' where idAluno in (1);
update Aluno set fkAluno = '3' where idAluno in (3);
update Aluno set fkAluno = '2' where idAluno in (4);

select Aluno.*, Curso.nome as 'Nome do curso', Curso.coordenador as 'cordenador do curso' from aluno join Curso on idCurso = fkAluno;

select Aluno.*, Curso.nome as 'Nome do curso', Curso.coordenador as 'cordenador do curso' from aluno join Curso on idCurso = fkAluno where semestre = '1';

alter table Aluno modify column semestre int, add check (semestre = '1' or semestre ='2' or semestre = '3');