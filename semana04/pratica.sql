CREATE TABLE IF NOT EXISTS  curso  (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(400)
);

CREATE TABLE IF NOT EXISTS aluno (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
	idade INT,
	curso_id INT,
	FOREIGN KEY (curso_id) REFERENCES curso(id)
);

-- Inserção de 5 cursos
INSERT INTO curso (id, nome, descricao) VALUES
(1, 'Ciência da Computação', 'Curso com foco em algoritmos e sistemas computacionais.'),
(2, 'Engenharia de Software', 'Curso voltado para o desenvolvimento e manutenção de software.'),
(3, 'Sistemas de Informação', 'Curso que une tecnologia da informação e gestão.'),
(4, 'Engenharia da Computação', 'Curso que abrange hardware e software.'),
(5, 'ADM Tech', 'Curso que combina administração e computação');

-- Inserção de 50 alunos
INSERT INTO aluno (id, nome, idade, curso_id) VALUES
(1, 'Ana Oliveira', 20, 1),
(2, 'Bruno Santos', 21, 2),
(3, 'Carla Souza', 22, 3),
(4, 'Daniel Lima', 19, 4),
(5, 'Eduarda Rocha', 20, 5),
(6, 'Felipe Andrade', 23, 1),
(7, 'Gustavo Rezende', 20, 2),
(8, 'Helena Costa', 21, 3),
(9, 'Igor Silva', 22, 4),
(10, 'Juliana Teixeira', 19, 5),
(11, 'Kaio Fernandes', 20, 1),
(12, 'Larissa Almeida', 21, 2),
(13, 'Marcelo Pires', 23, 3),
(14, 'Natália Lopes', 20, 4),
(15, 'Otávio Ribeiro', 22, 5),
(16, 'Paula Gomes', 21, 1),
(17, 'Rafael Martins', 22, 2),
(18, 'Sabrina Monteiro', 20, 3),
(19, 'Tiago Nascimento', 23, 4),
(20, 'Vanessa Farias', 19, 5),
(21, 'Wesley Dias', 20, 1),
(22, 'Yasmin Cunha', 21, 2),
(23, 'Arthur Melo', 22, 3),
(24, 'Beatriz Barros', 20, 4),
(25, 'Caio Dantas', 19, 5),
(26, 'Daniele Meireles', 20, 1),
(27, 'Emanuel Castro', 21, 2),
(28, 'Fernanda Tavares', 23, 3),
(29, 'Giovanni Assis', 20, 4),
(30, 'Heloísa Duarte', 22, 5),
(31, 'Isabela Braga', 21, 1),
(32, 'João Pedro Lira', 20, 2),
(33, 'Kelly Barbosa', 22, 3),
(34, 'Leonardo Azevedo', 23, 4),
(35, 'Mariana Ferreira', 19, 5),
(36, 'Nicolas Rocha', 20, 1),
(37, 'Olívia Matos', 21, 2),
(38, 'Pedro Henrique Alves', 22, 3),
(39, 'Quésia Ramos', 20, 4),
(40, 'Renan Vieira', 23, 5),
(41, 'Samara Xavier', 20, 1),
(42, 'Thiago Lopes', 21, 2),
(43, 'Ursula Andrade', 22, 3),
(44, 'Vinícius Moreira', 20, 4),
(45, 'Wanessa Silva', 19, 5),
(46, 'Xavier Pinto', 20, 1),
(47, 'Yuri Cardoso', 21, 2),
(48, 'Zélia Magalhães', 22, 3),
(49, 'Anderson Figueiredo', 23, 4),
(50, 'Bianca Neves', 20, 5);
