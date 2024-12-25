-- Selecionar todas as colunas de uma tabela
-- O asterisco (*) seleciona todas as colunas disponíveis na tabela "users".
-- O alias "u" é atribuído à tabela "users", permitindo uma referência mais curta em consultas complexas.
SELECT * FROM users u;

-- Selecionar apenas colunas específicas de uma tabela
-- Em vez de selecionar todas as colunas, é possível especificar quais colunas você deseja.
-- Aqui, apenas as colunas "id" e "email" são selecionadas da tabela "users".
-- O alias "u" ainda está disponível, mas neste exemplo não foi utilizado diretamente nas colunas.
SELECT id, email FROM users u;

-- Usando alias de colunas para renomeá-las no resultado
-- Você pode usar aliases para renomear as colunas exibidas no resultado da consulta.
-- O alias para a coluna é útil quando o nome original não é intuitivo ou precisa ser mais amigável.
SELECT id AS user_id, email AS user_email FROM users u;

-- Selecionar colunas e usar funções com alias
-- Aqui, a função COUNT() é usada para contar os registros da tabela.
-- O alias "total_users" renomeia a coluna do resultado para algo mais significativo.
SELECT COUNT(*) AS total_users FROM users u;

-- Combinar colunas e texto com alias
-- Concatenando o nome e sobrenome dos usuários para exibir como "full_name".
-- O alias "full_name" torna o resultado mais legível.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users u;
