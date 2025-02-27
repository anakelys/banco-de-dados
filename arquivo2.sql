-- Exercício 1:

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,  
    idade INT NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    classes_id BIGINT
);

INSERT INTO tb_classes (nome, descricao) VALUES
("Brujah", "Clã de vampiros guerreiros e rebeldes"),
("Tremere", "Mestres da feitiçaria vampírica"),
("Nosferatu", "Vampiros furtivos e deformados"),
("Ventrue", "Nobres e líderes aristocráticos"),
("Toreador", "Vampiros artistas e hedonistas");

INSERT INTO tb_personagens (nome, idade, ataque, defesa, classes_id) VALUES
("Lucian", 150, 2200, 1000, 1),
("Magnus", 300, 2500, 1800, 2),
("Silas", 250, 1900, 900, 3),
("Cornelius", 400, 2800, 1200, 4),
("Isabella", 200, 2300, 700, 5),
("Dorian", 180, 2600, 1500, 1),
("Selene", 220, 2000, 500, 3),
("Raphael", 350, 2700, 1300, 4);


ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (classes_id) REFERENCES tb_classes (id);

-- Selecionando todos os personagens com ataque maior que 2000
SELECT * FROM tb_personagens WHERE ataque > 2000;

-- Selecionando todos os personagens com defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

-- Selecionando todos os personagens cujo nome contém a letra 'C'
SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

SELECT * 
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classes_id = tb_classes.id;

SELECT *
FROM tb_personagens 
INNER JOIN tb_classes  
ON tb_personagens.classes_id = tb_classes.id 
WHERE tb_classes.nome = "Brujah";

-- Exercício 2: 

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL, 
    descricao VARCHAR(255) NOT NULL      
);

CREATE TABLE tb_pizzas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    categorias_id BIGINT,
    FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, descricao) VALUES
("Tradicional", "Sabores clássicos"),
("Especial", "Combinações diferentonas"),
("Doce", "Sabores de sobremesas tradicionais"),
("Vegana", "Não contém ingredientes de origem animal"),
("Premium", "Ingredientes nobres e combinações exclusivas");

INSERT INTO tb_pizzas (nome, ingredientes, valor, tamanho, categorias_id) VALUES
("Margherita", "Molho de tomate, mussarela, manjericão", 42.00, "M", 1),
("Calabresa", "Molho de tomate, calabresa, cebola", 59.90, "G", 1),
("Frango com Catupiry", "Molho de tomate, mussarela, frango desfiado, catupiry", 71.00, "G", 2),
("Quatro Queijos", "Molho de tomate, mussarela, parmesão, provolone, gorgonzola", 63.00, "G", 2),
("Chocolate com Morango", "Chocolate, morango, leite condensado", 50.00, "M", 3),
("Banana com Canela", "Banana, canela, açúcar, leite condensado", 38.00, "P", 3),
("Vegetariana", "Molho de tomate, pimentão, cogumelos, azeitona, cebola", 46.00, "M", 4),
("Romeu e Julieta", "Mussarela, goiabada, catupiry", 58.00, "G", 5);

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

SELECT * 
FROM tb_pizzas 
INNER JOIN tb_categorias 
ON tb_pizzas.categorias_id = tb_categorias.id;

SELECT * 
FROM tb_pizzas 
INNER JOIN tb_categorias 
ON tb_pizzas.categorias_id = tb_categorias.id
WHERE tb_categorias.tipo = "Premium";

-- Exercício 3: 

CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    setor VARCHAR(255) NOT NULL,  -- Indica a área da farmácia (Ex: Medicamentos, Higiene, etc.)
    publico_alvo VARCHAR(255) NOT NULL -- Indica para quem o produto é destinado (Ex: Adulto, Infantil)
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    estoque INT NOT NULL,
    categorias_id BIGINT,
    FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (setor, publico_alvo) VALUES
("Medicamentos", "Crianças e adultos"),
("Higiene Pessoal", "Todos"),
("Cosméticos", "Adulto"),
("Muito infantil", "Crianças"),
("Primeiros Socorros", "Adulto");

INSERT INTO tb_produtos (nome, descricao, valor, estoque, categorias_id) VALUES
("Dipirona", "Analgésico e antitérmico", 17.00, 120, 1),
("Gel de Limpeza Facial", "Remove impurezas sem ressecar a pele", 29.90, 50, 2),
("Protetor Solar FPS 60", "Alta proteção UVA e UVB", 59.90, 40, 3),
("Fralda Supreme Care XG", "Fralda que proporciona conforto e absorção", 72.50, 35, 4),
("Condicionador Nutritivo", "Fortalece e hidrata os cabelos", 27.00, 45, 2),
("Sabonete Líquido Glicerina", "Auxilia na limpeza da pele", 90.00, 25, 4),
("Pomada Antisséptica", "Cicatrização para pequenos cortes", 22.00, 60, 5),
("Esparadrapo", "Auxilia na criação de curativos", 8.50, 500, 5);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * 
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * 
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categorias_id = tb_categorias.id
WHERE tb_categorias.setor = "Medicamentos";

