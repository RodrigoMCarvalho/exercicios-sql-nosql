drop table funcionarios;
drop table setores;

create table funcionarios (
    id number(11) not null primary key,
    nome varchar2(20),
    salario number(10,2),
    pct_comissao number(10,2),
    gerente_id number(11),
    setor_id number(11)
);

insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval,'Felipe',3000,0.1,null,1);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval,'Davi',2200,0.1,1,2);
insert into funcionarios (id,nome,salario,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Gustavo',2200,1,3);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Dorval',1800,0.1,1,2);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Tereza',2600,0.1,1,1);
insert into funcionarios (id,nome,salario,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Kunika',6200,null,null);
insert into funcionarios (id,nome,salario,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Joselir',5300,null,null);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Joseane',2000,0.1,6,2);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Isabel',1500,0.1,6,1);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Alexandre',2400,0.1,6,3);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Jennifer',2100,0.1,6,3);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Hilda',2200,0.1,7,2);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Joselita',3450,0.1,7,3);
insert into funcionarios (id,nome,salario,pct_comissao,gerente_id,setor_id) values (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Edson',4200,0.1,7,1);

create table setores (
    setor_id number(11) not null primary key,
    setor_nome varchar2(20)
);

insert into setores (setor_id,setor_nome) values (1,'Desenvolvimento');
insert into setores (setor_id,setor_nome) values (2,'Financeiro');
insert into setores (setor_id,setor_nome) values (3,'Comercial');
insert into setores (setor_id,setor_nome) values (4,'Vendas');

    create table contas (
  funcionario_id int not null primary key,
  nome varchar(30),
  salarioBase NUMBER(10,2),
  saldo NUMBER(10,2));


create table operacoes_log (
  id int not null primary key,
  quantidade number(10,2),
  tipo varchar2(2),
  funcionario_id int not null)

create sequence id_FUNCIONARIO_NOVO_SEQ;

select * from funcionarios;
----------------------------------------------

insert into funcionarios (id ,nome,salario,pct_comissao,gerente_id,setor_id) values 
    (ID_FUNCIONARIO_NOVO_SEQ.nextval, 'Rodrigo', 3400,0, null, null);

select * from funcionarios;

update funcionarios
set salario = 10000
where id = 3;

update funcionarios set salario = 7500 where setor_id is null;
commit;


update funcionarios set salario = 8000 where id in (select id from funcionarios where setor_id is null);



