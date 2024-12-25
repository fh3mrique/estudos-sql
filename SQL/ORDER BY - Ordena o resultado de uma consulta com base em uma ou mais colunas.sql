-- ORDER BY -> Ordena o resultado de uma consulta com base em uma ou mais colunas.
-- Aqui, os usuários com IDs entre 90 e 102 são selecionados.
-- O resultado será ordenado de forma decrescente pela coluna "id".
SELECT id, first_name, email
FROM users u
WHERE u.id BETWEEN 90 AND 102
ORDER BY u.id DESC;

-- ORDER BY com ordem crescente (ASC)
-- Por padrão, o `ORDER BY` classifica os resultados em ordem crescente.
-- Este exemplo classifica os usuários pelo "first_name" em ordem alfabética crescente.
SELECT id, first_name, email
FROM users u
WHERE u.id BETWEEN 90 AND 102
ORDER BY u.first_name ASC;

-- ORDER BY com múltiplas colunas
-- Você pode ordenar por várias colunas ao mesmo tempo.
-- Aqui, os resultados são ordenados primeiro pelo "first_name" em ordem alfabética 
-- e, em caso de empate, pela coluna "id" em ordem crescente.
SELECT id, first_name, email
FROM users u
WHERE u.id BETWEEN 90 AND 102
ORDER BY u.first_name ASC, u.id ASC;

-- ORDER BY em combinação com funções
-- É possível ordenar com base em valores calculados ou expressões.
-- Neste exemplo, a coluna "email" é convertida para maiúsculas e os resultados
-- são ordenados em ordem decrescente com base nessa transformação.
SELECT id, first_name, email
FROM users u
WHERE u.id BETWEEN 90 AND 102
ORDER BY UPPER(u.email) DESC;

-- ORDER BY com alias
-- Se uma coluna ou expressão no SELECT possui um alias, você pode usá-lo no ORDER BY.
-- Este exemplo cria um alias "user_name" para o primeiro nome e ordena pelo alias.
SELECT id, first_name AS user_name, email
FROM users u
WHERE u.id BETWEEN 90 AND 102
ORDER BY user_name ASC;

-- ORDER BY com LIMIT
-- Ordena os resultados e exibe apenas os 5 primeiros registros.
-- Neste caso, os usuários com IDs entre 90 e 102 são ordenados de forma decrescente pelo "id",
-- e somente os 5 primeiros resultados são retornados.
SELECT id, first_name, email
FROM users u
WHERE u.id BETWEEN 90 AND 102
ORDER BY u.id DESC
LIMIT 5;