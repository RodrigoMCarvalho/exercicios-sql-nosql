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

















