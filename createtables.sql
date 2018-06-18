create table estado (
	estado_id serial primary key,
	sigla varchar(2) NOT NULL UNIQUE,
	nome varchar(20) NOT NULL
);

create table cidade(
	cidade_id serial primary key,
	nome varchar(50) NOT NULL,
	estado_id int references estado(estado_id) NOT NULL
);

create table bairro(
	bairro_id serial primary key,
	cidade_id int references cidade(cidade_id) NOT NULL,
	nome varchar(50) NOT NULL,
	UNIQUE (cidade_id,nome)
);

create table faculdade(
	faculdade_id serial primary key,
	nome varchar(200) NOT NULL,
	sigla varchar(10) NOT NULL
);

create table usuario_tipo(
	usuario_tipo_id serial primary key,
	nome varchar(100) UNIQUE NOT NULL
);

create table campus(
	campus_id serial primary key,
	faculdade_id int references faculdade(faculdade_id),
	bairro_id int references bairro(bairro_id),
	nome varchar(100) NOT NULL,
	UNIQUE(nome,faculdade_id)
);

create table carona_status(
	carona_status_id serial primary key,
	nome varchar(15) UNIQUE NOT NULL
);

create table usuario(
	usuario_id serial primary key,
	nome varchar(300) NOT NULL,
	whatsapp varchar(11) NOT NULL,
	faculdade_id int references faculdade(faculdade_id),
	usuario_tipo_id int references usuario_tipo(usuario_tipo_id)
);

create table carro(
	carro_id serial primary key,
	placa varchar(7) UNIQUE,
	modelo varchar(50) NOT NULL,
	cor varchar(20) NOT NULL,
	usuario_id int references usuario(usuario_id) NOT NULL
);

create table carona(
	carona_id serial primary key,
	usuario_id int references usuario(usuario_id) NOT NULL,
	carro_id int references carro(carro_id) NOT NULL,
	hora_saida timestamp NOT NULL,
	valor int NOT NULL,
	vagas_qtd int NOT NULL,
	bairro_id int references bairro(bairro_id) NOT NULL,
	campus_id int references campus(campus_id) NOT NULL,
	indo_para_faculdade bool NOT NULL,
	carona_status_id int references carona_status(carona_status_id) NOT NULL,
	criado_em timestamp DEFAULT now()
);

create table carona_participa(
	carona_id int references carona(carona_id) NOT NULL,
	usuario_id int references usuario(usuario_id) NOT NULL,
	avaliacao int,
	primary key(usuario_id, carona_id)
);
