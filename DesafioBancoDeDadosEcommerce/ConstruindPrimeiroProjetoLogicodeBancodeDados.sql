
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table cliente(
		idCliente int auto_increment primary key,
        Nome_Completo varchar(45),
        CPF char(11) not null,
        constraint unique_cpf_cliente unique(CPF),
        Data_de_nascimento date not null,
		Email varchar(45) not null,
        Telefone_1 char(11) not null,
        Telefone_2 char(11),
        Logradouro char(3) not null,
        Endereco varchar(45) not null,
        Numero_Residencial int,
        Bairro varchar(45) not null,
        Complemento varchar(45),
        Cidade varchar (45) not null,
        Estado char(2) not null,
        CEP char(8)
);


alter table cliente auto_increment=1;

-- criar tabela produto
create table produto(
		idProduto int auto_increment primary key,
        Nome varchar(45),
        Categoria ENUM('Audio e Video',' Automotivo','Bebês','Beleza e Perfumaria',
						'Brinquedos','Cama, Mesa e Banho','Casa e Contrução',
                        'Celular e Smartphone','Decoração','Eletrodomésticos',
                        'Esporte e Lazer','Ferramentas','Games','Informática',
                        'Livros','Moda','Móveis','Papelaria','Pet Shop','Relógios',
                        'TVs' ) not null,
		Descricao varchar(200) not null,
        Preco_unitario float not null,
        Possui_garantia_estendida enum('Sim','Não'),
        Avaliacao float default 0,
        Dimensoes varchar(10)
);


-- criar tabela Empresa de Frete
create table empresa_frete(
		idEmpresa_frete int auto_increment primary key,
        Razao_social varchar(45) not null,
        Nome_fantasia varchar(45) not null,
        CNPJ char(14) not null,
        constraint unique_cnpj_empresa unique(CNPJ),
        Responsavel varchar(45) not null,
        Email_1 varchar(45) not null,
        Email_2 varchar(45),
        Telefone_1 char(11) not null,
        Telefone_2 char(11)
);


-- criar tabela Entrega
create table entrega(
		idEntrega int auto_increment primary key,
        idEntregaEmpresa_frete int,
        Codigo_rastreio varchar(45) not null,
        Status_entrega ENUM('Separado pelo fornecedor','Saiu do centro de distribuição', 
							'A caminho da sua cidade','Na rota de entrega', 'Entregue') not null,
        Prazo_entrega date not null,
        Valor_frete float not null,
        constraint fk_empresa_entrega foreign key (idEntregaEmpresa_frete) references empresa_frete(idEmpresa_frete)
);

create table carteira_digital(
		idCarteira_digital int auto_increment primary key,
        Numero_carteira varchar(45) not null,
        constraint unique_numero_carteira unique (Numero_carteira),
        Data_adesão date not null,
        Valor_em_conta float not null,
        Valor_de_cashback float not null
);


-- criar tabela pagamento cartão
create table pagamento_cartao(
		idPagamento_cartao int auto_increment primary key,
        Nome_completo_titular varchar(60) not null,
        Numero_cartao char(16) not null,
        Bandeira_cartao ENUM('VISA','MASTERCARD','ELO','MAESTRO','AMERICAN EXPRESS','HIPERCARD') not null,
        Data_validade date not null,
        CPF_CNPJ_titular varchar(15)
);


-- criar tabela de Conta
create table conta(
		idConta int auto_increment primary key,
        idContaCliente int,
        Tipo_conta varchar(60) not null,
        CPF char(11),
        CNPJ char(14),
        Data_fundacao date,
        Data_anivesario date,
        Atividade_economica varchar(60),
        Profissao varchar(60),
        constraint fk_conta_cliente foreign key (idContaCliente) references cliente(idCliente)
);


-- criar tabela de Formas de Pagamento
create table formas_pagamento(
		idFormas_pagamento int auto_increment primary key,
        idFormas_pagamento_cliente int,
        idFormas_pagamento_pagamento_cartao int,
        idFormas_pagamento_carteira_digital int,
        Pix varchar(45),
        Boleto varchar(255),
        Transferencia_bancaria varchar(255),
        constraint fk_Formas_pagamento_cliente foreign key (idFormas_pagamento_cliente) references cliente(idCliente),
        constraint fk_Formas_pagamento_cartao foreign key (idFormas_pagamento_pagamento_cartao) references pagamento_cartao(idPagamento_cartao),
        constraint fk_Formas_carteira_digital foreign key (idFormas_pagamento_carteira_digital) references carteira_digital(idCarteira_digital)
);


