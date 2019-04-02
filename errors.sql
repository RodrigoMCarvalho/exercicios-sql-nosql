--Tratamento de erros

call incluir_cliente_sem_sequence(3, 'supermercado zzzz', 58745, null, 6000);

call incluir_cliente_sem_sequence(null, 'supermercado zzzz', 58745, null, 6000);

call incluir_cliente_sem_sequence(80, 'supermercado zzzz', 58745, 10, 6000);

call atualizar_cli_seqmercado ( 85, 3);

select * from cliente;

select username from dba_users;
