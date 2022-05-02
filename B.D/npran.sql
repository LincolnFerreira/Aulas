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

insert into cliente (fkIndicador) values 
    ('7'),
    ('6'),
    ('5'),
    ('1'),
    ('3'),
    ('2'),
    ('1');

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

insert into venda (fkCliente) values
    ('1'),
    ('2'),
    ('3'),
    ('4'),
    ('5'),
    ('6'),
    ('7'),
    ('7'),
    ('6'),
    ('5'),
    ('4'),
    ('3'),
    ('2'),
    ('1');

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

select cliente.nome , venda.* from cliente join venda on fkCliente = idCliente; 