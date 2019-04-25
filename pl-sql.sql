create sequence id_segmercado_seq;
create sequence id_cliente_seq;

SET SERVEROUTPUT ON;
DECLARE 
    v_id NUMBER(5) := 10;
BEGIN
    v_id := 6;
    dbms_output.put_line(v_id);
END;

--=============================--

DECLARE 
    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type := 'esportivo';
BEGIN
    INSERT INTO segmercado VALUES (v_id, UPPER(v_descricao));
    COMMIT;
END;
    
SELECT * FROM segmercado;    
    
--=============================
DECLARE 
    v_id segmercado.id%type := 2;
    v_descricao segmercado.descricao%type := 'atacadista';
BEGIN
    UPDATE segmercado 
        SET descricao = UPPER(v_descricao)
        WHERE ID = v_id;
    COMMIT;
END;

--=============================
DECLARE 
    v_id segmercado.id%type := 3;
BEGIN
    DELETE FROM segmercado 
        WHERE ID = v_id;
    COMMIT;
END;
--=============================

DECLARE
    v_id cliente.id%type := 41;
BEGIN
    UPDATE cliente SET razao_social = 'supermercado oooo' 
    WHERE ID = v_id;
END;

CALL  atualizar_cliente(41, 'supermercado oooo');


CREATE SEQUENCE sqTeste
    MINVALUE 1
    MAXVALUE 300
    START WITH 1
    INCREMENT BY 1
    CACHE 20;


DROP TABLE segmercado;
    
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "segmercado";    
    
    
CREATE SEQUENCE ID_SEGMERCADO_SEQ;    
    