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


