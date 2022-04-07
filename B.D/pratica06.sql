create database AlunoProjeto;

use AlunoProjeto;

create table aluno (
	raAluno char(8) primary key,
    nome varchar(45),
    telefone char(11)
);

alter table aluno add fkRepresentante char(8), add foreign key (fkRepresentante) references aluno(raAluno);

create table projeto (
	idProjeto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(90)
);

create table Acompanhante (
	
    nome varchar(45),
    descricao varchar(45),
    primary key (raAluno)
);

drop table aluno;

