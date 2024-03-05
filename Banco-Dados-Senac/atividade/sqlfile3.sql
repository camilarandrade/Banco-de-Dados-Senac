SELECT * FROM Aluno;
 
-- SELECT
-- FROM
-- WHERE
-- ORDER BY
 
SELECT nome, cpf
FROM aluno;
 
SELECT *
FROM  aluno
WHERE matricula > 3
ORDER BY nome;
 
-- Operadores Matemáticos e Lógicos:
SELECT * FROM disciplina;
 
SELECT nome, horas
FROM disciplina
WHERE horas >= 40 AND horas <= 50;
 
-- Aliases para Melhor Legibilidade
SELECT nome AS nome_disciplina, horas AS carga_horario
FROM disciplina;

SELECT id, nome as Nome_Professor
FROM professor
WHERE id > 2 AND id < 6
ORDER BY nome;

-- Exemplo: Contar quantas disciplinas existem

SELECT COUNT(*) AS QuantidadeDeDisciplinas 
FROM disciplina
WHERE horas > 50;

-- Me informe quantas matrículas foram feitas no curso de ID 2

SELECT COUNT(*) AS QuantidadeMatriculas
FROM matricula
where curso_id = 2;

-- Exemplo: Selecionas professor com especialização que envolva Tecnologia

SELECT *
FROM professor
WHERE especializacao LIKE '%Tecnologia%'; 

-- Exercício: Selecione todos os cursos que terminem com "medicina" ou começa com a letra "D"
SELECT *
FROM curso
WHERE nome LIKE '%medicina' OR nome like 'D%'; 

-- Utilizando o DISTINCT para Obter Valores Distintos 
SELECT DISTINCT especializacao FROM professor; 

-- ------------------------
-- Consultas Intermediárias 
-- ------------------------

-- Exemplo 1: Combinar dados de aluno e matrícula usando INNER JOIN
SELECT aluno.nome, aluno.cpf, matricula.DataMatricula
FROM aluno
INNER JOIN matricula ON aluno.Matricula = matricula.Aluno_ID;

-- Exemplo 2: Combinar dados de professor e disciplina usando INNER JOIN

SELECT professor.nome, diciplina.nome
FROM professor
INNER JOIN professores_disciplinas ON professor.id = professores_disciplinas.professor_id;
INNER JOIN disciplina ON professores_disciplinas.disciplinas_id = disciplina.id;


 