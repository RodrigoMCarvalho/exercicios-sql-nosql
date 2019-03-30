--cursor - percorre toda a tabela, mesmo quando os IDs não estão em ordem(1,2,3,5,6,8,12....) 

DECLARE 
    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 1;
    CURSOR cursor_cliente IS
        SELECT id FROM cliente;  --devolve somente uma coluna, se fosse mais colunas seria necessário mais variaves de retorno
BEGIN
    OPEN cursor_cliente;
    LOOP
        FETCH cursor_cliente INTO v_id;  --faz a leitura de todas as linhas da query do cursor e joga para v_id
        EXIT WHEN cursor_cliente%NOTFOUND;  --enquanto NOTFOUND for false, percorrar as linhas do cursor
        atualizar_cli_seqmercado(v_id, v_segmercado_id);
    END LOOP;
    CLOSE cursor_cliente;
    COMMIT;
END;

-- outro modo de realizar o cursor
DECLARE 
    v_segmercado_id cliente.segmercado_id%type := 2;
    CURSOR cursor_cliente is
        SELECT id FROM cliente;
BEGIN
    FOR cli_rec IN cursor_cliente LOOP
        atualizar_cli_seqmercado(cli_rec.id, v_segmercado_id);
    END LOOP;
END;

SELECT * FROM cliente;
























