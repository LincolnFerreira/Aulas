create database AlunoProjeto;

use AlunoProjeto;

create table aluno (
	idAluno char(8) primary key, -- lembrando que aqui é o R.A do aluno
    nome varchar(45),
    telefone char(11)
);

alter table aluno add fkRepresentante char(8), add foreign key (fkRepresentante) references aluno(idAluno);

desc aluno;
select * from aluno;
insert into aluno (idALuno,nome,telefone) values
('01221139','Lincoln','11972377400'),
('01221157','Cecilia','11970637516'),
('01221148','Lia','11972553577'),
('01221151','Roberto','11972578777'),
('01221155','Natalia','11972377455'),
('01221101','Thiago','11972377401'),
('01221142','Andrey','11972377423'),
('01221141','Marco','11975555545');


update aluno set fkRepresentante = '01221141' where idAluno = '01221139';
update aluno set fkRepresentante = '01221142' where idAluno = '01221157';
update aluno set fkRepresentante = '01221101' where idAluno = '01221148';
update aluno set fkRepresentante = '01221155' where idAluno = '01221151';
update aluno set fkRepresentante = '01221151' where idAluno = '01221155';
update aluno set fkRepresentante = '01221148' where idAluno = '01221101';
update aluno set fkRepresentante = '01221157' where idAluno = '01221142';
update aluno set fkRepresentante = '01221139' where idAluno = '01221141';


create table projeto (
	idProjeto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(90)
);

insert into projeto (nome,descricao) values
	('Magna','projeto sobre superlotação em praça de alimentações'),
    ('DataFlow','projeto sobre superlotação em onibus');
    
desc aluno;   
 
alter table aluno add fkProjeto int, add foreign key (fkProjeto) references projeto(idProjeto);

select * from aluno;

update aluno set fkProjeto = '1' where idAluno = '01221139';
update aluno set fkProjeto = '2' where idAluno = '01221157';
update aluno set fkProjeto = '1' where idAluno = '01221148';
update aluno set fkProjeto = '2' where idAluno = '01221151';
update aluno set fkProjeto = '1' where idAluno = '01221155';
update aluno set fkProjeto = '2' where idAluno = '01221101';
update aluno set fkProjeto = '1' where idAluno = '01221142';
update aluno set fkProjeto = '2' where idAluno = '01221141';


create table Acompanhante (
	idAcompanhante int,
    nome varchar(45),
    relacao varchar(20) check (relacao = 'pai' or relacao = 'amigo' or relacao = 'mae' or relacao = 'irmao' or relacao = 'namorado(a)' or relacao = 'etc' ),
    fkAluno char(8),
    primary key (idAcompanhante,fkAluno),
    foreign key (fkAluno) references aluno(idAluno)
);

desc aluno;


insert into Acompanhante values 
	('1','Loridete','Mãe','01221139'),
	('2','Lia','Mãe','01221157'),
	('3','Cecilia','etc','01221148'),
    ('4','João','Irmão','01221151'),
    ('5','JP','Amigo','01221141'),
	('6','Ana','Amigo','01221139');
    
select * from acompanhante;

select aluno.*,projeto.* from aluno join projeto on idProjeto = fkProjeto;

 -- arrumadinho 
select aluno.nome as 'Nome do aluno' ,projeto.nome as 'Nome do projeto', projeto.descricao as 'Descrição do projeto' from aluno join projeto on idProjeto = fkProjeto;

select aluno.nome, acompanhante.nome from aluno join acompanhante on fkAluno = idAluno;

select aluno.*, projeto.nome from aluno join projeto on fkProjeto = idProjeto where idProjeto = 1;

select aluno.nome, representante.nome as 'Representante' from aluno join aluno as representante on representante.idAluno = aluno.fkRepresentante;

drop table aluno;
drop database AlunoProjeto;

select * from aluno,projeto;

select aluno.*, projeto.*, acompanhante.* from aluno join projeto on fkProjeto = idProjeto join acompanhante on idAluno = fkAluno;


select aluno.nome as 'nome do Aluno', projeto.nome as 'nome do projeto', acompanhante.nome as 'nome do acompanhante', representante.nome 'Representante do aluno' from aluno join projeto on fkProjeto = idProjeto join acompanhante on idAluno = fkAluno join aluno as representante on representante.fkRepresentante = aluno.idAluno;



create database Campanha;

use Campanha;


create table organizador(
    idOrganizador int primary key auto_increment,
    nome varchar(45),
    rua varchar(45),
    bairro varchar(45),
    email varchar(45)

)auto_increment = 500;

create table campanha (
    idCampanha int primary key auto_increment,
    categoria char(25) check (categoria = 'alimento' or categoria = 'produto de higiene' or categoria = 'máscaras de proteção' or categoria = 'etc'),
    instituicao varchar(45),
    instituicao2 varchar(45),
    dtFinalCampanha varchar(45)
)auto_increment = 30;


alter table organizador add fkCampanha int, add foreign key (fkCampanha) references organizador(idOrganizador);
alter table  organizador add fkOrganizadorExp int, add foreign key (fkOrganizadorExp) references organizador(idOrganizador);

insert into organizador (nome,rua,bairro,email) values 
    ('Alícia','Travessa Pirani','Itacaranha','alicia-carvalho98@vbrasildigital.net'),
    ('Luan','Rodovia Lauro Pamplona','Valada Itoupava','luan.diogo.silveira@brasildakar.com.br'),
    ('Diogo','José Carlos Barbosa de Faro','Jabotiana','diogo-damata74@tanet.com.br'),
    ('Matheus','Rua B','São Francisco','matheus-assis97@studiodeideias.com'),
    ('Thiago','Rua Silveira','Autódromo','thiago-novaes86@agen-pegeuot.com.br'),
    ('Regina','Rua Jari','São José Operário','regina_stella_duarte@qmagico.com.br'),
    ('Rodrigo','Rua Joel José Dias','Parque Xerém','rodrigo.geraldo.aparicio@alphacandies.com.br');

insert into campanha (categoria,instituicao,instituicao2,dtFinalCampanha) values 
    ('alimento','alimentabem','cestafamilia','2022/08/19'),
    ('produto de higiene','limpamais','higienepopular','2022/06/14'),
    ('máscaras de proteção','protegeplus','mascaraamiga','2022/07/09'),
    ('etc','derivadospopular','aleatoriocamp','2022/12/01');

update organizador set fkCampanha = 1 where idOrganizador = 501;
update organizador set fkCampanha = 2 where idOrganizador = 502;
update organizador set fkCampanha = 3 where idOrganizador = 503;
update organizador set fkCampanha = 4 where idOrganizador = 504;
update organizador set fkCampanha = 1 where idOrganizador = 505;
update organizador set fkCampanha = 2 where idOrganizador = 506;
update organizador set fkCampanha = 3 where idOrganizador = 507;


update organizador set fkOrganizadorExp = 3 where idOrganizador = 507;


