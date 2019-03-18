@C:\Users\rodri_000\Desktop\DesenvolvimentoWeb\SQL\sql1br.sql

desc aluno;
desc matricula;

select a.nome as nome_aluno, c.nome as curso from aluno a
join matricula m 
on m.aluno_id = a.id
join curso c
on c.id = m.curso_id;

select count(*) from aluno;

select a.nome from aluno a 
where exists (
select m.id from matricula m 
where m.aluno_id = a.id);

select a.nome from aluno a
where not exists (
select m.id from matricula m
where m.aluno_id = a.id);

select * from exercicio;

select * from exercicio e
where not exists (
select r.id from resposta r
where r.exercicio_id = e.id);

-- query para saber os cursos que não tem matriculas--
select c.nome from curso c
where not exists (
select m.id from matricula m
where m.curso_id = c.id);















