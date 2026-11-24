CREATE DATABASE db_livraria;

USE db_livraria;

CREATE TABLE tbl_editoras (
    id INT,
    nome_empresa VARCHAR(100) NOT NULL,
    telefone_contato VARCHAR(21),
    email_corporativo VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE tbl_autores (
    id INT,
    nome_completo VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    PRIMARY KEY (id)
);

CREATE TABLE tbl_livros (
    id_editora INT NOT NULL,
    isbn VARCHAR(13),
    titulo VARCHAR(150) NOT NULL,
    preco_venda_atual DECIMAL(10,2) NOT NULL,
    qtd_estoque INT NOT NULL,
    ano_publicacao INT,
    PRIMARY KEY (isbn),
    FOREIGN KEY (id_editora) REFERENCES tbl_editoras(id),
    CHECK (preco_venda_atual >= 0),
    CHECK (qtd_estoque >= 0)
);

CREATE TABLE tbl_livro_autor (
    isbn VARCHAR(13),
    id_autor INT,
    PRIMARY KEY (isbn,id_autor),
    FOREIGN KEY (isbn) REFERENCES tbl_livros(isbn),
    FOREIGN KEY (id_autor) REFERENCES tbl_autores(id)
);

CREATE TABLE tbl_clientes (
    id INT,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    data_cadastro DATE,
    PRIMARY KEY (id)
);

CREATE TABLE tbl_pedidos (
    id INT,
    data_hora DATETIME2,
    valor_total DECIMAL(10,2),
    id_cliente INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES tbl_clientes(id),
    CHECK (valor_total >= 0)
);

CREATE TABLE tbl_item_pedido (
    id INT,
    id_pedido INT NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario_venda DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_pedido) REFERENCES tbl_pedidos(id),
    FOREIGN KEY (isbn) REFERENCES tbl_livros(isbn),
    UNIQUE (id_pedido,isbn),
    CHECK (quantidade > 0),
    CHECK (preco_unitario_venda >= 0)
);



INSERT INTO tbl_editoras (id,nome_empresa,telefone_contato,email_corporativo) VALUES

(1,'Companhia das Letras','1137013500','contato@companhiadasletras.com.br'),
(2,'Editora Moderna','1132290000','contato@moderna.com.br'),
(3,'Editora Rocco','2135228000','contato@rocco.com.br'),
(4,'Editora Record','2135890000','contato@record.com.br'),
(5,'Editora Intrinseca','2132078900','contato@intrinseca.com.br'),
(6,'Editora Arqueiro','1130304000','contato@arqueiro.com.br'),
(7,'Editora Atlas','1136169000','contato@atlas.com.br'),
(8,'Editora Sextante','2132956000','contato@sextante.com.br'),
(9,'Editora Globo','1137664000','contato@globo.com.br'),
(10,'Editora Planeta','1130830000','contato@planeta.com.br');

SELECT * FROM tbl_editoras;


INSERT INTO tbl_clientes (id,nome_completo,email,cpf,data_cadastro) VALUES

(1,'Mariana Oliveira','mariana.oliveira@gmail.com','384.729.150-62','2026-01-12'),
(2,'Lucas Ferreira','lucas.ferreira@gmail.com','521.638.940-17','2026-01-18'),
(3,'Beatriz Santos','beatriz.santos@gmail.com','197.462.830-51','2026-02-03'),
(4,'Gabriel Costa','gabriel.costa@gmail.com','638.251.790-04','2026-02-11'),
(5,'Camila Rodrigues','camila.rodrigues@gmail.com','275.819.460-38','2026-02-20'),
(6,'Pedro Almeida','pedro.almeida@gmail.com','419.572.680-93','2026-03-02'),
(7,'Isabela Martins','isabela.martins@gmail.com','852.314.970-26','2026-03-15'),
(8,'Rafael Carvalho','rafael.carvalho@gmail.com','163.948.520-71','2026-04-04'),
(9,'Ana Clara Souza','anaclara.souza@gmail.com','746.125.890-32','2026-04-19'),
(10,'Thiago Lima','thiago.lima@gmail.com','938.461.250-85','2026-05-07');

SELECT * FROM tbl_clientes;


INSERT INTO tbl_autores (id,nome_completo,nacionalidade,data_nascimento) VALUES

