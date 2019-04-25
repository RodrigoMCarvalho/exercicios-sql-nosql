CREATE OR REPLACE PROCEDURE incluir_segmercado (
    p_descricao in segmercado.descricao%type)
IS
BEGIN
    INSERT INTO segmercado
        VALUE(ID_SEGMERCADO_SEQ.nextval, UPPER(p_descricao));
    COMMIT;
END;

EXECUTE incluir_segmercado('varejista'); --comando do SQL Developer
CALL incluir_segmercado('atacadista');

SELECT * FROM segmercado;

--=========================================---
--FUNCTION retorna um valor

CREATE OR REPLACE FUNCTION obter_descricao_segmercado(p_id IN segmercado.id%type)
   RETURN segmercado.descricao%type
IS
    v_descricao segmercado.descricao%type;
BEGIN
    SELECT descricao INTO v_descricao --passar o conteúdo da coluna descricao para a variavel v_descricao
    FROM segmercado
    WHERE ID = p_id;
    
    RETURN v_descricao;
END;

VARIABLE g_descricao VARCHAR2(100); --comando do SQL Developer
EXECUTE :g_descricao := obter_descricao_segmercado(1); --comando do SQL Developer
PRINT g_descricao;

SET SERVEROUTPUT ON;
DECLARE 
    v_descricao segmercado.descricao%type;
BEGIN
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: '|| v_descricao);
END;

--=====================================================

CREATE OR REPLACE PROCEDURE incluir_cliente (
    p_razao_social IN cliente.razao_social%type,
    p_cnpj IN cliente.cnpj%type,
    p_seqmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj; --variavel v_cnpj recebe o valor do parâmetro p_cnpj;
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto); --chama a function
    formatar_cnpj(v_cnpj); --chama a procedure para formar o cnpj
    
    INSERT INTO cliente 
    VALUES (ID_CLIENTE_SEQ.nextval,upper(p_razao_social), v_cnpj, p_seqmercado_id, 
            sysdate, p_faturamento_previsto,v_categoria);
    COMMIT;   --Quando não há um comando de fim de transação (COMMIT ou ROLLBACK), os comandos de DML da transação ficam pendentes.
END;

CALL incluir_cliente('supermercado zzzz', 58745, null, 6000);

SELECT * FROM cliente;

--=====================================================
--procedure criada para estudar lançamento de exception

CREATE OR REPLACE PROCEDURE incluir_cliente_sem_sequence (
    p_id IN cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_cnpj IN cliente.cnpj%type,
    p_seqmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj; --variavel v_cnpj recebe o valor do parâmetro p_cnpj;
    e_null EXCEPTION;
    PRAGMA exception_init(e_null, -01400);   
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto); --chama a function
    formatar_cnpj(v_cnpj); --chama a procedure para formar o cnpj
    
    INSERT INTO cliente 
    VALUES (p_id, upper(p_razao_social), v_cnpj, p_seqmercado_id, 
            sysdate, p_faturamento_previsto,v_categoria);
    COMMIT;  
    
EXCEPTION 
    WHEN dup_val_on_index THEN
        --dbms_output.put_line('Cliente já cadastrado'); visualizado somente dentro do SQL Developer
        raise_application_error(-20010, 'Cliente já cadastrado'); --informar um ID já cadastrado
    WHEN e_null THEN
        raise_application_error(-20015, 'A coluna ID tem preenchimento obrigatório.'); --informar ID null
    WHEN OTHERS THEN
        raise_application_error(-20020, sqlerrm());
END;

--=====================================================

CREATE OR REPLACE FUNCTION categoria_cliente ( p_faturamento_previsto IN cliente.faturamento_previsto%type)
    RETURN cliente.categoria%type
IS
BEGIN
    IF p_faturamento_previsto < 1000 then
        RETURN 'PEQUENO';
    ELSIF p_faturamento_previsto < 5000 then
        RETURN 'MEDIO';
    ELSIF p_faturamento_previsto < 10000 then
        RETURN 'MEDIO GRANDE';
    ELSE 
        RETURN 'GRANDE';
    END IF;
END;

--=====================================================

CREATE OR REPLACE PROCEDURE formatar_cnpj (p_cnpj IN OUT cliente.cnpj%type)
IS
BEGIN
    p_cnpj := substr(p_cnpj, 1, 2) || '/' || substr(p_cnpj, 3); --concatenação e substituição de string. Ex: 12/345
END;

VARIABLE g_cnpj VARCHAR2(10);
EXECUTE :g_cnpj := '123456';
PRINT g_cnpj;

EXECUTE formatar_cnpj(:g_cnpj);
PRINT g_cnpj;

--=====================================================

CREATE OR REPLACE FUNCTION tamanho_tabela
    RETURN NUMBER
IS
    v_tamanho number;
BEGIN
    SELECT COUNT(*) INTO v_tamanho FROM cliente;
    
    RETURN v_tamanho;
END;

VARIABLE g_tamanho VARCHAR2(25);
EXECUTE :g_tamanho := tamanho_tabela;
PRINT g_tamanho;

--=====================================================

CREATE OR REPLACE PROCEDURE atualizar_cli_seqmercado(
    p_id IN cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type)
IS
    e_cliente_id_inexistente EXCEPTION;
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE ID = p_id;
    IF sql%notfound THEN          --será TRUE se o comando anterior não retornar nada
        RAISE e_cliente_id_inexistente;
    END IF;
    COMMIT;
EXCEPTION
    WHEN e_cliente_id_inexistente THEN
        raise_application_error(-20100, 'Cliente inexistente');
END;

CALL atualizar_cli_seqmercado(1,2);
SELECT * FROM cliente;

DECLARE
    v_segmercado_id cliente.segmercado_id%type := 1;
    v_i NUMBER; --indice para o loop
BEGIN
    v_i := 1;
    LOOP
        atualizar_cli_seqmercado(v_i, v_segmercado_id);
        v_i := v_i + 1;
        EXIT WHEN v_i >= tamanho_tabela;  --function que retorna o tamanho da tabela
    END loop;
END;


--=====================================================
-- Utilizando o FOR

DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
BEGIN
    FOR i IN 1..tamanho_tabela LOOP
       atualizar_cli_seqmercado(i, v_segmercado_id); 
    END LOOP;
    COMMIT;
END;

--=====================================================

DECLARE
BEGIN
    UPDATE cliente
        SET segmercado_id = 1
        WHERE ID IN (21,22);
    COMMIT;
END;

--=====================================================

CREATE OR REPLACE PROCEDURE atualizar_cliente (
    p_id IN cliente.id%type,
    p_razao_social IN cliente.razao_social%type)
IS
BEGIN
    UPDATE cliente 
    SET razao_social = UPPER(p_razao_social)
    WHERE ID = p_id;
    COMMIT;
    
EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line ('Cliente não localizado');
END;



   
   
   
   