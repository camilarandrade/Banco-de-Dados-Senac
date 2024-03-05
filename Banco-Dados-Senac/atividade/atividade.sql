-- Selecionar professores e disciplinas associadas 
SELECT Professor.Nome AS Professor, Disciplina.Nome AS Disciplina 
FROM Professor 
JOIN professores_disciplinas ON Professor.ID = professores_disciplinas.Professor_ID 
JOIN disciplina ON professores_disciplinas.Disciplina_ID = disciplina.Id;

-- Selecionar todos os alunos

 SELECT * FROM aluno;
 
-- Selecionar apenas os nomes e CPFs dos alunos
SELECT aluno.nome, aluno.cpf
FROM aluno;
 
-- Selecionar alunos matriculados após uma data específica
SELECT aluno.nome AS aluno, matricula.DataMatricula AS Matricula
FROM matricula
INNER JOIN aluno ON matricula.Aluno_ID=aluno.matricula
WHERE matricula.DataMatricula>'2024-01-29';
 
-- Contar quantas disciplinas existem com carga horária maior que X

SELECT Disciplina.Nome, Disciplina.Horas
FROM disciplina
WHERE horas > 20;

-- Contar quantas matrículas existem para cada curso

 SELECT Curso.Nome, 
 
-- Contar quantas disciplinas cada professor leciona
 
-- Combinar nome do aluno e data da matrícula
 
-- Combinar nome do curso e nome do aluno
 
-- Contar quantos alunos se matricularam em cada curso