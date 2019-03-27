create  or replace procedure incluir_segmercado (
    p_descricao in segmercado.descricao%type)
is
begin
    insert into segmercado
        values(ID_SEGMERCADO_SEQ.nextval, upper(p_descricao));
    commit;
end;

execute incluir_segmercado('varejista'); --comando do SQL Developer
call incluir_segmercado('atacadista');

select * from segmercado;

--=========================================---
--FUNCTION retorna um valor

create or replace function obter_descricao_segmercado(p_id in segmercado.id%type)
   return segmercado.descricao%type
is
    v_descricao segmercado.descricao%type;
begin
    select descricao into v_descricao --passar o conteúdo da coluna descricao para a variavel v_descricao
    from segmercado
    where id = p_id;
    
    return v_descricao;
end;

variable g_descricao varchar2(100); --comando do SQL Developer
execute :g_descricao := obter_descricao_segmercado(1); --comando do SQL Developer
print g_descricao;

set SERVEROUTPUT on
declare 
    v_descricao segmercado.descricao%type;
begin
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: '|| v_descricao);
end;











   
   
   
   