create database pet;
desc Pet;
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
alter table Pet add fkCliente int, add foreign key (fkCliente) references Cliente(idCliente);

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
    update Pet set fkCliente = 1 where idPet = 101;
    update Pet set fkCliente = 2 where idPet = 102;
    update Pet set fkCliente = 3 where idPet = 103;
    update Pet set fkCliente = 4 where idPet = 104;
    update Pet set fkCliente = 5 where idPet = 105;
	update Pet set fkCliente = 2 where idPet = 106;
	update Pet set fkCliente = 3 where idPet = 107;

    
select * from pet;
select * from cliente;

DROP database pet;

alter table Cliente modify nome varchar(60);

desc Pet;

select * from Pet where tipoDeAnimal = 'cachorro';

select nome, dtNasc from Pet;

select * from Cliente order by endereco;

select * from Pet where nome like 'c%';

select * from Cliente where sobrenome = "Leandro Castro";

update Cliente set telefone = '11111111' where idCliente = 3;

select * from Cliente;

select Pet.nome,Pet.tipodeAnimal,Cliente.nome from Pet join Cliente on fkCliente = idCliente;

select * from Pet join Cliente on fkCliente = idCliente where idCliente = '2';

delete from Pet where idPet = 101;

select * from Pet;

-- drop table Pet;
-- drop table Cliente;



create database armazenaGastos;

use armazenaGastos;

create table Pessoa (
	idPessoa int primary key auto_increment,
	nome varchar(45),
    dtNasc date,
    profissao varchar (55)
);

create table Gasto (
	idGasto int primary key auto_increment,
    data datetime,
    valor decimal(7,2),
    descricao varchar(55)
);

insert into Pessoa (nome, dtNasc, profissao) values 
	('Loridete','1957-07-02','Dona do Lar'),
	('Ana Célia','1984-07-02','Professora'),
	('Adilson','1974-07-30','Autonomo'),
	('Lincoln','2000-06-19','Desempregado');


insert into Gasto (data,valor,descricao) values
('2022-04-03','11.89','Uber'),
('2022-04-02','100.00','Calça'),
('2022-04-02','10.31','Uber'),
('2022-04-05','9.91','Uber'),
('2022-03-29','93.87','Livro Trono de vidro v.4 e v5'),
('2022-03-01','13.00','Uber'),
('2022-03-05','200.00','Compra'),
('2022-04-03','300.89','Compra'),
('2022-04-09','50.00','Compra'),
('2022-04-15','70.31','Compra'),
('2022-04-16','35.91','Compra'),
('2022-03-25','100.87','Compra'),
('2022-03-27','200.00','Compra'),
('2022-04-04','100.00','Compra');

select * from Gasto;
select * from Pessoa;

select * from Gasto where valor > 10.00;

select * from Pessoa where dtNasc > 1980-05-01;

alter table Gasto add fkPessoa int, add foreign key (fkPessoa) references Pessoa(idPessoa); 

update Gasto set fkPessoa = 4 where idGasto <= 6;
update Gasto set fkPessoa = 1 where idGasto > 10;
update Gasto set fkPessoa = 2 where idGasto in (7,8); 
update Gasto set fkPessoa = 3 where idGasto in (9,10); 

desc Gasto;


select * from Pessoa join Gasto on fkPessoa = idPessoa;
select Pessoa.nome,Pessoa.profissao, Gasto.valor, Gasto.descricao from Pessoa join Gasto on fkPessoa = idPessoa where nome='Lincoln';

update Gasto set valor = 25.00 where idGasto = 6;

select * from Gasto;

delete from Gasto where idGasto = 6;



create database PraticaFuncionario;

use PraticaFuncionario;
create table setor(
	idSetor int primary key auto_increment,
    nome varchar(45),
    andar int
);
insert into setor(nome,andar) values
('Gestor','1'),
('Adm','2'),
('Gerente de Vendas','3');


create table funcionario(
	idFunc int primary key auto_increment,
    nome varchar(45),
    telefone char (12),
    salario decimal(7,2) check (salario > 0)

);


insert into funcionario(nome,telefone,salario) values
	('Lincoln','11972377400','10000.00'),
    ('Gabriel','1195234007','5000.00'),
    ('Cecilia','119244400','5500.00'),
    ('Ana','1299574006','4700.00'),
    ('Joao','1299580004','3700.00'),
    ('Miguel','156456454','2500.00');
create table Acompanhante (
	idAcompanhante int,
    nome varchar(45),
    relacao varchar(60),
    dtNasc date,
    fkFunc int,
    primary key(idAcompanhante, fkFunc),
    foreign key (fkFunc) references funcionario(idFunc)
);



