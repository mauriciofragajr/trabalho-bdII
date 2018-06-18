
INSERT INTO estado(sigla,nome) VALUES('RJ','Rio de Janeiro');
INSERT INTO estado(sigla,nome) VALUES('SP','São Paulo');
INSERT INTO estado(sigla,nome) VALUES('MG','Minas Gerais');

INSERT INTO cidade (estado_id, nome) VALUES(1,'Rio de Janeiro');
INSERT INTO cidade (estado_id, nome) VALUES(1,'Niterói');

SELECT * FROM cidade;

INSERT INTO bairro (cidade_id,nome) VALUES (1,'Méier');
INSERT INTO bairro (cidade_id,nome) VALUES (1,'Taquara');
INSERT INTO bairro (cidade_id,nome) VALUES (1,'Del Castilho');
INSERT INTO bairro (cidade_id,nome) VALUES (1,'Grajaú');
INSERT INTO bairro (cidade_id,nome) VALUES (1,'Centro');
INSERT INTO bairro (cidade_id,nome) VALUES (1,'Ilha do Governador');

INSERT INTO bairro (cidade_id,nome) VALUES (2,'Boa Viagem');
INSERT INTO bairro (cidade_id,nome) VALUES (2,'Ingá');
INSERT INTO bairro (cidade_id,nome) VALUES (2,'São Domingos');
INSERT INTO bairro (cidade_id,nome) VALUES (2,'Centro');
INSERT INTO bairro (cidade_id,nome) VALUES (2,'Icaraí');

SELECT bairro.nome, cidade.nome FROM bairro INNER JOIN cidade on cidade.cidade_id = bairro.cidade_id;
SELECT * FROM bairro;

INSERT INTO faculdade (nome, sigla) VALUES ('Universidade Federal Fluminense','UFF');
INSERT INTO faculdade (nome, sigla) VALUES ('Universidade Federal do Rio de Janeiro','UFRJ');

SELECT * FROM faculdade;

INSERT INTO usuario_tipo (nome) VALUES ('Aluno'),('Professor'),('Servidor');
SELECT * FROM usuario_tipo;

INSERT INTO campus (faculdade_id,bairro_id,nome) VALUES (1,10,'Praia Vermelha'),(1,13,'Valonguinho'),(1,12,'Gragoatá');
INSERT INTO campus (faculdade_id,bairro_id,nome) VALUES (2,17,'Praia Vermelha');

SELECT * FROM campus;

INSERT INTO carona_status (nome) VALUES ('ABERTA'),('FECHADA'),('INICIADA'),('REALIZADA'),('CANCELADA');

SELECT * FROM carona_status;

INSERT INTO usuario (nome,whatsapp) VALUES ('José Mauricio','21991346707');
UPDATE usuario SET faculdade_id = 1, usuario_tipo_id = 1 WHERE usuario_id = 1;
INSERT INTO usuario (nome,whatsapp,faculdade_id,usuario_tipo_id) VALUES ('Motorista','21991346708',1,1);

SELECT * FROM usuario;

INSERT INTO carro (placa,modelo,cor,usuario_id) VALUES ('KKK0000','Fiat Palio','Preto',2);

SELECT * FROM carro;

INSERT INTO carona (usuario_id,
					hora_saida,
					carona_status_id,
					valor,
					vagas_qtd,
					campus_id,
					bairro_id,
					carro_id,
					indo_para_faculdade) VALUES 
					(2,'2018-05-23 15:00:00',1,600,4,7,1,4,true);
					
SELECT * FROM carona;

INSERT INTO carona_participa (usuario_id,carona_id) VALUES (2,11);

SELECT * FROM carona_participa;

SELECT * FROM usuario where usuario_id not in (select usuario_id from carona);