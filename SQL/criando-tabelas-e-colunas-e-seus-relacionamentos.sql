-- Criação da tabela 'users', que armazenará informações básicas dos usuários
CREATE TABLE estudos.users (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL, -- Identificador único do usuário (chave primária)
    first_name VARCHAR(150) NULL,            -- Primeiro nome do usuário (opcional)
    last_name VARCHAR(150) NULL,             -- Sobrenome do usuário (opcional)
    email VARCHAR(100) NOT NULL,             -- Email do usuário (obrigatório e único junto com a senha)
    password_hash VARCHAR(100) NOT NULL,     -- Hash da senha do usuário para segurança (obrigatório)

    -- Definição da chave primária
    CONSTRAINT users_pk PRIMARY KEY (id),
    
    -- Garantia de unicidade para a combinação de email e senha
    CONSTRAINT users_unique_1 UNIQUE KEY (email, password_hash)
);

-- Criação da tabela 'roles', que armazenará os papéis (funções) associados aos usuários
CREATE TABLE estudos.roles (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL, -- Identificador único da função (chave primária)
    name VARCHAR(150) NOT NULL,              -- Nome da função (obrigatório)

    -- Definição da chave primária
    CONSTRAINT roles_pk PRIMARY KEY (id)
);

-- Criação da tabela associativa 'users_role' para implementar o relacionamento muitos-para-muitos entre 'users' e 'roles'
CREATE TABLE estudos.users_role (
    user_id INT UNSIGNED NOT NULL,           -- Referência ao ID do usuário (tabela 'users')
    role_id INT UNSIGNED NOT NULL,           -- Referência ao ID da função (tabela 'roles')

    -- Definição da chave primária composta
    CONSTRAINT users_role_pk PRIMARY KEY (user_id, role_id),

    -- Chave estrangeira referenciando a tabela 'users'
    CONSTRAINT users_roles_fk FOREIGN KEY (user_id) REFERENCES estudos.users(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE, 
    
    -- Chave estrangeira referenciando a tabela 'roles'
    CONSTRAINT users_roles_fk_1 FOREIGN KEY (role_id) REFERENCES estudos.roles(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Criação da tabela 'profiles', que armazena perfis de usuários
CREATE TABLE estudos.profiles (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL, -- Identificador único do perfil (chave primária)
    bio TEXT NULL,                           -- Biografia do usuário (opcional)
    description TEXT NULL,                   -- Descrição do perfil do usuário (opcional)

    user_id INT UNSIGNED NULL,               -- Referência opcional ao ID do usuário associado

    -- Definição da chave primária
    CONSTRAINT profiles_pk PRIMARY KEY (id),

    -- Chave estrangeira referenciando a tabela 'users'
    CONSTRAINT profiles_fk FOREIGN KEY (user_id) REFERENCES estudos.users(id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Adição de colunas de controle de tempo na tabela 'users'
ALTER TABLE estudos.users 
ADD created_at DATETIME DEFAULT NOW() NOT NULL, -- Registro da data de criação
ADD updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() NOT NULL;

-- Adição de colunas de controle de tempo na tabela 'users_role'
ALTER TABLE estudos.users_role 
ADD created_at DATETIME DEFAULT NOW() NOT NULL, -- Registro da data de criação
ADD updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() NOT NULL;
