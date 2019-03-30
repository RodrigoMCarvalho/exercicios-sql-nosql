create sequence id_segmercado_seq;
create sequence id_cliente_seq;

set serveroutput on;
declare 
    v_id number(5) := 10;
begin
    v_id := 6;
    dbms_output.put_line(v_id);
end;

--=============================--

declare 
    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type := 'esportivo';
begin
    insert into segmercado values (v_id, upper(v_descricao));
    commit;
end;
    
select * from segmercado;    
    
=============================
declare 
    v_id segmercado.id%type := 2;
    v_descricao segmercado.descricao%type := 'atacadista';
begin
    update segmercado 
        set descricao = upper(v_descricao)
        where id = v_id;
    commit;
end;

=============================
declare 
    v_id segmercado.id%type := 3;
begin
    delete from segmercado 
        where id = v_id;
    commit;
end;
=============================

declare
    v_id cliente.id%type := 41;
begin
    update cliente set razao_social = 'supermercado oooo' where id = v_id;
end;

call atualizar_cliente(41, 'supermercado oooo');


CREATE SEQUENCE sqTeste
    MINVALUE 1
    MAXVALUE 300
    START WITH 1
    INCREMENT BY 1
    CACHE 20;


drop table segmercado;
    
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "segmercado";    
    
    
create sequence ID_SEGMERCADO_SEQ;    
    