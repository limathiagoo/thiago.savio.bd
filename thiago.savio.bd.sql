-- 1. Criação do banco de dados
CREATE DATABASE loja;

-- Seleção do banco de dados para uso
USE loja;

-- 2. Criação das tabelas

-- Tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela Pedidos (com chave estrangeira para Clientes)
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 3. Inserção de dados

-- Inserção de dados na tabela Clientes
INSERT INTO Clientes (nome, email, telefone) 
VALUES 
('Ana Silva', 'ana.silva@example.com', '11-91234-5678'),
('Carlos Souza', 'carlos.souza@example.com', '11-99876-5432'),
('Juliana Costa', 'juliana.costa@example.com', '21-98765-4321'),
('Marcos Pereira', 'marcos.pereira@example.com', '21-97654-3210'),
('Lucas Oliveira', 'lucas.oliveira@example.com', '31-96543-2109');

-- Inserção de dados na tabela Pedidos
INSERT INTO Pedidos (data_pedido, valor_total, id_cliente) 
VALUES 
('2025-05-10', 150.75, 1),  -- Pedido de Ana Silva
('2025-05-11', 200.40, 2),  -- Pedido de Carlos Souza
('2025-05-12', 80.50, 3),   -- Pedido de Juliana Costa
('2025-05-13', 120.00, 4),  -- Pedido de Marcos Pereira
('2025-05-14', 250.00, 5);  -- Pedido de Lucas Oliveira

-- 4. Consultas

-- Consulta 1: Listar todos os clientes
SELECT * FROM Clientes;

-- Consulta 2: Listar todos os pedidos com o nome do cliente
SELECT Pedidos.id_pedido, Pedidos.data_pedido, Pedidos.valor_total, Clientes.nome AS cliente_nome
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente;

-- Consulta 3: Buscar pedidos feitos por "Ana Silva"
SELECT Pedidos.id_pedido, Pedidos.data_pedido, Pedidos.valor_total
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
WHERE Clientes.nome = 'Ana Silva';

-- Consulta 4: Contar o número de pedidos por cliente
SELECT Clientes.nome, COUNT(Pedidos.id_pedido) AS total_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id_cliente = Pedidos.id_cliente
GROUP BY Clientes.id_cliente;

-- Consulta 5: Buscar pedidos com valor total superior a R$ 150,00
SELECT id_pedido, data_pedido, valor_total
FROM Pedidos
WHERE valor_total > 150.00;

