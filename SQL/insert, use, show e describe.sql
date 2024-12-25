-- SELECIONA A BASE DE DADOS QUE SERÁ USADA
use estudos

-- MOSTRA AS TABELAS DA BASE DE DADOS
show tables

-- MOSTRA AS COLUNAS DE UMA TABELA
describe users 

-- INSERIR REGISTROS NA BASE DE DADOS
insert into users 
(first_name, last_name, email, password_hash)
values
('Filipe', 'Lima', 'filipe@gmail.com', 'a_hash'),
('Naruto', 'Uzumaki', 'naruto@gmail.com', 'n_hash'),
('Sasuke', 'Uchiha', 'sasuke@gmail.com', 's_hash')

