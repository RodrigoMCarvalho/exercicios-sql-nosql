SELECT max(salario) FROM funcionarios;
SELECT nome FROM funcionarios WHERE salario = 6200;

SELECT nome, salario FROM funcionarios WHERE salario = (
    SELECT max(salario) FROM funcionarios);
-----------------------------------------------
SELECT id, nome, salario FROM funcionarios ORDER BY salario DESC;

-- exibe o nome e salario do funcionario de ID = 5
SELECT nome, salario FROM funcionarios WHERE id = 5;

--exibe o nome e salario de todos os funcionarios que recebem mais que o ID = 5
SELECT nome, salario FROM funcionarios WHERE salario > (
    SELECT salario FROM funcionarios WHERE id = 5);

-------------------------------------------------

SELECT * FROM funcionarios;
SELECT * FROM setores;

SELECT f.nome, f.salario, s.setor_nome FROM funcionarios f
JOIN setores s ON s.setor_id = f.setor_id;

SELECT SUM(f.salario), s.setor_nome FROM funcionarios f
JOIN setores s ON s.setor_id = f.setor_id
GROUP BY s.setor_nome;

SELECT SUM(salario) FROM funcionarios WHERE setor_id = 2;
SELECT SUM(salario) FROM funcionarios GROUP BY setor_id ORDER BY SUM(salario) DESC;

SELECT SUM(salario) FROM funcionarios HAVING SUM(salario) > (
    SELECT SUM(salario) FROM funcionarios WHERE setor_id = 2) 
GROUP BY setor_id;

-------------------------------------------------

SELECT * FROM funcionarios ORDER BY salario DESC;
SELECT nome, salario FROM funcionarios WHERE nome LIKE 'D%';

-- < > só compara valores unicos, se a subquery retornar vários valores irá apresentar erro
-- Uma subquery no where deve retornar sempre apenas UM resultado.
SELECT nome, salario FROM funcionarios WHERE salario > (
    SELECT salario FROM funcionarios WHERE id = 5) ORDER BY salario DESC;

SELECT nome, salario FROM funcionarios WHERE salario > ANY (
    SELECT salario FROM funcionarios WHERE nome LIKE 'D%');

SELECT nome, salario FROM funcionarios WHERE salario > ALL (
    SELECT salario FROM funcionarios WHERE nome LIKE 'D%') ORDER BY salario DESC;

SELECT nome, salario FROM funcionarios WHERE salario IN (
    SELECT salario FROM funcionarios WHERE nome LIKE 'D%');

SELECT * FROM setores;

SELECT nome, salario FROM funcionarios WHERE setor_id = (
    SELECT setor_id FROM setores WHERE setor_nome = 'Financeiro');

SELECT nome, salario FROM funcionarios f1 WHERE salario = (
    SELECT MAX(salario) FROM funcionarios f2 WHERE f1.setor_id = f2.setor_id);

SELECT nome, salario, s.setor_nome AS setor FROM funcionarios f1 
JOIN setores s ON f1.setor_id = s.setor_id 
WHERE salario = (
    SELECT MAX(salario) FROM funcionarios f2 WHERE f1.setor_id = f2.setor_id
    );

SELECT f.nome, s.setor_nome FROM funcionarios f
RIGH JOIN setores s ON s.setor_id = f.setor_id;


SELECT setor_id, COUNT(*) FROM funcionarios
GROUP BYsetor_id
HAVING COUNT(setor_id) = (
    SELECT MAX (COUNT(setor_id))FROM funcionarios GROUP BY setor_id
    );

























