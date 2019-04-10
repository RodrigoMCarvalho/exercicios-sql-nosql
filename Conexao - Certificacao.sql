CREATE TABLE funcionarios (
id NUMBER(11)NOT NULL PRIMARY KEY,
nome VARCHAR2(20),
salario NUMBER(10,2),
pct_comissao NUMBER(11),
gerente_id NUMBER(11),
setor_id NUMBER(11));

CREATE SEQUENCE id_funcionario_seq;

INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Felipe',3000,0.1,null,1);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Davi',2200,0.1,1,2);
INSERT INTO funcionarios (id,nome,salario,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Gustavo',2200,1,3);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Dorval',1800,0.1,1,2);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Tereza',2600,0.1,1,1);
INSERT INTO funcionarios (id,nome,salario,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Kunika',6200,null,null);
INSERT INTO funcionarios (id,nome,salario,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Joselir',5300,null,null);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Joseane',2000,0.1,6,2);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Isabel',1500,0.1,6,1);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Alexandre',2400,0.1,6,3);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Jennifer',2100,0.1,6,3);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Hilda',2200,0.1,7,2);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Joselita',3450,0.1,7,3);
INSERT INTO funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) VALUES (id_funcionario_seq.nextval,'Edson',4200,0.1,7,1);

SELECT * FROM funcionarios;

CREATE TABLE setores (
setor_id number(11) NOT NULL PRIMARY KEY,
setor_nome VARCHAR2(20));

CREATE SEQUENCE id_setor_seq;

INSERT INTO setores (setor_id,setor_nome) values (id_setor_seq.nextval,'Desenvolvimento');
INSERT INTO  setores (setor_id,setor_nome) values (id_setor_seq.nextval,'Financeiro');
INSERT INTO  setores (setor_id,setor_nome) values (id_setor_seq.nextval,'Comercial');
INSERT INTO  setores (setor_id,setor_nome) values (id_setor_seq.nextval,'Vendas');

SELECT * FROM setores;

SELECT f.nome, f.salario,s.setor_nome FROM funcionarios f
JOIN setores s ON f.setor_id = s.setor_id;

