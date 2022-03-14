create schema Cadastro;

CREATE TABLE Cadastro.Pessoa
(
IdPessoa int AUTO_INCREMENT NOT NULL,
Nome varchar(100) NULL,
CPF char(11) NOT NULL,
Logradouro varchar(50) NULL,
Numero int NULL,
DataCadastro datetime NULL,
CONSTRAINT PK_Pessoa PRIMARY KEY CLUSTERED (IdPessoa ASC)
);

CREATE TABLE Cadastro.Cliente
(
IdCliente int auto_increment PRIMARY KEY NOT NULL,
IdPessoa int,
UltimaVisita datetime NULL,
INDEX IndexPessoa (IdPessoa),
FOREIGN KEY (IdPessoa)
REFERENCES Pessoa(IdPessoa)
ON DELETE CASCADE
);

insert into Cadastro.Pessoa (Nome,CPF,Logradouro,Numero,DataCadastro) 
Values ('Anna','23970731291','Rua Teste 01',85,now());
insert into Cadastro.Pessoa (Nome,CPF,Logradouro,Numero,DataCadastro) 
Values ('Mallu','57626342135','Estrada Teste 02',987, now());
insert into Cadastro.Pessoa (Nome,CPF,Logradouro,Numero,DataCadastro) 
Values ('Ana','19084287754','Alameda Teste 5',8547, now());
insert into Cadastro.Pessoa (Nome,CPF,Logradouro,Numero,DataCadastro)
Values ('Tania','70734746881','Av Teste 06',127, now());

insert into Cadastro.Cliente (IdPessoa, UltimaVisita) Values (1,now());
insert into Cadastro.Cliente (IdPessoa, UltimaVisita) Values (2,now());
insert into Cadastro.Cliente (IdPessoa, UltimaVisita) Values (4,now());

/*Curdate - DATA
Now - Data e Hora*/
## View

Create View DadosDosClientes as
Select a.*, b.idcliente
from Cadastro.Pessoa a
Inner join Cadastro.Cliente b
on a.idpessoa = b.idpessoa
Order by a.nome;

Create View NomeDosClientes as
Select a.nome
from Cadastro.Pessoa a
Inner join Cadastro.Cliente b
on a.idpessoa = b.idpessoa
Order by a.nome;

/*Data model languagens clica inverso na view no navegador e tem a opção Alter*/
select*from cadastro.DadosDosClientes;
select*from cadastro.DadosDosClientes where idcliente=2;
select*from NomeDosClientes;

##Funções

##Deterministic sempre vai ter o mesmo resultado para uma mesma entrada
DELIMITER $$
CREATE FUNCTION CalcularImposto (valor double)
returns double
DETERMINISTIC
BEGIN

declare total double;
set total = valor * 0.08;
return total;

END$$

#chamar as funções 
select CalcularImposto(100);
select now();
select curdate();

DELIMITER $$
CREATE FUNCTION Juntar3Palavras (Palavra1 varchar(20),Palavra2 varchar(20),Palavra3 varchar(20))
returns varchar(100)
DETERMINISTIC
BEGIN

declare PalavasConcatenadas varchar(100);
set PalavasConcatenadas = concat(Palavra1,' - ',Palavra2,' - ',Palavra3);
return PalavasConcatenadas;

END$$

select `cadastro`.`Juntar3Palavras`('Teste1', 'Teste2', 'Teste3');
select cadastro.Juntar3Palavras('Teste1', 'Teste2', 'Teste3');

delimiter $$
create function retornaPar(num int)
returns varchar(10)
deterministic
begin
return if(num%2=0,"é par", "É impar");
end
$$

select retornaPar(200);

delimiter $$
create function numerodediv5(num int)
returns int
deterministic
begin
	declare result int;
	set result = 0;
	while num !=0 do
		set num = num-1;
		if(num%5=0) then
			set result = result+1;
		end if;
	end while;
	return result;
end$$

select numerodediv5(100);

select*from pessoa;

DELIMITER $$
CREATE FUNCTION RetornaNomePessoa(pIdPessoa int)
RETURNS varchar(10)
READS SQL DATA
Begin
return (select Nome from cadastro.Pessoa where idpessoa = pIdPessoa);
end
$$

select RetornaNomePessoa(1);

## function não retorna mais de uma linha ou coluna 
DELIMITER $$
CREATE FUNCTION RetornaNomePessoa2(pIdPessoa int)
RETURNS varchar(10)
READS SQL DATA
Begin
return (select*from cadastro.Pessoa where idpessoa = pIdPessoa);
end
$$

#Vai dar erro pq pega varias linhas e colunas 
select RetornaNomePessoa2(1);

#Procedure 1
DELIMITER $$
CREATE PROCEDURE RetornaHora ( )
BEGIN
select now() as hora ;
END
$$

CALL cadastro.RetornaHora();

#procedure 2
DELIMITER $$
CREATE PROCEDURE RetornaDataEHoraAtual ( )
BEGIN
select curdate() as Data,now() as DataHoraCompleta ;
END
$$

CALL cadastro. RetornaDataEHoraAtual();

#procedure 3 ( in é default dos parametros mas por boas praticas é bom colocar o in)
DELIMITER $$
CREATE PROCEDURE RetornaDataComAcrescimo (in pDiasAAcrescentar int)
BEGIN
	select DATE_ADD(curdate(), INTERVAL pDiasAAcrescentar Day) 
	as DataAcrescida,now() as DataHoraCompleta ;
