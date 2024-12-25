-- UPDATE -> Atualizar registros em uma tabela
-- O comando UPDATE é usado para modificar os valores existentes em uma ou mais colunas de uma tabela.
-- Este exemplo atualiza o sobrenome do usuário com ID igual a 1.
UPDATE users u
SET u.last_name = 'Henrique de Lima'
WHERE u.id = 1;

-- UPDATE com múltiplas colunas
-- Este exemplo atualiza várias colunas de uma só vez para o usuário com ID igual a 2.
UPDATE users u
SET 
    u.last_name = 'Silva',
    u.email = 'novoemail@example.com'
WHERE u.id = 2;

-- UPDATE com uma condição baseada em outra coluna
-- Atualiza o sobrenome dos usuários cujo primeiro nome é "João".
UPDATE users u
SET u.last_name = 'Atualizado'
WHERE u.first_name = 'João';

-- UPDATE com uma subconsulta
-- Atualiza a bio na tabela "profiles" com base nos nomes de usuários da tabela "users".
UPDATE profiles p
SET p.bio = CONCAT('Bio de ', (SELECT u.first_name FROM users u WHERE u.id = p.user_id))
WHERE p.bio IS NULL;

-- UPDATE com cálculo
-- Atualiza a idade de todos os usuários, adicionando 1 ao valor atual.
UPDATE users u
SET u.age = u.age + 1;

-- UPDATE com LIKE
-- Atualiza o email dos usuários cujo sobrenome contém "Lima".
UPDATE users u
SET u.email = 'email_lima@example.com'
WHERE u.last_name LIKE '%Lima%';

-- UPDATE com valores padrão
-- Redefine o valor de uma coluna para o padrão para todos os usuários com IDs maiores que 50.
UPDATE users u
SET u.status = 'active'
WHERE u.id > 50;

-- UPDATE sem WHERE (perigoso)
-- Atualiza todos os registros da tabela. Use com muito cuidado.
UPDATE users u
SET u.status = 'inactive';
