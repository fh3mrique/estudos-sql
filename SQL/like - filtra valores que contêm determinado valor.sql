-- LIKE -> Filtra valores que contêm determinado valor
-- O operador LIKE é usado para realizar buscas parciais em uma coluna.
-- O símbolo '%' é um caractere curinga que representa zero ou mais caracteres.
-- Este exemplo filtra usuários cujo primeiro nome contém "fi" em qualquer posição.
SELECT * FROM users u
WHERE u.first_name LIKE '%fi%';

-- LIKE com curinga no início
-- Filtra usuários cujos nomes terminam com "fi".
SELECT * FROM users u
WHERE u.first_name LIKE '%fi';

-- LIKE com curinga no final
-- Filtra usuários cujos nomes começam com "fi".
SELECT * FROM users u
WHERE u.first_name LIKE 'fi%';

-- LIKE case-sensitive (dependendo do banco de dados)
-- Em alguns bancos, o LIKE é case-insensitive por padrão (ignora maiúsculas/minúsculas).
-- Para buscas case-sensitive, use COLLATE se o banco suportar:
SELECT * FROM users u
WHERE u.first_name LIKE BINARY 'Fi%'; -- Exemplo MySQL com sensibilidade a maiúsculas/minúsculas.

-- Filtrando valores que contêm um caractere específico
-- O caractere '_' é um curinga que representa exatamente um caractere.
-- Este exemplo retorna nomes com exatamente 3 caracteres, onde o primeiro é "A" e o terceiro é "n".
SELECT * FROM users u
WHERE u.first_name LIKE 'A_n';

-- Usando NOT LIKE
-- Filtra usuários cujos nomes NÃO contêm "fi".
SELECT * FROM users u
WHERE u.first_name NOT LIKE '%fi%';

-- Exemplo prático com combinação de LIKE e outras condições
-- Filtra usuários cujo primeiro nome começa com "A" ou termina com "z"
SELECT * FROM users u
WHERE (u.first_name LIKE 'A%' OR u.first_name LIKE '%z');

-- Aplicando LIKE em colunas com concatenação
-- Busca usuários cujo nome completo contém "John".
-- CONCAT combina o primeiro e o último nome, permitindo buscas em ambos os campos.
SELECT * FROM users u
WHERE CONCAT(u.first_name, ' ', u.last_name) LIKE '%John%';