(1,'Machado de Assis','Brasileira','1839-06-21'),
(2,'Clarice Lispector','Brasileira','1920-12-10'),
(3,'Graciliano Ramos','Brasileira','1892-10-27'),
(4,'Jorge Amado','Brasileira','1912-08-10'),
(5,'Rachel de Queiroz','Brasileira','1910-11-17'),
(6,'Carolina Maria de Jesus','Brasileira','1914-03-14'),
(7,'Itamar Vieira Junior','Brasileira','1979-08-06'),
(8,'Paulo Coelho','Brasileira','1947-08-24'),
(9,'Monteiro Lobato','Brasileira','1882-04-18'),
(10,'Cecilia Meireles','Brasileira','1901-11-07'),
(11,'Jane Austen','Britanica','1775-12-16'),
(12,'George Orwell','Britanica','1903-06-25'),
(13,'J.R.R. Tolkien','Britanica','1892-01-03'),
(14,'J.K. Rowling','Britanica','1965-07-31'),
(15,'Agatha Christie','Britanica','1890-09-15'),
(16,'Stephen King','Americana','1947-09-21'),
(17,'Mary Shelley','Britanica','1797-08-30'),
(18,'Bram Stoker','Irlandesa','1847-11-08'),
(19,'Ernest Hemingway','Americana','1899-07-21'),
(20,'Franz Kafka','Tcheca','1883-07-03'),
(21,'Albert Camus','Francesa','1913-11-07'),
(22,'Gabriel Garcia Marquez','Colombiana','1927-03-06'),
(23,'Isabel Allende','Chilena','1942-08-02'),
(24,'Umberto Eco','Italiana','1932-01-05'),
(25,'Yuval Noah Harari','Israelense','1976-02-24'),
(26,'Djamila Ribeiro','Brasileira','1980-08-01'),
(27,'Ailton Krenak','Brasileira','1953-09-29'),
(28,'Emily Bronte','Britanica','1818-07-30'),
(29,'Antoine de Saint-Exupery','Francesa','1900-06-29'),
(30,'Robert Louis Stevenson','Escocesa','1850-11-13'),
(31,'Jose de Alencar','Brasileira','1829-05-01'),
(32,'Carlos Drummond de Andrade','Brasileira','1902-10-31'),
(33,'Mario de Andrade','Brasileira','1893-10-09'),
(34,'Vinicius de Moraes','Brasileira','1913-10-19'),
(35,'Lygia Fagundes Telles','Brasileira','1918-04-19'),
(36,'Cora Coralina','Brasileira','1889-08-20'),
(37,'Luis Fernando Verissimo','Brasileira','1936-09-26'),
(38,'Fernando Sabino','Brasileira','1923-10-12'),
(39,'Pedro Bandeira','Brasileira','1942-03-09'),
(40,'Ziraldo','Brasileira','1932-10-24'),
(41,'William Shakespeare','Inglesa','1564-04-26'),
(42,'Charles Dickens','Inglesa','1812-02-07'),
(43,'Victor Hugo','Francesa','1802-02-26'),
(44,'Jules Verne','Francesa','1828-02-08'),
(45,'Fiodor Dostoievski','Russa','1821-11-11'),
(46,'Leon Tolstoi','Russa','1828-09-09'),
(47,'Haruki Murakami','Japonesa','1949-01-12'),
(48,'Edgar Allan Poe','Americana','1809-01-19'),
(49,'Oscar Wilde','Irlandesa','1854-10-16'),
(50,'Lewis Carroll','Britanica','1832-01-27');

SELECT * FROM tbl_autores;


INSERT INTO tbl_livros (isbn,titulo,preco_venda_atual,qtd_estoque,ano_publicacao,id_editora) VALUES

('9786500000001','Dom Casmurro',39.90,12,1899,1),
('9786500000002','A Hora da Estrela',32.90,8,1977,2),
('9786500000003','Vidas Secas',35.50,15,1938,3),
('9786500000004','Capitaes da Areia',42.90,10,1937,4),
('9786500000005','O Quinze',29.90,7,1930,5),
('9786500000006','Quarto de Despejo',38.90,9,1960,6),
('9786500000007','Torto Arado',49.90,18,2019,1),
('9786500000008','O Alquimista',44.90,20,1988,8),
('9786500000009','O Sitio do Picapau Amarelo',36.90,11,1920,9),
('9786500000010','Romanceiro da Inconfidencia',34.90,6,1953,10),
('9786500000011','Orgulho e Preconceito',39.90,14,1813,3),
('9786500000012','1984',42.50,16,1949,4),
('9786500000013','O Hobbit',54.90,13,1937,5),
('9786500000014','Harry Potter',59.90,22,1997,1),
('9786500000015','Assassinato no Expresso Oriente',46.90,9,1934,6),
('9786500000016','It A Coisa',64.90,5,1986,7),
('9786500000017','Frankenstein',37.90,12,1818,8),
('9786500000018','Dracula',41.90,8,1897,9),
('9786500000019','O Velho e o Mar',31.90,10,1952,10),
('9786500000020','A Metamorfose',27.90,17,1915,2),
('9786500000021','O Estrangeiro',33.90,11,1942,3),
('9786500000022','Cem Anos de Solidao',52.90,7,1967,4),
('9786500000023','A Casa dos Espiritos',47.90,10,1982,5),
('9786500000024','O Nome da Rosa',49.90,6,1980,6),
('9786500000025','Sapiens',58.90,14,2011,7),
('9786500000026','Pequeno Manual Antirracista',29.90,19,2019,8),
('9786500000027','Ideias para Adiar o Fim do Mundo',34.90,13,2019,9),
('9786500000028','O Morro dos Ventos Uivantes',39.90,8,1847,10),
('9786500000029','O Pequeno Principe',29.90,25,1943,1),
('9786500000030','O Medico e o Monstro',32.90,9,1886,2);