alter table funcionario add column fkSetor int, add foreign key (fkSetor) references funcionario(idFunc);

insert into acompanhante values
 ('1','Tales','Amigo','2000-07-17','1'),
 ('2','Eduardo','Amigo','2000-03-20','2'),
 ('3','Patricia','Madrinha','1978-09-14','3'),
 ('4','Matheus','Amigo','2004-03-02','4'),
 ('5','Gabrielle','Amigo','2003-06-15','5'),
 ('6','Eduarda','Amigo','2003-09-04','6');
 
desc acompanhante;

update funcionario set fkSetor = 1 where idFunc in (1,2);
update funcionario set fkSetor = 2 where idFunc in (3,4);
update funcionario set fkSetor = 3 where idFunc in (5,6);

select * from setor;
select * from funcionario;
select * from acompanhante;

select funcionario.*, setor.* from funcionario join setor on idSetor = fkSetor;
select setor.nome, setor.andar, funcionario.nome as funcionario from funcionario join setor on idSetor = fkSetor; 

select * from setor join funcionario on idSetor = fkSetor where Setor.nome = 'Gestor';

select funcionario.nome, acompanhante.nome from funcionario join acompanhante on idFunc = fkFunc;

select funcionario.nome, acompanhante.* from funcionario join acompanhante on idFunc = fkFunc where Funcionario.nome="Lincoln";

select funcionario.nome, setor.nome, acompanhante.nome from funcionario join setor on idSetor = fkSetor join acompanhante on idFunc = fkFunc;

drop database PraticaFuncionario;



create database Treinador;

use Treinador;

create table Treinador (
	idTreinador int primary key auto_increment,
    nome varchar(45),
    telefone char(12),
    email varchar(45)
)auto_increment = 10;

alter table Treinador add fkOrientado int, add foreign key (fkOrientado) references Treinador(idTreinador);

desc treinador;

insert into Treinador(nome,telefone,email) values
('Ingrid','1140028922','ingrid@gmail.com'),
('Matheus','1140028422','matheus@gmail.com'),
('João','1140028921','joao@gmail.com'),
('Rafael','1144028921','rafael@gmail.com'),
('Diego','11400287771','diego@gmail.com');

update Treinador set fkOrientado = 10 where idTreinador = 13;
update Treinador set fkOrientado = 11 where idTreinador = 12;
update Treinador set fkOrientado = 12 where idTreinador = 11;
update Treinador set fkOrientado = 13 where idTreinador = 10;

select * from treinador;

create table nadador(
	idNadador int primary key auto_increment,
	nome varchar(45),
    estadoOrigem char(2),
    dtNasc date
    
)auto_increment = 101;

insert into nadador (nome,estadoOrigem,dtNasc) values 
	('Gustavo','MA','1980-03-17'),
	('Thiago','RJ','1995-05-07'),
    ('Fernando','AL','1989-09-10'),
    ('Fernanda','GO','1985-12-15'),
    ('Willian','ES','1996-07-27'),
    ('Roberta','BA','1999-12-31');

alter table nadador add fkTreinador int, add foreign key (fkTreinador) references Treinador(idTreinador);

update nadador set fkTreinador = 14 where idNadador = 101;
update nadador set fkTreinador = 14 where idNadador = 102;
update nadador set fkTreinador = 13 where idNadador = 103;
update nadador set fkTreinador = 12 where idNadador = 104;
update nadador set fkTreinador = 11 where idNadador = 105;
update nadador set fkTreinador = 10 where idNadador = 106;

select * from treinador;

select Treinador.nome, Nadador.nome from treinador join nadador on idTreinador=fkTreinador;

select Treinador.nome, nadador.* from treinador join nadador on idTreinador=fkTreinador where Treinador.nome = 'Diego';

select Treinador.nome, orientado.nome as orientado from treinador join treinador as orientado on orientado.idTreinador = Treinador.fkOrientado;

select Treinador.*, orientado.nome as orientado from treinador join treinador as orientado on orientado.idTreinador = Treinador.fkOrientado where orientado.nome = 'Ingrid';

select Treinador.*, orientado.nome as orientado, nadador.nome as nadador from treinador join treinador as orientado on orientado.idTreinador = Treinador.fkOrientado join nadador on Treinador.idTreinador = fkTreinador; 

select Treinador.nome, nadador.*, orientado.nome from treinador join nadador on idTreinador=fkTreinador join treinador as orientado on orientado.idTreinador = Treinador.fkOrientado;

drop table treinador;
drop table nadador;

