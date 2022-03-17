create database Sprint2;
use Sprint2;

create table Atleta(
idAtleta int primary key auto_increment,
nomeAtleta varchar(40),
modalidade varchar(40),
qtdMedalha int
);

insert into Atleta (nomeAtleta,modalidade,qtdMedalha) values
('Monica','Nado','3'),
('Stephannie','Basquete','6'),
('Rafael','Basquete','2'),
('Diego','Handebol','8'),
('Thiago','Handebol','4'),
('Caio','Corrida','5'),
('Vivian','Xadrez','5');

create table Pais (
idPais int primary key auto_increment,
nomePais varchar(30),
capital varchar(40)
);

insert into Pais (nomePais, capital) values 
('Alemanha','Berlim'),
('Brasil','Destrito Federal'),
('Estados Unidos','Washington, D.C.');

insert into Pais (nomePais, capital) values 
('França','Paris');

alter table Atleta add column fkPais int, add foreign key (fkPais) references Pais(idPais);

select * from atleta;

update atleta set fkPais = '2' where idAtleta > 4;
update atleta set fkPais = '3' where idAtleta between 2 and 3 ;
update atleta set fkPais = '1' where idAtleta = 1;
update atleta set fkPais = '4' where idAtleta = 4;


-- APRENDER E ENTENDER USAR ESSE COMANDO ABAIXO
select atleta.nomeAtleta, Pais.nomePais from atleta join Pais on idPais = fkPais;

select atleta.nomeAtleta, Pais.nomePais from atleta join Pais on idPais = fkPais where idAtleta = '2';
-- como selecionar todos os dados da tabela quando estiver com mais de uma = atleta.*
select atleta.*, Pais.nomePais, Pais.capital from atleta join Pais on idPais = fkPais where capital = 'Destrito Federal';

create table Musica (
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

insert into Musica (titulo,artista,genero) values
  ("Dancin with the devil",'Demi Lovato','Pop'),
  ('Tell me you love me','Demi Lovato','Pop'),
  ('Admiravel chip novo','Pitty','Rock Nacional'),
  ('Teto de vidro','Pitty','Rock Nacional'),
  ('Malandragem','Cassia eller','Rock Nacional'),
  ('O segundo Sol','Cassia eller','Rock Nacional'),
  ('Todo mundo menos você','Marilia Mendonça','Sertanejo'),
  ('Todo mundo vai sofrer','Marilia Mendonça','Sertanejo'),
  ('Malvadão 3','Xamã','Hip-Hop/Rap'),
  ('Sargitário','Xamã','Hip-Hop/Rap');

create table Album(
idAlbum int primary key auto_increment,
nomeAlbum varchar (40),
tipo char(8), constraint chktipo check (tipo = 'digital' or tipo = 'físico'),
dtLancamento datetime default current_timestamp
);

insert into Album (nomeAlbum, tipo, dtLancamento) values
	('Thriller','fisico','1982-02-03'),
    ('Back in Black','fisico','1980-03-05'),
    ('The Bodyguard','fisico','1992-07-01');

select * from Musica;
select * from Album;

alter table Musica add column fkAlbum int, add  foreign key (fkAlbum) references Album(idAlbum);

update Musica set fkAlbum = 2 where idMusica <= 2;
update Musica set fkAlbum = 1 where idMusica = 1 ;
update Musica set fkAlbum = 3 where idMusica >= 3;

select Musica.*, Album.nomeAlbum from Musica join Album on idAlbum = fkAlbum;

select Musica.titulo, Album.nomeAlbum from Musica join Album on idAlbum = fkAlbum where idMusica = '5';


select Musica.titulo, Album.nomeAlbum from Musica join Album on idAlbum = fkAlbum where tipo = 'fisico';

