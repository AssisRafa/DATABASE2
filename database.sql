CREATE DATABASE exemplo_db;


\c exemplo_db;


CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE OR REPLACE FUNCTION atualizar_data_criacao()
RETURNS TRIGGER AS $$
BEGIN
    NEW.data_criacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_atualizar_data_criacao
BEFORE INSERT ON usuarios
FOR EACH ROW
EXECUTE FUNCTION atualizar_data_criacao();

-- Criar o banco de dados
CREATE DATABASE exemplo_db;

-- Conectar ao banco de dados exemplo_db
\c exemplo_db;

-- Criar a tabela "usuarios"
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarios(id),
    produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE OR REPLACE FUNCTION atualizar_data_criacao()
RETURNS TRIGGER AS $$
BEGIN
    NEW.data_criacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_atualizar_data_criacao
BEFORE INSERT ON usuarios
FOR EACH ROW
EXECUTE FUNCTION atualizar_data_criacao();
