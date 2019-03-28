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

--=====================================================

create or replace procedure incluir_cliente (
    p_razao_social in cliente.razao_social%type,
    p_cnpf in cliente.cnpj%type,
    p_seqmercado_id in cliente.segmercado_id%type,
    p_faturamento_previsto in cliente.faturamento_previsto%type)
is
    v_categoria cliente.categoria%type;
begin
    v_categoria := categoria_cliente(p_faturamento_previsto); --chama a function
    
    insert into cliente 
    values (ID_CLIENTE_SEQ.nextval,upper(p_razao_social), p_cnpf, p_seqmercado_id, 
            sysdate, p_faturamento_previsto,v_categoria);
    commit;
end;

call incluir_cliente('supermercado aaaa', 22222, null, 200000);

select * from cliente;

--=====================================================

create or replace function categoria_cliente ( p_faturamento_previsto in cliente.faturamento_previsto%type)
    return cliente.categoria%type
is
begin
    if p_faturamento_previsto < 1000 then
        return 'PEQUENO';
    elsif p_faturamento_previsto < 5000 then
        return 'MEDIO';
    elsif p_faturamento_previsto < 10000 then
        return 'MEDIO GRANDE';
    else 
        return 'GRANDE';
    end if;
end;



























   
   
   
   