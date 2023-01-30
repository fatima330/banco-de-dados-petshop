create database petshop                         /*Criando o banco de dados Petshop*/
default character set utf8mb4
default collate utf8mb4_general_ci;


create table proprietario (                           /*Criando a tabela proprietario e inserindo valores*/
`idproprietario` int not null auto_increment,
`nome` varchar(30),
`sexo` enum ('M','F'),
`peso` decimal (5,2),
`endereco` varchar (30),
primary key (idproprietario)
)default charset = utf8;

create table pet (                                   /* Criando a tabela Pet e inserindo valores*/
`idpet` int not null auto_increment,
`nome` varchar (30),
`sexo` enum ('M','F'),
`peso` decimal (5,2),
`idade` int,
primary key (idpet)
)default charset = utf8;




create table veterinario (                         /*Criando a tabela Veterinario e inserindo valores*/
`idveterinario` int not null auto_increment,
`nome` varchar (30),
`telefone` varchar (15),
primary key (idveterinario)
)default charset = utf8;

create table atendimento (                                                /*Criando a Atendimento e inserindo valores*/
`idatendimento` int not null auto_increment,
primary key (idatendimento)
)default charset = utf8;

alter table pet add proprietario_idproprietario int after idpet;      /*Alterando tabela adicionando Chave Estrangeira*/
alter table pet
add foreign key (proprietario_idproprietario)
references proprietario (idproprietario);

describe pet;

alter table atendimento add veterinario_idveterinario int after idatendimento;      /*alterando a tabela atendimento adicionando a chave estrangeira depois (after) da coluna idatendimento*/

alter table atendimento
add foreign key (veterinario_idveterinario)
references veterinario (idveterinario);

alter table atendimento add pet_idpet int after idatendimento;

alter table atendimento                                        /*adicionando chave estrangeira*/
add foreign key (pet_idpet)
references pet (idpet);

describe atendimento;

insert into proprietario                                        /*inserindo dados na tabela Proprietario*/
(nome,endereco)
values
('Pedro', 'Santa cecilia'),
('Fatima', 'Boraceia'),
('Neide', 'Boraceia'),
('Joao', 'Sao paulo'),
('Jose', 'Sao paulo');

select * from proprietario;

insert into pet                                         /*inserindo dados na tabela pet*/
(nome,sexo,peso,idade,tipo)
values
('Thor', 'M','5.30','1','cachorro'),
('Nina', 'F','3.4','4','gato'),
('Pretinho','M','7.40','4','cachorro'),
('Babalu','M','400','1','papagaio'),
('Luna', 'F','800','1','porquinho da índia');

select * from pet;

insert into veterinario                                /*inserindo dados na tabela veterinario*/
(nome, telefone)
values
('Giovanna', '99552299'),
('Juliana', '55229922'),
('Carlos', '77442244'),
('Adolfo', '33887788'),
('Hanna', '44554455');

select * from veterinario;

update pet set proprietario_idproprietario = '1' where idpet = '1';          /*adicionado id tabela pet com tabela proprietario */
update pet set proprietario_idproprietario = '2' where idpet = '2';
update pet set proprietario_idproprietario = '3' where idpet = '3';
update pet set proprietario_idproprietario = '4' where idpet = '4';
update pet set proprietario_idproprietario = '5' where idpet = '5';


select * from atendimento;

update pet set nomePet = 'Thor' where idPet = 1;           /*adicionando nomes de pet ao seus respectivos donos de acordo com seus respectivos id*/
update pet set nomePet = 'Nina' where idPet = 2;
update pet set nomePet = 'Pretinho' where idPet = 3;
update pet set nomePet = 'Babalu' where idPet = 4;
update pet set nomePet = 'Luna' where idPet = 5;


select * from pet;


alter table pet modify tipo varchar (20);                               /*modificando a tabela tipo para adicionar mais caracteres*/

update pet set tipo = 'porquinho da india' where idPet = 5;            /*Atualizando a coluna tipo, de id 5*/


select * from pet join proprietario on pet.proprietario_idproprietario = proprietario.idproprietario;

select * from atendimento join pet  on atendimento.pet_idpet = pet.idpet;

select nomePet, vete.nome, prop.nome, endereco from atendimento
 join pet on atendimento.pet_idpet = pet.idpet                                           /*usando o Join para exibir o nome do pet, o nome do veterinario, o nome do proprietario e endereco*/
 join veterinario vete on atendimento.veterinario_idveterinario = vete.idveterinario
 join proprietario prop on prop.idproprietario = pet.proprietario_idproprietario;



insert into proprietario (nome) values ('Maria','Bertioga');                               /*inserindo um novo dono na tabela*/

insert into atendimento (idatendimento,pet_idpet,veterinario_idveterinario) values ('6','6','5');

select * from proprietario;                                          /*dando um select nas tabelas para ver se esta tudo certo*/
select * from atendimento;
select * from pet;

insert into proprietario
(nome, endereco)
values
('Maria', 'Bertioga');



update pet set proprietario_idproprietario = '6' where idpet = '6';     /*atualizando a tabela pet chave estrangeira proprietario e chave primaria do per*/

