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

desc nota;
desc resposta;
desc exercicio;
desc secao;
desc curso;

select * from resposta;

--quantidade de respostas por exercício. Exibindo a pergunta e o número de respostas.
select count(r.id) as quantidade, e.pergunta from exercicio e
join resposta r on r.id = e.id
group by e.pergunta 
order by count(r.id) desc;

desc nota;
desc resposta;
desc exercicio;
desc secao;
desc curso;

--A média de notas por aluno por curso, podemos fazer GROUP BY aluno.nome, curso.nome.
select a.nome, c.nome as curso, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on a.id = r.aluno_id
group by a.nome, c.nome;

select a.nome, c.nome as curso, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on a.id = r.aluno_id
group by a.nome, c.nome
having avg(n.nota) < 5;

select count(a.id), c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id
group by c.nome
having count(a.id) > 3;

--Exiba todos os cursos e a sua quantidade de matrículas. Mas exiba somente cursos que tenham mais de 1 matrícula.
select c.nome, count(m.id) as quantidade from curso c
    join matricula m on m.curso_id = c.id
group by c.nome
having count(m.id) > 1;

select c.nome, count(s.id) from curso c
    join secao s on s.curso_id = c.id
group by c.nome
having count(s.id) > 3;

select distinct tipo from matricula;

select c.nome, m.tipo, count(m.id) as quantidade from matricula m
    join curso c on c.id = m.curso_id
where m.tipo = 'PAGA_PJ' or m.tipo= 'PAGA_PF'
group by c.nome, m.tipo
order by count(m.id), m.tipo ;

select c.nome, m.tipo, count(m.id) as quantidade from matricula m
    join curso c on c.id = m.curso_id
where m.tipo in ('PAGA_PJ', 'PAGA_PF')
group by c.nome, m.tipo
order by count(m.id), m.tipo ;

select * from aluno;

select * from curso;

select a.nome as aluno, c.nome as curso from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id
where c.id in(1,9);






















