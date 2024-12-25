-- INSERT com SELECT
-- O comando INSERT pode usar o resultado de uma consulta SELECT para inserir dados em uma tabela.
-- Este exemplo insere dados na tabela "profiles", extraindo informações da tabela "users".
-- A coluna "bio" recebe uma concatenação da string 'Bio de ' com o "first_name".
-- A coluna "description" recebe uma concatenação da string 'Description de ' com o "first_name".
-- A coluna "user_id" é preenchida com os IDs correspondentes.
INSERT INTO profiles (bio, description, user_id)
SELECT 
    CONCAT('Bio de ', first_name),  -- Gera a biografia usando o nome do usuário.
    CONCAT('Description de ', first_name),  -- Gera a descrição usando o nome do usuário.
    id  -- Insere o ID do usuário.
FROM users;

-- Exemplo com filtro na consulta SELECT
-- Apenas usuários com IDs maiores que 50 serão utilizados para criar perfis.
INSERT INTO profiles (bio, description, user_id)
SELECT 
    CONCAT('Bio de ', first_name),
    CONCAT('Description de ', first_name),
    id
FROM users
WHERE id > 50;

-- Exemplo com mais colunas no INSERT
-- Se a tabela de destino possui mais colunas, você pode incluir valores fixos ou calculados no SELECT.
-- Aqui, uma coluna adicional "status" é preenchida com o valor fixo 'active'.
INSERT INTO profiles (bio, description, user_id, status)
SELECT 
    CONCAT('Bio de ', first_name),
    CONCAT('Description de ', first_name),
    id,
    'active'  -- Preenchendo a coluna "status" com um valor fixo.
FROM users;

-- Exemplo com valores padronizados para colunas específicas
-- A biografia e a descrição são preenchidas com um valor padrão para todos os usuários.
INSERT INTO profiles (bio, description, user_id)
SELECT 
    'Biografia padrão',  -- Valor padrão para todos.
    'Descrição padrão',  -- Valor padrão para todos.
    id
FROM users;

-- Boas práticas ao usar INSERT com SELECT:
-- 1. **Valide os dados antes de inserir**: Use cláusulas como `WHERE` para evitar a inserção de registros desnecessários.
-- 2. **Verifique a correspondência de colunas**: Certifique-se de que o número de colunas no INSERT e no SELECT seja o mesmo.
-- 3. **Use transações se necessário**: Em bancos como MySQL ou PostgreSQL, use transações para garantir a integridade dos dados.
-- 4. **Evite duplicatas**: Se a tabela de destino já contém registros, verifique se os dados do SELECT não causarão duplicatas.
