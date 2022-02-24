Create database sprint2;

create table Atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int(2)
);


insert into Atleta values  ('1',"Camille Good",'tênis','29'),
  ('2',"Madonna Atkinson",'triathlon','32'),
  ('3',"Joshua Carrillo",'futebol','17'),
  ('4',"Ashton Gamble",'nadadora','8'),
  ('5',"Tara Whitley",'judô','10'),
  ('6',"Serena Willians",'tênis','12'),
  ('7',"Fernanda Keller",'triathlon','15'),
  ('8',"Marta",'futebol','17'),
  ('9',"Maria Lenk",'nadadora','6'),
  ('10',"Rafaela Silva",'judô','12');
  
  select * from Atleta;

update Atleta set qtdMedalha = '31' where idAtleta = 1;

update Atleta set qtdMedalha = '18' where idAtleta in (2,3);

update Atleta set nome = 'Lincoln' where idAtleta = 4;

alter table Atleta add column dtNasc date;

update Atleta set dtNasc = '2000/06/19' where idAtleta between 1 and 10;

delete from Atleta where idAtleta=5;

select * from Atleta;

select * from Atleta where modalidade != 'nadadora';

select * from Atleta where qtdMedalha >= 3;

alter table Atleta modify modalidade varchar(60);

desc Atleta;

-- truncate table Atleta;

-- -------------------------------------------------------------------------------------

create table Musica(
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);


  
  insert into Musica (titulo, artista, genero)values  ("Dancin with the devil",'Demi Lovato','Pop'),
  ('Tell me you love me','Demi Lovato','Pop'),
  ('Admiravel chip novo','Pitty','Rock Nacional'),
  ('Teto de vidro','Pitty','Rock Nacional'),
  ('Malandragem','Cassia eller','Rock Nacional'),
  ('O segundo Sol','Cassia eller','Rock Nacional'),
  ('Todo mundo menos você','Marilia Mendonça','Sertanejo'),
  ('Todo mundo vai sofrer','Marilia Mendonça','Sertanejo'),
  ('Malvadão 3','Xamã','Hip-Hop/Rap'),
  ('Sargitário','Xamã','Hip-Hop/Rap');
  
select * from Musica;

alter table Musica add curtida int;

update Musica set curtida = '1' where idMusica between 1 and 10;

alter table Musica modify artista varchar(80);

desc Musica;

update Musica set curtida = '2' where idMusica =1;

update Musica set curtida = '5' where idMusica in (2,3);

update Musica set titulo = 'Melhor musica que já ouviu' where idMusica = 5;

delete from Musica where idMusica=5;

select * from Musica where genero <> 'funk';

select * from Musica where curtida >= 20;

desc Musica;

truncate table Musica;

create table Filme(
idFilme int primary key auto_increment,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

 insert into Filme (titulo,genero,diretor) Values('ET o Extraterrestre','Aventura','Steven Spielberg'),
  ('A Lista de Schindler','Drama','Steven Spielberg'),
  ('2001: Uma Odisseia no Espaço','Aventura','Stanley Kubrick'),
  ('Laranja mecânica','Crime','Stanley Kubrick'),
  ('Eu e você','Drama','Bernardo Bertolucci'),
  ('Os Sonhadores','Romance','Bernardo Bertolucci'),
  ('Sem fôlego','Crime','Jean-Luc Godard'),
  ('Desprezo','Romance','Jean-Luc Godard'),
  ('Kill Bill: Volume 1','Crime','Quentin Tarantino'),
  ('Era uma vez em... Hollywood','Comédia','Quentin Tarantino');
 
 select * from Filme;
 
 alter table Filme add protagonista varchar(50);
 
 update Filme set protagonista = 'Tom Cruise' where idFilme in (1,2,3,4,5,6,7,8,9,10);
 -- update Filme set protagonista = 'Tom Cruise' where idFilme between 1 and 10;
 
 alter table Filme modify diretor varchar(50);
 
 update Filme set diretor = 'Lincoln Ferreira' where idFilme = 5;
 
 update Filme set diretor = 'Kevin feige' where idFilme in (2,7);
 
 update Filme set titulo= 'invocação do mal' where idFilme=6;

select * from Filme where genero <> 'drama';

select * from Filme where genero = 'suspense';

desc Filme;

-- truncate table Filme;

create table Professor(
idProfessor int primary key auto_increment,
nome varchar(50),
especialidade varchar(50),
dtNasc date
);

insert into Professor (idProfessor,nome,especialidade, dtNasc) Values 
 ('1','Vivian','Banco de Dados','1983-10-13'),
  ('2','Caio','Algoritmo','1995-07-15'),
  ('3','Brandão','Pesquisa e Inovação','1980-02-27'),
  ('4','Vivian','Biologia','1980-05-13'),
  ('5','Marcos','Matemática','1998-03-06'),
  ('6','Jean','Português','1981-10-05'),
  ('7','Talita','Português','1950-03-02'),
  ('8','Maria João','Informática','1979-11-19'),
  ('9','Saito','Desenvolvimento web','1995-12-14'),
  ('10','Marcia Regina','Português','1966-09-20');
 

select * from Professor;

alter table Professor add funcao varchar(50);

alter table Professor add check (funcao = 'monitor' or funcao = 'assistente' or funcao = 'titular');

update Professor set 