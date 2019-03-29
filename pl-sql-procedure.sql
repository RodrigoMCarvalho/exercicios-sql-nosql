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
    p_cnpj in cliente.cnpj%type,
    p_seqmercado_id in cliente.segmercado_id%type,
    p_faturamento_previsto in cliente.faturamento_previsto%type)
is
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj; --variavel v_cnpj recebe o valor do parâmetro p_cnpj;
begin
    v_categoria := categoria_cliente(p_faturamento_previsto); --chama a function
    formatar_cnpj(v_cnpj); --chama a procedure para formar o cnpj
    
    insert into cliente 
    values (ID_CLIENTE_SEQ.nextval,upper(p_razao_social), v_cnpj, p_seqmercado_id, 
            sysdate, p_faturamento_previsto,v_categoria);
    commit;
end;

call incluir_cliente('supermercado zzzz', 58745, null, 6000);

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

--=====================================================

create or replace procedure formatar_cnpj (p_cnpj in out cliente.cnpj%type)
is
begin
    p_cnpj := substr(p_cnpj, 1, 2) || '/' || substr(p_cnpj, 3); --concatenação e substituição de string. Ex: 12/345
end;

variable g_cnpj varchar2(10);
execute :g_cnpj := '123456';
print g_cnpj;

execute formatar_cnpj(:g_cnpj);
print g_cnpj;

--=====================================================

create or replace function tamanho_tabela
    return number
is
    v_tamanho number;
begin
    select count(*) into v_tamanho from cliente;
    
    return v_tamanho;
end;

variable g_tamanho varchar2(25);
execute :g_tamanho := tamanho_tabela;
print g_tamanho;

--=====================================================

create or replace procedure atualizar_cli_seqmercado(
    p_id in cliente.id%type,
    p_segmercado_id in cliente.segmercado_id%type)
is
begin
    update cliente
        set segmercado_id = p_segmercado_id
        where id = p_id;
    commit;
end;

call atualizar_cli_seqmercado(1,2);

select * from cliente;

declare
    v_segmercado_id cliente.segmercado_id%type := 1;
    v_i number; --indice para o loop
begin
    v_i := 1;
    loop
        atualizar_cli_seqmercado(v_i, v_segmercado_id);
        v_i := v_i + 1;
        exit when v_i >= tamanho_tabela;  --function que retorna o tamanho da tabela
    end loop;
end;


--=====================================================
-- Utilizando o FOR

declare
    v_segmercado_id cliente.segmercado_id%type := 2;
begin
    for i in 1..tamanho_tabela loop
       atualizar_cli_seqmercado(i, v_segmercado_id); 
    end loop;
    commit;
end;

--=====================================================

declare
begin
    update cliente
        set segmercado_id = 1
        where id in (21,22);
    commit;
end;

declare
    
begin
    update cliente
        set segmercado_id = 1
        where id in (21,22);
    commit;
end;x







   
   
   
   