SELECT * FROM tbl_livros;


INSERT INTO tbl_livro_autor (isbn,id_autor) VALUES

('9786500000001',1),
('9786500000002',2),
('9786500000003',3),
('9786500000004',4),
('9786500000005',5),
('9786500000006',6),
('9786500000007',7),
('9786500000008',8),
('9786500000009',9),
('9786500000010',10),
('9786500000011',11),
('9786500000012',12),
('9786500000013',13),
('9786500000014',14),
('9786500000015',15),
('9786500000016',16),
('9786500000017',17),
('9786500000018',18),
('9786500000019',19),
('9786500000020',20),
('9786500000021',21),
('9786500000022',22),
('9786500000023',23),
('9786500000024',24),
('9786500000025',25),
('9786500000026',26),
('9786500000027',27),
('9786500000028',28),
('9786500000029',29),
('9786500000030',30),
('9786500000001',31),
('9786500000002',32),
('9786500000003',33),
('9786500000004',34),
('9786500000005',35),
('9786500000006',36),
('9786500000007',37),
('9786500000008',38),
('9786500000009',39),
('9786500000010',40),
('9786500000011',41),
('9786500000012',42),
('9786500000013',43),
('9786500000014',44),
('9786500000015',45),
('9786500000016',46),
('9786500000017',47),
('9786500000018',48),
('9786500000019',49),
('9786500000020',50);

SELECT * FROM tbl_livro_autor;


INSERT INTO tbl_pedidos (id,data_hora,valor_total,id_cliente) VALUES

(1,'2026-05-10 10:25:00',69.80,1),
(2,'2026-05-12 14:40:00',126.70,2),
(3,'2026-05-15 09:15:00',60.80,3),
(4,'2026-05-18 16:30:00',99.70,4),
(5,'2026-05-20 11:50:00',91.80,5),
(6,'2026-05-23 13:20:00',100.70,6),
(7,'2026-05-25 15:10:00',71.80,7),
(8,'2026-05-27 12:45:00',111.70,8),
(9,'2026-05-29 17:05:00',78.80,9),
(10,'2026-05-31 18:20:00',107.70,10);

SELECT * FROM tbl_pedidos;


INSERT INTO tbl_item_pedido (id,id_pedido,isbn,quantidade,preco_unitario_venda) VALUES

(1,1,'9786500000001',1,39.90),
(2,1,'9786500000002',1,29.90),

(3,2,'9786500000003',2,45.90),
(4,2,'9786500000004',1,34.90),

(5,3,'9786500000005',1,32.90),
(6,3,'9786500000006',1,27.90),

(7,4,'9786500000007',1,49.90),
(8,4,'9786500000008',2,24.90),

(9,5,'9786500000009',1,54.90),
(10,5,'9786500000010',1,36.90),

(11,6,'9786500000011',2,28.90),
(12,6,'9786500000012',1,42.90),

(13,7,'9786500000013',1,39.90),
(14,7,'9786500000014',1,31.90),

(15,8,'9786500000015',1,59.90),
(16,8,'9786500000016',2,25.90),

(17,9,'9786500000017',1,44.90),
(18,9,'9786500000018',1,33.90),

(19,10,'9786500000019',2,29.90),
(20,10,'9786500000020',1,47.90);

SELECT * FROM tbl_item_pedido;


SELECT * FROM tbl_editoras;
SELECT * FROM tbl_clientes;
SELECT * FROM tbl_autores;
SELECT * FROM tbl_livros;
SELECT * FROM tbl_livro_autor;
SELECT * FROM tbl_pedidos;
SELECT * FROM tbl_item_pedido;
