--importe do schema do banco
@C:\Users\rodri_000\Desktop\DesenvolvimentoWeb\SQL\sql1br.sql

desc aluno;
desc matricula;

--todos os alunos
select nome from aluno;

--alunos que não estão matriculados em nenhum curso
select a.nome from aluno a
where not exists (
select m.id from matricula m
where m.aluno_id = a.id);

--alunos que estão matriculados em cursos
select a.nome from aluno a 
where exists (
select m.id from matricula m 
where m.aluno_id = a.id);

--alunos que estão matriculados em cursos e seus respectivos cursos
select a.nome as nome_aluno, c.nome as curso from aluno a
join matricula m 
on m.aluno_id = a.id
join curso c
on c.id = m.curso_id;

--tabela Matricula é a ligação entre Aluno e Curso (ManyToMany)

select count(*) from aluno;

select * from exercicio;

--exercicios não respondidos
select * from exercicio e
where not exists (
select r.id from resposta r
where r.exercicio_id = e.id);

-- query para saber os cursos que não tem alunos matriculados--
select c.nome from curso c where not exists (
select m.id from matricula m where m.curso_id = c.id);


select a.nome from aluno a
join matricula m
on a.id = m.aluno_id
group by a.nome;


select a.nome from aluno a where not exists (
select m.id from matricula m
where m.aluno_id = a.id);

select * from matricula;

--alunos que tiveram matriculas no ultimo ano
-- data atual (select sysdate from dual)
-- subtrair o intervalo de 1 ano (- interval '1' year)
select a.id, a.nome from aluno a where exists (
select m.id from matricula m
where m.aluno_id = a.id
and m.data > (select sysdate - interval '1' year from dual));

desc nota;
desc resposta;
desc exercicio;
desc secao;
desc curso;

--media das notas dos cursos
select c.nome, avg(n.nota) media from nota n      -- selecionar as notas e media
    join resposta r on r.id = n.resposta_id       --associar as respostas com a nota
    join exercicio e on e.id = r.exercicio_id     --associar as exercicios com a respostas
    join secao s on s.id = e.secao_id             --associar a secão
    join curso c on c.id = s.curso_id             --associar o curso
group by c.nome;                                  --agrupar por nome do curso

--quantidade de exercicios por curso
select count(e.id) as " Qto de exercicios", c.nome as "Curso" from exercicio e
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
group by c.nome order by count(e.id) desc;

--quantidade de alunos por curso
select c.nome as curso, count(a.id) as alunos from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on a.id = m.aluno_id
group by c.nome order by count(a.id) desc;

select nome from aluno;

--Selecionar o curso e as médias de notas, levando em conta somente alunos que tenham "Silva" ou "Santos" no sobrenome
select c.nome, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on a.id = r.aluno_id
where a.nome like '%Santos%' or a.nome like '%Silva%'
group by c.nome;


















