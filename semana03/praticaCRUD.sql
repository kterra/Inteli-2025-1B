DROP TABLE IF EXISTS alunos;
CREATE TABLE alunos (
    id INT PRIMARY KEY,        
    nome VARCHAR(100),         
    idade INT,                 
    curso VARCHAR(100)      
);

INSERT INTO alunos (id, nome, idade, curso)
VALUES
    (1, 'Ana', 20, 'Engenharia'),
    (2, 'Carlos', 22, 'História'),
    (3, 'Bruna', 19, 'Matemática'),
	 (4, 'Diego', NULL, 'Física');

INSERT INTO alunos (id, nome, idade)
VALUES (5, 'Bianca', 21);

SELECT * FROM alunos;

SELECT nome, curso FROM alunos;

SELECT * FROM alunos WHERE idade > 21;

SELECT nome, curso FROM alunos
WHERE (curso = 'Engenharia' OR curso = 'Matemática') AND idade >= 20;

UPDATE alunos
SET nome = 'Ana Clara', curso = 'Engenharia de Produção'
WHERE id = 1;

/*Para a instância com id = 1, o nome vai ser alterada para Ana Clara e o curso para Engenharia de Produção. */

UPDATE alunos
SET curso = 'A definir';

DELETE FROM alunos
WHERE id = 1;

DELETE FROM alunos
WHERE curso = 'História' AND idade < 22;

DELETE FROM alunos
WHERE curso IS NULL;

SELECT * FROM alunos WHERE nome LIKE 'A%';  -- Começa com A
SELECT * FROM alunos WHERE nome LIKE '%a';  -- Termina com a
SELECT * FROM alunos WHERE nome LIKE '%ar%'; -- Contém "ar"

SELECT idade * 2 FROM alunos;

SELECT idade / 2 FROM alunos;

SELECT idade + 5 FROM alunos;

SELECT idade - 1 FROM alunos;


CREATE TABLE aluno (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE curso (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE matricula (
    id_aluno INT,
    id_curso INT,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);


