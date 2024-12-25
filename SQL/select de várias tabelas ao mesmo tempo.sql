-- SELECT de várias tabelas ao mesmo tempo
-- Este exemplo usa uma sintaxe de JOIN implícito para selecionar dados de duas tabelas relacionadas: "users" e "profiles".
-- Estamos obtendo o ID do usuário (user_id), o ID do perfil (profile_id), a biografia (bio) e o primeiro nome (first_name).
-- A condição "WHERE u.id = p.user_id" garante que apenas os registros relacionados sejam retornados.
SELECT 
    u.id AS user_id,  -- ID do usuário.
    p.id AS profile_id,  -- ID do perfil.
    p.bio,  -- Biografia do perfil.
    u.first_name  -- Nome do usuário.
FROM users AS u, profiles AS p
WHERE u.id = p.user_id;

-- Exemplo equivalente usando JOIN explícito
-- É recomendado usar JOIN explícito em vez de listar tabelas separadas, pois é mais claro e evita ambiguidades.
SELECT 
    u.id AS user_id,
    p.id AS profile_id,
    p.bio,
    u.first_name
FROM users AS u
INNER JOIN profiles AS p ON u.id = p.user_id;

-- Exemplo com LEFT JOIN
-- Retorna todos os usuários, mesmo aqueles que não têm um perfil na tabela "profiles".
SELECT 
    u.id AS user_id,
    p.id AS profile_id,
    p.bio,
    u.first_name
FROM users AS u
LEFT JOIN profiles AS p ON u.id = p.user_id;

-- Exemplo com RIGHT JOIN
-- Retorna todos os perfis, mesmo aqueles que não têm um usuário correspondente.
SELECT 
    u.id AS user_id,
    p.id AS profile_id,
    p.bio,
    u.first_name
FROM users AS u
RIGHT JOIN profiles AS p ON u.id = p.user_id;

-- Exemplo com condições adicionais
-- Retorna apenas usuários ativos que possuem um perfil com "bio" preenchida.
SELECT 
    u.id AS user_id,
    p.id AS profile_id,
    p.bio,
    u.first_name
FROM users AS u
INNER JOIN profiles AS p ON u.id = p.user_id
WHERE u.status = 'active' AND p.bio IS NOT NULL;

-- Exemplo com agregação
-- Mostra a quantidade de perfis por usuário.
SELECT 
    u.id AS user_id,
    u.first_name,
    COUNT(p.id) AS total_profiles
FROM users AS u
LEFT JOIN profiles AS p ON u.id = p.user_id
GROUP BY u.id, u.first_name;

-- Exemplo com múltiplos JOINs
-- Selecionando dados de três tabelas: "users", "profiles", e uma tabela fictícia "orders".
SELECT 
    u.id AS user_id,
    p.id AS profile_id,
    o.id AS order_id,
    u.first_name,
    p.bio,
    o.order_date
FROM users AS u
INNER JOIN profiles AS p ON u.id = p.user_id
INNER JOIN orders AS o ON u.id = o.user_id;