CREATE TABLE COMPRAS (
    ID NUMBER PRIMARY KEY,
    VALOR NUMBER,
    DATA DATE,
    OBSERVACOES VARCHAR2(30),
    RECEBIDO CHAR check (recebido in (0,1))
);
CREATE SEQUENCE ID_SEQ;

-- para verificar a linguagem padrao
show parameter nls_lang;

select * from compras;
desc compras;

select valor, observacoes from compras  
where data >= '15-11-2008';

select * from compras 
where recebido = 1;

select * from compras 
where valor >= 200 and valor <= 700;

select * from compras 
where valor BETWEEN 200 AND 700;

update compras
set observacoes = 'GRAVATAS'
where id = 41;

update compras
set valor = 90.00
where id = 41;

alter table compras
MODIFY ( observacoes varchar2(30) not null);


alter table compras
add (forma_pagt varchar2(15) check (forma_pagt in('CARTAO', 'DINHEIRO', 'BOLETO')));

alter table compras
rename column forma_pagt to forma_pagto;

UPDATE compras
set forma_pagto = 'CARTAO'
where valor >= 900;

update compras
set forma_pagto = 'BOLETO'
where valor BETWEEN 300 and 900;

update compras
set forma_pagto = 'DINHEIRO'
where valor < 300;

select sum(valor)as total from compras
where forma_pagto = 'BOLETO';

select forma_pagto, sum(valor) as total from compras
group by forma_pagto;

select forma_pagto, sum(valor) as total from compras
group by forma_pagto
HAVING sum(valor) > 5000;

-- adicionar coluna ---
alter table compras
add (comprador_id number);

alter table compras
add foreign key (comprador_id) 
references compradores(id);

update compras
set comprador_id = 1
where id >= 20;

update compras
set comprador_id = 2
where id <20;

create table compradores (
id number primary key,
nome varchar2(30) not null,
endereco varchar2(30) not null,
telefone varchar2(20) not null);

create sequence id_compradores_seq;

insert into compradores (id, nome, endereco, telefone) 
values (id_compradores_seq.nextval, 'Rodrigo' , 'Rua A', '9999-9999');

insert into compradores (id, nome, endereco, telefone) 
values (id_compradores_seq.nextval, 'Gustavo' , 'Rua A', '9889-9229');

select * from compradores;

select observacoes, valor, nome from compras
join compradores
on compras.comprador_id = compradores.id;