END
$$

CALL cadastro.RetornaDataComAcrescimo(10);

#minha procedure
DELIMITER $$
CREATE PROCEDURE atualizar3diasNoCadastro (in qtDias int)
BEGIN
	update pessoa set DataCadastro = DATE_ADD(DataCadastro, INTERVAL qtDias Day);
	select*from pessoa;
END
$$

CALL cadastro.atualizar3diasNoCadastro(3);

#Sintexe do if
SELECT IF(500<1000 and 700<1000, (SELECT IF(800<1000, "YES2", "NO2")) , "NO1");

CREATE TABLE Cadastro.Venda
(
IdVenda int auto_increment PRIMARY KEY NOT NULL,
IdCliente int,
DataHoraVenda datetime default now(),
ValorVenda double,
ValorImposto double,
INDEX IndexCliente (IdCliente),
FOREIGN KEY (IdCliente)
REFERENCES Cliente(IdCliente)
ON DELETE CASCADE);

select*from Cadastro.Venda;
select*from Cadastro.pessoa;

DELIMITER $$
CREATE FUNCTION `RetornaIdCliente`
(pNome varchar(50))
RETURNS int
READS SQL DATA
Begin
return (select IdCliente from cadastro.dadosdosclientes where nome =pNome);
End;
$$

DELIMITER $$
CREATE PROCEDURE RegistraVenda (IN pNomeCliente varchar(50), IN pValorVenda double, OUT pNumeroDaVenda int)
BEGIN
declare vIdCliente int;
declare vImposto double;
set vIdCliente = (select cadastro.RetornaIdCliente(pNomeCliente));
set vImposto = (select CalcularImposto(pValorVenda));
Insert Into Cadastro.Venda (IdCliente,ValorVenda,ValorImposto) values (vIdCliente, pValorVenda, vImposto);
set pNumeroDaVenda = (select LAST_INSERT_ID());
END; $$

call cadastro.RegistraVenda("Mallu",120,@psaida);
call cadastro.RegistraVenda("Mallu",110.50,@psaida);

select @pSaida;

DELIMITER $$
CREATE PROCEDURE RegistraVenda2 (IN pNomeCliente varchar(50), IN pValorVenda double)
BEGIN
declare vIdCliente int;
declare vImposto double;
set vIdCliente = (select cadastro.RetornaIdCliente(pNomeCliente));
set vImposto = (select CalcularImposto(pValorVenda));
Insert Into Cadastro.Venda (IdCliente,ValorVenda,ValorImposto) values (vIdCliente, pValorVenda, vImposto);
select last_insert_id();
END; $$

call cadastro.RegistraVenda2("Mallu",120);

select*from pessoa a 
inner join cliente b on a.idpessoa =b.idpessoa 
inner join venda c on b.IdCliente = c.IdCliente;

DELIMITER $$
CREATE PROCEDURE RegistraVenda3 (IN pNomeCliente varchar(50), IN pValorVenda double)
BEGIN
declare vIdCliente int;
declare vImposto double;
set vIdCliente = (select cadastro.RetornaIdCliente(pNomeCliente));
set vImposto = (select CalcularImposto(pValorVenda));
Insert Into Cadastro.Venda (IdCliente,ValorVenda,ValorImposto) values (vIdCliente, pValorVenda, vImposto);
select*from pessoa a 
inner join cliente b on a.idpessoa =b.idpessoa 
inner join venda c on b.IdCliente = c.IdCliente;
END; $$

call cadastro.RegistraVenda3("Anna",120);

DELIMITER $$
CREATE PROCEDURE RegistraVenda4 (IN pNomeCliente varchar(50), IN pValorVenda double)
BEGIN
declare vIdCliente int;
declare vImposto double;
set vIdCliente = (select cadastro.RetornaIdCliente(pNomeCliente));
set vImposto = (select CalcularImposto(pValorVenda));
Insert Into Cadastro.Venda (IdCliente,ValorVenda,ValorImposto) values (vIdCliente, pValorVenda, vImposto);
select*from pessoa a 
inner join cliente b on a.idpessoa =b.idpessoa 
inner join venda c on b.IdCliente = c.IdCliente
where IdVenda = last_insert_id();
END; $$

call cadastro.RegistraVenda4("Tania",80);

DELIMITER $$
CREATE PROCEDURE RegistraVenda5 (IN pNomeCliente varchar(50), IN pValorVenda double)
BEGIN
declare vIdCliente int;
declare vImposto double;
set vIdCliente = (select cadastro.RetornaIdCliente(pNomeCliente));
set vImposto = (select CalcularImposto(pValorVenda));
Insert Into Cadastro.Venda (IdCliente,ValorVenda,ValorImposto) values (vIdCliente, pValorVenda, vImposto);
select a.IdPessoa, a.Nome, a.DataCadastro, b.UltimaVisita, c.ValorVenda
from pessoa a 
inner join cliente b on a.idpessoa =b.idpessoa 
inner join venda c on b.IdCliente = c.IdCliente
where IdVenda = last_insert_id();
END; $$

call cadastro.RegistraVenda5("Tania",80);