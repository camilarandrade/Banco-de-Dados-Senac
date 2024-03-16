################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
CREATE TABLE IF NOT EXISTS Fornecedor (
Id INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Endereco VARCHAR(100) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
Email VARCHAR(20) NOT NULL,
Observacao TEXT
);
-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.

ALTER TABLE Fornecedor 
ADD COLUMN 
CNPJ VARCHAR(50);

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.

ALTER TABLE Fornecedor ADD COLUMN CategoriaID INT,
ADD FOREIGN KEY (CategoriaID) REFERENCES Categoria(Id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE Fornecedor 
MODIFY Telefone VARCHAR(15); 

-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.

ALTER TABLE Fornecedor DROP COLUMN Observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
DROP TABLE Fornecedor; 

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome

INSERT INTO Cliente (Nome, Email, Telefone) VALUES
    ('Camila Andrade', 'camila@example.com', '1234567890'),
    ('Maria Oliveira', 'maria@example.com', '2345678901'),
    ('Carlos Santos', 'carlos@example.com', '3456789012'),
    ('Ana Souza', 'ana@example.com', '4567890123'),
    ('Lucas Pereira', 'lucas@example.com', '5678901234');

-- Formas de Pagamento
INSERT INTO FormaPagamento (Nome, Descricao) VALUES
    ('Cartão de Crédito', 'Pagamento com cartão de crédito'),
    ('Boleto Bancário', 'Pagamento via boleto'),
    ('Transferência Bancária', 'Pagamento por transferência');
    
-- Pedidos

INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status) VALUES
    (1, '2024-02-01', 1, 'Em processamento'),
    (2, '2024-02-02', 2, 'Aguardando pagamento'),
    (3, '2024-02-03', 1, 'Enviado'),
    (4, '2024-02-04', 3, 'Entregue'),
    (5, '2024-02-05', 2, 'Cancelado');
    
-- Categorias

INSERT INTO Categoria (Nome, Descricao) VALUES
    ('Roupas', 'Roupas masculinas e femininas'),
    ('Calçados', 'Calçados masculinos e femininos'),
    ('Acessórios', 'Acessórios esportivos'),
    ('Bolsas', 'Bolsas femininas'),
    ('Relógios', 'Relógios analógicos e digitais');

-- Produtos
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID) VALUES
    ('Camiseta', 'Camiseta de algodão', 19.99, 1),
    ('Calça Jeans', 'Calça jeans masculina', 49.99, 2),
    ('Tênis', 'Tênis esportivo', 59.99, 3),
    ('Bolsa', 'Bolsa feminina', 29.99, 4),
    ('Relógio', 'Relógio analógico', 39.99, 5);
    
    -- Inserção de registros na tabela ItemPedido    
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao)VALUES 
    (4, 2, 1, 1),
    (5, 3, 2, 1),
    (1, 4, 3, 1),
    (2, 5, 1, 1),
    (3, 1, 2, 1);
    
-- Inserção de registros na tabela GrupoUsuário
INSERT INTO GrupoUsuario (Nome, Descricao) VALUES 
    ('Administradores', 'Grupo de usuários com permissões de administração'),
    ('Usuários Comuns', 'Grupo de usuários comuns');
    
-- Inserção de registros na tabela Permissao    
INSERT INTO Permissao (Nome, Descricao) VALUES 
    ('Leitura', 'Permissão para leitura'),
    ('Escrita', 'Permissão para escrita'),
    ('Exclusão', 'Permissão para exclusão'),
    ('Administração', 'Permissão para administração');

    
-- 1. Atualizar o nome de um cliente:

-- alterando o nome Camila para Rafael--
UPDATE Cliente
SET Nome = 'Rafael Mesquita'
WHERE Id= 1;

SELECT * FROM Cliente;

-- 2. Deletar um produto:

-- deletando o produto Calça Jeans (deu erro) --

DELETE FROM Produto
WHERE Id= 1;

SELECT*FROM Produto;

-- 3. Alterar a categoria de um produto:

-- ALTERANDO A CATEGORIA DA CAMISETA PRA 3--

UPDATE Produto
SET CategoriaID = 3
WHERE Id = 1;

SELECT*FROM Produto;

-- 4. Inserir um novo cliente:

INSERT INTO Cliente (Nome, Email, Telefone)
VALUES ('Daiane Nogueira', 'daymeuamor@example.com', '123456789');

-- 5. Inserir um novo pedido:

INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status)
VALUES (1, '2024-03-15', 1, 'Aguardando Pagamento');

SELECT*FROM Pedido; 

-- 6. Atualizar o preço de um produto:
-- alterando o valor do relógio de 59,99 para 39,99 -- 

UPDATE Produto
SET Preco = 39.99
WHERE Id = 2;

SELECT*FROM Produto;

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:

SELECT * FROM Produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:

SELECT Nome, Preco 
FROM Produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:

SELECT * 
FROM Produto
ORDER BY Preco ASC;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:

SELECT * 
FROM Produto
ORDER BY Preco DESC;

-- 5. Selecione os nomes distintos das categorias da tabela Categoria:



-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:

SELECT * FROM Produto
WHERE Preco 
BETWEEN 10.00 AND 50.00;

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":

SELECT Nome AS 'Nome do Produto', 
Preco AS 'Preço Unitário'
FROM Produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:


-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:

SELECT * 
FROM Produto
LIMIT 10;

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
-- não vai aparecer nada pois só tem cinco produtos--

SELECT * FROM Produto
LIMIT 10 
OFFSET 5;

############# DQL - Joins

-- 1. Selecione o nome do produto e sua categoria:


-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:


-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:

############### DQL com joins e demais filtros

-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:


-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:


-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda

-- Início da transação
START TRANSACTION;

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)

COMMIT;