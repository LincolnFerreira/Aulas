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
		idNotaFiscal int auto_increment,
		fkVenda int,
		foreign key (fkVenda) references venda(idVenda),
		fkProduto int,
		foreign key (fkProduto) references produto(idProduto),
		primary key (idNotaFiscal, fkVenda, fkProduto),
		qtdProduto int, -- realmente não tive certeza absoluta quanto a colocar este campo aqui
		valorDesconto int
	);

	insert into NotaFiscal (idNotaFiscal, fkVenda, fkProduto, qtdProduto, valorDesconto) values 
		('1','12','2','5','2.00'),
		('2','11','3','5','5.00'),
		('3','10','4','5','3.00'),
		('4','9','5','1','1.00'),
		('5','8','6','6','4.00'),
		('6','7','7','5','7.00'),
		('7','6','8','4','5.00'),
		('8','5','9','3','3.00'),
		('9','4','10','2','2.00'),
		('10','3','11','1','4.00'),
		('11','2','12','5','1.00'),
		('12','1','13','4','3.00'),
		('13','12','13','3','4.00'),
		('14','11','10','2','3.00'),
		('15','10','9','1','1.00');
    
-- e) Exibir todos os dados de cada tabela criada, separadamente;
	select * from cliente;
	select * from produto;
	select * from NotaFiscal;
	select * from venda;

-- g)  Exibir os dados dos clientes e os dados de suas respectivas vendas;
	select cliente.nome, dtVenda, venda.total from cliente join venda on fkCliente = idCliente; 
    
-- h)  Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
	select cliente.nome, venda.* from cliente join venda on fkCliente = idCliente where idCliente = 2;
    
-- i)  Exibir os dados dos clientes e de suas respectivas indicações de clientes
	select cliente.nome, indicador.nome as 'indicador' from cliente join cliente as indicador on cliente.idCliente = indicador.fkIndicador; 
    
-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
	select cliente.nome, indicador.nome as 'indicador' from cliente join cliente as indicador on cliente.idCliente = indicador.fkIndicador where indicador.idCliente = 3;
    
-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
	select cliente.nome, indicador.nome as 'indicador', venda.dtVenda, venda.total, produto.nome, produto.descricao, produto.preco 
	from cliente join cliente as indicador on cliente.idCliente = indicador.fkIndicador 
				 join venda on indicador.idCliente = fkCliente 
				 join notaFiscal on fkVenda = idVenda  
				 join produto on idProduto = fkProduto;
  
  

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda. 
	select venda.dtVenda, produto.nome, produto.preco,NotaFiscal.qtdProduto 
	from venda join notaFiscal on idVenda = fkVenda
			   join produto on idProduto = fkProduto where idVenda = 2;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
-- VIVIAN TENTEI MUITO FAZER ISSO AQUI E ESPERO QUE ESTEJA CERTO =) <3 OBRIGADU (OBS: foi um chute no escuro)
	select venda.dtVenda, produto.nome, produto.preco, NotaFiscal.qtdProduto , (NotaFiscal.qtdProduto * produto.preco) as 'preço total'  
	from venda join notaFiscal on idVenda = fkVenda
			   join produto on idProduto = fkProduto;
 
-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda
	insert into cliente (nome,email,endereco) values 
		('Thanos','Thanos@sptech.school','Rua Marvel company');
    
	select cliente.*, venda.* from cliente left join venda on idCliente = fkCliente;

 -- drop database venda;
