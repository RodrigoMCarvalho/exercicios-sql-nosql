SELECT * FROM funcionarios;

--traz somente registros que possuem corrspondências entre as tabelas ( INNER JOIN )
SELECT nome, salario,setor_nome FROM funcionarios f
JOIN setores s 
ON s.setor_id = f.setor_id;

--equivalente ao INNER JOIN
SELECT nome, salario, setor_nome FROM funcionarios f, setores s
WHERE f.setor_id = s.setor_id;

--traz todos registros da esquerda do relacionamento( funcionarios LEFT JOIN setores)
SELECT nome, salario,setor_nome FROM funcionarios f
LEFT JOIN setores s 
ON s.setor_id = f.setor_id;

--equivalente ao LEFT JOIN
SELECT nome, salario, setor_nome FROM funcionarios f, setores s
WHERE s.setor_id(+) = f.setor_id;

--traz todos registros da direita do relacionamento ( funcionarios RIGHT JOIN setores)
SELECT nome, salario,setor_nome FROM funcionarios f
RIGHT JOIN setores s 
ON s.setor_id = f.setor_id;

--equivalente ao RIGHT JOIN
SELECT nome, salario, setor_nome FROM funcionarios f, setores s
WHERE s.setor_id = f.setor_id(+);

--traz todos registros do relacionamento ( combinação do LEFT, RIGHT e INNER JOIN )
SELECT nome, salario,setor_nome FROM funcionarios f
FULL JOIN setores s 
ON s.setor_id = f.setor_id;

-------- USING --------

SELECT nome, salario,setor_nome FROM funcionarios 
JOIN setores 
USING(setor_id);

SELECT nome, salario,setor_nome FROM funcionarios 
LEFT JOIN setores 
USING(setor_id);

SELECT nome, salario,setor_nome FROM funcionarios 
FULL JOIN setores 
USING(setor_id);

--NATURAL JOIN junta as tabelas deduzindo a relação entre tabelas
--NÃO é possivel usar USING e NATURAL JOIN juntos
SELECT nome, salario,setor_nome FROM funcionarios f
NATURAL JOIN setores;

SELECT nome, salario,setor_nome FROM funcionarios f
NATURAL FULL JOIN setores;

--------------------------------------
--SELF JOIN - join para a mesma tabela
SELECT f.nome , g.nome as gerente FROM funcionarios f
JOIN funcionarios g 
ON f.gerente_id = g.id;

--------------------------------------
--UNION ALL - junto duas queries. O numero de colunas(nome no ex abaixo) tem que ser o mesmo
SELECT nome FROM funcionarios WHERE setor_id = 2
UNION ALL
SELECT nome FROM funcionarios WHERE nome LIKE 'D%';

--Traz somente os resultados comuns nas duas queries (interseção)
SELECT nome FROM funcionarios WHERE setor_id = 2
INTERSECT
SELECT nome FROM funcionarios WHERE nome LIKE 'D%';

--Traz somente a diferença
SELECT nome FROM funcionarios WHERE setor_id = 2
MINUS
SELECT nome FROM funcionarios WHERE nome LIKE 'D%';











