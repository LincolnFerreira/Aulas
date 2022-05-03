CREATE DATABASE Venda;

USE Venda;

create table cliente (
    idCliente int PRIMARY KEY auto_increment,
    nome varchar(45),
    email varchar(60),
    endereco varchar(45)
);


insert into cliente (nome,email,endereco) values
    ('Lincoln','lincoln.carmo@sptech.school','Rua Lópes Silva'),
    ('Rafael','rafael@sptech.school','Rua Nunes Valente'),
    ('Vivian','vivian@sptech.school','Travessa Pavão'),
    ('Paulo','paulo@sptech.school','Travessa Seis'),
    ('Fernando','fernando@sptech.school','Rua Bela Cintra'),
    ('Monica','monica@sptech.school','Rua Ipiranga'),
    ('Rover','rover@sptech.school','Passagem Liberdade');

alter table cliente add fkIndicador int, add foreign key (fkIndicador) references cliente(idCliente);

update cliente set fkIndicador = 7 where idCliente = 1;
update cliente set fkIndicador = 6 where idCliente = 2;
update cliente set fkIndicador = 5 where idCliente = 3;
update cliente set fkIndicador = 4 where idCliente = 1;
update cliente set fkIndicador = 3 where idCliente = 5;
update cliente set fkIndicador = 2 where idCliente = 6;
update cliente set fkIndicador = 1 where idCliente = 7;


create table venda(
    idVenda int PRIMARY KEY AUTO_INCREMENT,
    total decimal(6,2),
    dtVenda date
);

insert into venda (total,dtVenda) values
    ('75.00','2022/03/12'),
    ('5.00','2022/01/03'),
    ('70.31','2022/04/01'),
    ('243.00','2022/04/02'),
    ('18.00','2022/04/17'),
    ('41.00','2022/04/21'),
    ('15.00','2022/04/21'),
    ('288.00','2022/04/30'),
    ('71.00','2022/02/11'),
    ('35.00','2022/02/13'),
    ('47.00','2022/02/07'),
    ('12.00','2022/02/08'),
    ('17.50','2022/02/28'),
    ('3.50','2022/01/30');

select * from venda;
alter table venda add fkCliente int, add foreign key (fkCLiente) references cliente(idCliente);

update venda set fkCliente = 7 where idVenda = 1;
update venda set fkCliente = 6 where idVenda = 2; 
update venda set fkCliente = 5 where idVenda = 3; 
update venda set fkCliente = 4 where idVenda = 4; 
update venda set fkCliente = 3 where idVenda = 5; 
update venda set fkCliente = 2 where idVenda = 6; 
update venda set fkCliente = 1 where idVenda = 7; 
update venda set fkCliente = 1 where idVenda = 8; 
update venda set fkCliente = 2 where idVenda = 9; 
update venda set fkCliente = 3 where idVenda = 10;
update venda set fkCliente = 7 where idVenda = 11; 
update venda set fkCliente = 4 where idVenda = 12; 
update venda set fkCliente = 5 where idVenda = 13; 
update venda set fkCliente = 5 where idVenda = 14; 


create table produto(
    idProduto int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(45),
    descricao varchar(60),
    preco decimal(6,2)
);

insert into produto (nome, descricao, preco) values 
    ('Alface','Saladas','1.39'),
    ('Carne Moída de 1°','Carnes','42.00'),
    ('Cenoura','Vegetal','1.57'),
    ('Cebola','Hortaliça','1.29'),
    ('Detergente','Limpeza','4.29'),
    ('Oleo','Gordura','6.00'),
    ('Mortadela','Frios','22.70'),
    ('Pão Francês','Massa','6.00'),
    ('Sal','Sódio','3.00'),
    ('Tomate','Fruta','1.57'),
    ('Shampoo','Higiene','8.00'),
    ('Açúcar','Carboidrato','7.99'),
    ('Creme dental','Higiene','3.70');

create table NotaFiscal(
    idNotaFiscal int,
    fkVenda int,
    foreign key (fkVenda) references venda(idVenda),
    fkProduto int,
    foreign key (fkProduto) references produto(idProduto),
    primary key (idNotaFiscal, fkVenda, fkProduto)
);

insert into NotaFiscal (idNotaFiscal, fkVenda, fkProduto) values 
	('1','12','2'),
	('2','11','3'),
	('3','10','4'),
	('4','9','5'),
	('5','8','6'),
	('6','7','7'),
	('7','6','8'),
	('8','5','9'),
	('9','4','10'),
	('10','3','11'),
	('11','2','12'),
	('12','1','13'),
	('13','12','13'),
	('14','11','10'),
	('15','10','9'),
	('16','9','8'),
	('17','8','7'),
	('18','7','6'),
	('19','6','5'),
	('20','5','4'),
	('21','4','3'),
	('22','3','2'),
	('23','3','2'),
	('24','3','2'),
	('25','3','2'),
	('26','3','2'),
	('27','3','2'),
	('28','3','2'),
	('29','2','1'),
	('30','1','7');
    
    
select * from cliente;
select * from produto;
select * from NotaFiscal;
select * from venda;

select cliente.nome, dtVenda, venda.total from cliente join venda on fkCliente = idCliente; 

select cliente.nome, venda.* from cliente join venda on fkCliente = idCliente where idCliente = 2;

select cliente.nome, indicador.nome from cliente join cliente as indicador on cliente.idCliente = indicador.fkIndicador; 

select cliente.nome, indicador.nome from cliente join cliente as indicador on cliente.idCliente = indicador.fkIndicador where indicador.idCliente = 3;

select cliente.nome, indicador.nome as indicador, venda.dtVenda, venda.total, produto.nome, produto.descricao, produto.preco from cliente left join cliente as indicador on cliente.idCliente = indicador.fkIndicador join venda on cliente.idCliente = fkCliente join notaFiscal on fkVenda = idVenda  join produto on idProduto = fkProduto;

select venda.dtVenda, produto.nome from venda join NotaFiscal on idVenda = fkVenda join produto on idProduto = fkProduto where idVenda = 2; 

select produto.nome, produto.preco from produto;

