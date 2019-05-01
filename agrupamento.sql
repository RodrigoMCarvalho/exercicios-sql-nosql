drop table funcionarios;

create table funcionarios (
id number(11) not null primary key,
nome varchar2(20),
salario number(10,2),
pct_comissao number(10,2),
setor_id number(11)
);

insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (1,'Felipe',3000,0.1,1);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (2,'Davi',2200,0.1,2);
insert into funcionarios (id,nome,salario,setor_id) values (3,'Gustavo',2200,3);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (4,'Dorval',1800,0.1,2);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (5,'Tereza',2600,0.1,1);
insert into funcionarios (id,nome,salario,setor_id) values (6,'Kunika',6200,1);
insert into funcionarios (id,nome,salario,setor_id) values (7,'Joselir',5300,2);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (8,'Joseane',2000,0.1,2);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (9,'Isabel',1500,0.1,1);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (10,'Alexandre',2400,0.1,3);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (11,'Jennifer',2100,0.1,3);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (12,'Hilda',2200,0.1,2);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (13,'Joselita',3450,0.1,3);
insert into funcionarios (id,nome,salario,pct_comissao,setor_id) values (14,'Edson',4200,0.1,1);

select * from funcionarios;

------------------------------
SELECT * FROM setores;

SELECT AVG(salario) FROM funcionarios 
GROUP BY setor_id;

SELECT f.nome, s.setor_nome  FROM funcionarios f
JOIN setores s ON s.setor_id = f.setor_id;

SELECT s.setor_nome as setor, AVG(salario) as media FROM funcionarios f
RIGHT JOIN setores s ON s.setor_id = f.setor_id
GROUP BY s.setor_nome;

-------calcular a comissão mais o salario ---------

--quando o registro tiver NULL sempre o resultado será NULL
SELECT nome,(salario + salario * pct_comissao) FROM funcionarios;

--ignora o NULL
SELECT nome,salario + salario * NVL(pct_comissao, 0) FROM funcionarios;

SELECT AVG(salario + salario * NVL(pct_comissao, 0)) FROM funcionarios;

SELECT COUNT(salario) FROM funcionarios;

SELECT COUNT(DISTINCT salario) FROM funcionarios;

SELECT COUNT(id) FROM funcionarios;

--funcionarios por setor---
SELECT COUNT(id) FROM funcionarios GROUP BY setor_id;

--Essa query nos retorna a quantidade de caracteres diferentes que iniciam o nome dos funcionários
SELECT COUNT(DISTINCT SUBSTR(nome, 1,1)) FROM funcionarios;

--------------------------------------------------
--
SELECT MAX(salario) as Maior, MIN(salario) as Menor FROM funcionarios;

SELECT MAX(salario) as Maior, MIN(salario) as Menor FROM funcionarios GROUP BY setor_id;

SELECT s.setor_nome as Setor, MAX(salario) as Maior, MIN(salario) as Menor FROM funcionarios f
JOIN setores s ON s.setor_id = f.setor_id
GROUP BY s.setor_nome;

SELECT MAX(COUNT(*)) FROM funcionarios GROUP BY cargo_id, setor_id;

--------------------------------------------------
SELECT * FROM funcionarios;

SELECT SUM(salario) FROM funcionarios;

-- SUM quando existe uma conta e valores NULL, esses registros são ignorados
SELECT SUM(salario + salario * pct_comissao) FROM funcionarios;

--adicionando NVL as colunas com valores NULL são somados
SELECT SUM(salario + salario * NVL(pct_comissao, 0)) FROM funcionarios;

--------------------------------------------------

SELECT AVG(salario) FROM funcionarios;

--pega o salário do meio pela ordem crescente, não é média
SELECT MEDIAN(salario) FROM funcionarios;

--------------------------------------------------

SELECT nome, salario FROM funcionarios;

SELECT AVG(salario) FROM funcionarios;

-- função ROUND para arredondar
SELECT ROUND(AVG(salario), -1) FROM funcionarios;
SELECT ROUND(AVG(salario), -2) FROM funcionarios;

-- STDDEV é uma função que retorna o desvio padrão de um conjunto de números. 
SELECT STDDEV(salario) FROM funcionarios;
SELECT ROUND(STDDEV(salario)) FROM funcionarios;

SELECT (ROUND(AVG(salario)) + ROUND(STDDEV(salario))) as Maximo, 
       (ROUND(AVG(salario)) - ROUND(STDDEV(salario))) as Minimo FROM funcionarios;

--Desvio Padrão é a raiz quadrada da VARIANCE      
SELECT VARIANCE(salario) FROM funcionarios;
SELECT SQRT(VARIANCE(salario)) as DesvioPadrao FROM funcionarios;

SELECT ROUND(SQRT(VARIANCE(salario))) as DesvioPadrao FROM funcionarios;



