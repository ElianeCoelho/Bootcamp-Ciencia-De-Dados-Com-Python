-- drop database oficina;
create database oficina;
use oficina;
create table cliente(
	idCliente int auto_increment primary key,
    Nome varchar(45) not null,
	CPF int not null,
    Endereco varchar(45)
    );
    
create table veiculo(
	idVeiculo int auto_increment primary key,
    Placa varchar(45) not null,
    Proprietario varchar(45) not null,
    idCliente_veiculo int,
    constraint fk_idCliente_veiculo foreign key (idCliente_veiculo) references cliente(idCliente)
    );
    

    create table entrega(
	idEntrega int auto_increment primary key,
    Status_entrega enum('Em serviço', 'Cancelado', 'Feito') default 'Em Serviço',
    Liberacao bool not null
    );
    

create table ordem_de_servico(
	idOrdem_de_Servico int auto_increment primary key,
    Numero int,
    Data_de_Emissao date,
    Status_OS ENUM('Em progresso', 'Finalizado', 'Cancelado') default 'Em progresso',
    Data_de_Conclusao date,
    Valor_Total float not null,
    idEntrega_OS int,
    constraint fk_idEntrega_OS foreign key(idEntrega_OS) references entrega(idEntrega)
    );
    
    
    create table mao_de_obra_servico(
	idMao_de_Obra_Servico int auto_increment primary key,
    Descricao varchar(45),
    Valor_Peca float not null,
    idOrdem_de_Servico_mos int,
    constraint fk_idOrdem_de_Servico_mos foreign key (idOrdem_de_Servico_mos) references ordem_de_servico(idOrdem_de_Servico)
    );
    create table mecanico(
	idMecanico int auto_increment primary key,
    Codigo_ident int not null,
    Nome varchar(45) not null,
    Status_entrega ENUM('Em serviço', 'Cancelado', 'Feito') default 'Em Serviço',
    Liberacao bool not null,
    Especialidade varchar(45) not null,
    Endereco varchar(40),
    idMao_de_Obra_Serviço_mecanico int,
    constraint fk_idMao_de_Obra_Servico_mecanico foreign key (idMao_de_Obra_Serviço_mecanico) references mao_de_obra_servico(idMao_de_Obra_Servico),
    idOrdem_de_Servico_mecanico int,
    constraint fk_idOrdem_de_Servico_mecanico foreign key (idOrdem_de_Servico_mecanico) references ordem_de_servico(idOrdem_de_Servico)
    );
    
create table pedido(
	idPedido int auto_increment primary key,
    Descricao varchar(45),
    Data_de_Solicitacao date,
    Liberacao bool,
    idCliente_pedido int,
    idOrdem_de_Servico_pedido int,
    constraint fk_idCliente_pedido foreign key(idCliente_pedido) references cliente(idCliente),
    constraint fk_idOrdem_de_Servico_pedido foreign key(idOrdem_de_Servico_pedido) references ordem_de_servico(idOrdem_de_Servico)
    ); 
    
select * from pedido;

insert into ordem_de_servico (idOrdem_de_Servico, Numero, Data_de_Emissao, Status_OS, Data_de_Conclusao, Valor_Total) values 
	(1,'1524','2022-02-10','Finalizado','2022-03-08',1000),
    (2,'5687','2022-09-03','Em progresso','2022-09-18',3000);
    

select * from ordem_de_servico;

insert into entrega (idEntrega, Status_entrega, Liberacao) values
	(1,default,False),
    (2,'Cancelado',True);

select * from entrega;
