SELECT * FROM funcionarios;

--traz somente registros que possuem igualdade entre as tabelas
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

--traz todos registros da direita do relacionamento
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

SELECT nome, salario,setor_nome FROM funcionarios f
JOIN setores 
USING(setor_id);

SELECT nome, salario,setor_nome FROM funcionarios f
LEFT JOIN setores 
USING(setor_id);

SELECT nome, salario,setor_nome FROM funcionarios f
FULL JOIN setores 
USING(setor_id);

--NATURAL JOIN junta as tabelas deduzindo a relação entre tabelas
--NÃO é possivel usar USING e NATURAL JOIN juntos
SELECT nome, salario,setor_nome FROM funcionarios f
NATURAL JOIN setores;

SELECT nome, salario,setor_nome FROM funcionarios f
NATURAL FULL JOIN setores;