-- criar tabela pedido
create table pedido(
		idPedido int auto_increment primary key,
        idPedidoCliente int,
        idPedidoEntrega int,
        idPedidoFormas_pagamento int,
        Status_do_pedido enum('Cancelado','Em andamento','Processando','Enviado','Entregue') default 'Processando',
        Descricao varchar(120) not null,
        Data_do_pedido date not null,
        constraint fk_pedido_cliente foreign key (idPedidoCliente) references cliente(idCliente),
        constraint fk_pedido_entrega foreign key (idPedidoEntrega) references entrega(idEntrega),
        constraint fk_pedido_formas_pagamento foreign key (idPedidoFormas_pagamento) references formas_pagamento(idFormas_pagamento)
);


-- criar tabela Estoque
create table estoque(
		idEstoque int auto_increment primary key,
        Local_estoque varchar(45) not null,
        Responsavel varchar(45) not null,
        Email_1 varchar(45) not null,
        Email_2 varchar(45),
        Telefone_1 char(11) not null,
        Telefone_2 char(11)
);


-- criar tabela Fornecedor
create table fornecedor(
		idFornecedor int auto_increment primary key,
        Razao_social varchar(45) not null,
        Nome_fantasia varchar(45) not null,
        CNPJ char(14) not null,
        constraint unique_fornecedor unique (CNPJ),
        Responsavel varchar(45) not null,
        Endereco_fornecedor varchar(100),
        Contato_email_1 varchar(45) not null,
        Contato_email_2 varchar(45),
        Contato_telefone_1 char(11) not null,
        Contato_telefone_2 char(11)
);


-- criar tabela Terceiro - Vendedor
create table vendedor(
		idVendedor int auto_increment primary key,
        Razao_social varchar(45) not null,
        Nome_fantasia varchar(45),
        CPF_CNPJ varchar(15) not null,
        constraint unique_vendedor unique (CPF_CNPJ),
        Local_vendedor varchar(45),
        Nome_vendedor varchar(45) not null,
        Email_1 varchar(45) not null,
        Email_2 varchar(45),
        Telefone_1 char(11) not null,
        Telefone_2 char(11)
);


-- criar tabela produto/pedido
create table produto_pedido(
		idPeProduto int,
        idPePedido int,
        Quantidade_produto int default 1,
        Status_pp ENUM('Disponivel', 'Sem estoque') default 'Disponivel' not null,
        primary key (idPeProduto, idPePedido),
        constraint fk_produto_vendedor foreign key (idPeProduto) references produto(idProduto),
        constraint fk_produto_produto foreign key (idPePedido) references pedido(idPedido)
);


-- criar tabela produto_vendedor
create table produto_vendedor(
		idVeVendedor int,
        idVeProduto int,
        Quantidade_produto int default 1,
        primary key (idVeVendedor, idVeProduto),
        constraint fk_vendedor_vendedor foreign key (idVeVendedor) references vendedor(idVendedor),
        constraint fk_vendedor_produto foreign key (idVeProduto) references produto(idProduto)
);


-- criar tabela produto_fornecedor
create table produto_fornecedor(
		idFoFornecedor int,
        idFoProduto int,
        primary key (idFoFornecedor, idFoProduto),
        constraint fk_fornecedor_fornecedor foreign key (idFoFornecedor) references fornecedor(idFornecedor),
        constraint fk_fornecedor_produto foreign key (idFoProduto) references produto(idProduto)
);

-- criar tabela produto_em_estoque
create table produto_em_estoque(
		idEsEstoque int,
        idEsProduto int,
        Quantidade_estoque int not null,
        primary key (idEsEstoque, idEsProduto),
        constraint fk_estoque_estoque foreign key (idEsEstoque) references estoque(idEstoque),
        constraint fk_estoque_produto foreign key (idEsProduto) references produto(idProduto)
);

desc produto_em_estoque;

show tables;
show databases;

SELECT * FROM cliente;

select count(*) from cliente;

select * from cliente c, pedido o where c.idCliente = idPedidoCliente;

select count(*) from cliente c, pedido o 
			where c.idCliente = o.idPedidoCliente;
            
select * from cliente inner join pedido ON	idCliente = idPedidoCliente
 				inner join produto on idPedido = idPedido;