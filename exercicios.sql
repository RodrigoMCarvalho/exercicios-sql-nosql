SET GLOBAL time_zone = '+4:00';

insert into produto (nome, quantidade, valor) values ("Sansung S8", 5, 2800);
insert into produto (nome, quantidade, valor) values ("Impressora HP", 8, 700);

desc produto;

select * from produto;

truncate table produto;

SELECT * FROM livraria.livro;

=============================================

DELIMITER $$
CREATE FUNCTION aumenta_preco(preco DECIMAL(10,2), taxa DECIMAL(10,2)) RETURNS DECIMAL(10,2)
BEGIN 
	RETURN preco + preco * taxa /100;
END $$	
DELIMITER ;

SELECT aumenta_preco(150.00, 10.00) as Resultado;

=============================================

DELIMITER $$
create procedure verPreco(varLivro smallint)
begin
	select concat('O preço é ', preco) as Preço
	from livro
    where id = varLivro;
end$$
DELIMITER ;

call verPreco(2);

=============================================

DELIMITER $$
create procedure autor_livro(in autor varchar(50))
begin
	select a.nome, l.titulo
    from autor as a
    inner join livro as l
    on a.id = l.autor_id
    where a.nome like autor;
end $$
DELIMITER ;

call autor_livro('Rodrigo Moreira');

set @autor='Gustavo Carvalho';
call autor_livro(@autor);

=============================================

DELIMITER $$
create procedure autor_livro_like(in autor varchar(50))
begin
	select a.nome, l.titulo
    from autor as a
    inner join livro as l
    on a.id = l.autor_id
    where a.nome like concat('%', autor, '%');
end $$
DELIMITER ;

call autor_livro_like('Rodrigo');

=========================================

DELIMITER $$
create procedure teste_out(in idParametro int, out livroParametro varchar(50))
begin
	select titulo
    into livroParametro
    from livro
    where id = idParametro;
end $$
DELIMITER ;

call teste_out(1, @livro);
select @livro;

=====================================

DELIMITER $$
create procedure aumento (inout valor decimal(10,2), taxa decimal(10,2))
begin
	set valor = valor + valor * taxa / 100;
end $$
DELIMITER ;

set @valorInicial = 20;
select @valorInicial;

call aumento(@valorInicial, 15.00);
select @valorInicial;


=====================================

DELIMITER //
create function calcula_desconto(livroPar int, desconto decimal(10,2)) returns decimal(10,2)
begin
	declare precoLivro decimal(10,2);
    select preco from livro
    where id = livroPar into precoLivro;
    return precoLivro - desconto;
end //
DELIMITER ;

select * from livro where id = 3;
select calcula_desconto(3, 10.0) as deconto;
select * from livro where id = 3;

=====================================

create table produto (
id int not null auto_increment,
nome varchar(255) null,
preco_normal decimal(10,2) null,
preco_desconto decimal(10,2) null,
primary key (id));

create trigger teste_trigger_after before insert
on produto
for each row
set new.preco_desconto = (new.preco_normal * 0.90);

select * from produto;

insert into produto (nome, preco_normal) values ('Mouse', 250.00);

=====================================

create table vendas (
id Smallint primary key auto_increment,
nome_vendedor varchar(20),
quantidade int,
produto varchar(20),
cidade varchar(20));

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Rodrigo', 150, 'Mouse', 'Rio de janeiro');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Gustavo', 180, 'Mouse', 'Rio de janeiro');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('João', 200, 'Monitor', 'Rio de janeiro');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Raquel', 80, 'Impressora', 'São Paulo');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('José', 20, 'Monitor', 'São Paulo');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Zé', 75, 'Monitor', 'São Paulo');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Luiz', 150, 'Impressora', 'São Paulo');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Ana', 20, 'Mouse', 'São Paulo');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Julio', 185, 'Impressora', 'Curitiba');

insert into vendas (nome_vendedor, quantidade, produto, cidade) 
values ('Robson', 320, 'Impressora', 'Curitiba');

select * from vendas;

select * from vendas
where cidade = 'Rio de janeiro';

select cidade, sum(quantidade) as 'Total de mouses'
from vendas
where produto = 'Mouse'
group by cidade;

select cidade, count(*) as Total
from vendas
group by cidade;

select sum(quantidade) as 'Total de vendas'
from vendas;

select cidade, sum(quantidade) as 'Total de vendas'
from vendas
group by cidade
having sum(quantidade) > 500
order by sum(quantidade) desc;

=====================================

desc autor;
desc livro;

select * from autor;
select * from livro;

select L.titulo as Livro, A.nome as Autor, L.preco as Preço
from autor as A
inner join livro as L
on A.id = L.autor_id;

select A.nome as Autor, L.titulo as Livro, L.preco as Preço
from autor as A
left join livro as L
on A.id = L.autor_id;

select A.nome as Autor, L.titulo as Livro, L.preco as Preço
from autor as A
left join livro as L
on A.id = L.autor_id
where L.titulo is null;

select A.nome as Autor, L.titulo as Livro, L.preco as Preço
from autor as A
right join livro as L
on A.id = L.autor_id;

=====================================

show triggers;

use information_schema;
desc TRIGGERS;








