CREATE DATABASE Venda;

USE Venda;

create table cliente (
    idCliente int PRIMARY KEY AUTO_INCREMENT;
    nome varchar(45),
    email varchar(60),
    endereco varchar(45)
);

alter table cliente add fkIndicador, foreign key (fkIndicador) references cliente(idCliente);

create table Venda(
    idVenda int PRIMARY KEY AUTO_INCREMENT,
    total decimal(6,2),
    dtVenda date,
);

alter table Venda add fkCliente, foreign key (fkCLiente) references cliente(idCliente),

create table produto(
    idProduto int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(45),
    descricao varchar(45),
    preco decimal(6,2)
);

create table NotaFiscal(
    idNotaFiscal int PRIMARY KEY auto_increment,
    fkVenda FOREIGN key REFERENCES

);