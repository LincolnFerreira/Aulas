create database pet;

use pet;

create table Pet(
idPet int primary key auto_increment,
tipoDeAnimal varchar(45),
nome varchar(45),
dtNasc date
) auto_increment = 101;

create table Cliente(
idCliente int primary key auto_increment,
nome varchar(45),
telefone char(9),
celular char(12),
endereco varchar(50)
);
-- TREINAR ESSE CÓDIGO BASTANTE
alter table Cliente add fkPet int, add foreign key (fkPet) references Pet(idPet);

INSERT INTO Pet(tipoDeAnimal,nome,dtNasc) values
	('Raposa','9caudas','2000-06-19'),
    ('urso','coca-cola','2000-06-19'),
	('Guaxinin','Xian','2000-06-19'),
	('Cachorro','Smile','2000-06-19'),
	('Salamandra','Samantha','2000-06-19'),
	('Cachorro','Zeuz','2000-06-19'),
	('Porquinho-da-índia','Caramelo','2000-06-19'),
    ('Porquinho-da-índia','Ster','2000-06-19');
    
    alter table Cliente add sobrenome varchar(45);
    
INSERT INTO Cliente (nome,sobrenome,telefone,celular,endereco) values
	('Lincoln','Ferreira','549874846','4654646645',''),
    ('Sônia Sara ','Jéssica Assunção','3601-7160','6899388-2500','Rua do Contorno'),
    ('Márcio','Vinicius','2975-0581','3499138-9572','Rua Siomara Carla de Jesus'),
    ('Beto','Leandro Castro','25502894','984487480','Rua Albatroz'),
    ('Fábio','Leandro Castro','25231124','9123187480','Rua Albasaoz');
    
    select * from cliente;
    update Cliente set fkPet = 500 where idCliente = 2;
    select * from pet;
    
    