-- Exercício 4: 

CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,  
    fabricante VARCHAR(255) NOT NULL  
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    peso_kg DECIMAL(5,2) NOT NULL,
    categorias_id BIGINT,
    FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, fabricante) VALUES
("Bovina", "Carne & Cia"),
("Suína", "Fazenda do Sabor"),
("Aves", "Granja Suprema"),
("Exóticas", "Selvagem Gourmet"),
("Embutidos", "Defumados Imperial");

INSERT INTO tb_produtos (nome, quantidade, valor, peso_kg, categorias_id) VALUES
("Picanha", 1, 120.00, 1.00, 1),
("Costelinha Suína", 2, 75.00, 1.20, 2),
("Frango Caipira", 1, 55.00, 1.50, 3),
("Filé de Javali", 4, 140.00, 0.80, 4),
("Linguiça Toscana", 10, 35.00, 1.00, 5),
("Alcatra", 3, 95.00, 1.20, 1),
("Bacon Defumado", 6, 48.00, 0.80, 5),
("Coxa e Sobrecoxa", 4, 42.00, 1.50, 3);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * 
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * 
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categorias_id = tb_categorias.id
WHERE tb_categorias.tipo = "Aves";

-- Exercício 5: 

CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL, 
    descricao VARCHAR(255) NOT NULL  
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL, 
    unidade_medida VARCHAR(50) NOT NULL,  
    preco DECIMAL(6,2) NOT NULL, 
    estoque INT NOT NULL, 
    categorias_id BIGINT,  
    FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
("Alvenaria", "Produtos para a construção, fundações e acabamentos."),
("Ferramentas", "Ferramentas manuais e elétricas."),
("Acabamentos", "Produtos para acabamento de pisos e paredes."),
("Hidráulicos", "Produtos relacionados ao encanamento e sistemas hidráulicos."),
("Elétricos", "Produtos para instalação elétrica e componentes eletrônicos.");

INSERT INTO tb_produtos (nome_produto, unidade_medida, preco, estoque, categorias_id) VALUES
("Cimento", "saco", 35.00, 1000, 1),
("Areia", "metro cúbico", 120.00, 500, 1),
("Tinta PVA", "litro", 20.00, 300, 3),
("Martelo", "unidade", 15.00, 200, 2),
("Prego 3 Pol.", "unidade", 0.05, 1500, 2),
("Tubo PVC 25mm", "metro", 8.00, 1000, 4),
("Caixa de Tomada", "unidade", 12.00, 400, 5),
("Lâmpada LED", "unidade", 35.00, 600, 5);

-- Selecionando todos os produtos com valor maior que R$ 100,00
SELECT * FROM tb_produtos WHERE preco > 100.00;

-- Selecionando todos os produtos cujo valor está entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 70.00 AND 150.00;

-- Selecionando todos os produtos cujo nome contém a letra 'T'
SELECT * FROM tb_produtos WHERE nome_produto LIKE "%C%";

SELECT * 
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categorias_id = tb_categorias.id;

SELECT * 
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categorias_id = tb_categorias.id
WHERE tb_categorias.nome = "Hidráulicos";

-- Exercício 6: 

CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL, 
    tipo VARCHAR(255) NOT NULL
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL, 
    duracao_horas INT NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL, 
    nivel VARCHAR(50) NOT NULL, 
    categorias_id BIGINT, 
    FOREIGN KEY (categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, tipo) VALUES
("Tecnologia", "Aperfeiçoamento"),
("Marketing", "Capacitação"),
("Design", "Curso Livre"),
("Jogos", "Curso Técnico"),
("Negócios", "Curso de Extensão");

INSERT INTO tb_cursos (nome, duracao_horas, preco, nivel, categorias_id) VALUES
("Desenvolvimento Web", 40, 399.99, "Intermediário", 1),
("Marketing Digital", 30, 799.99, "Avançado", 2),
("Design Gráfico Avançado", 50, 850.00, "Avançado", 3),
("Desenvolvimento de Jogos com Unity", 60, 1200.00, "Avançado", 4),
("Gestão de Negócios Digitais", 45, 750.00, "Intermediário", 5),
("Java para Iniciantes", 35, 455.00, "Básico", 1),
("Edição de Vídeos para Mídias Sociais", 25, 450.00, "Intermediário", 2),
("Design de Jogos", 40, 650.00, "Intermediário", 4);

SELECT * FROM tb_cursos WHERE preco > 500.00;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE "%J%";

SELECT * 
FROM tb_cursos 
INNER JOIN tb_categorias 
ON tb_cursos.categorias_id = tb_categorias.id;

SELECT * 
FROM tb_cursos 
INNER JOIN tb_categorias 
ON tb_cursos.categorias_id = tb_categorias.id
WHERE tb_categorias.nome = "Tecnologia";