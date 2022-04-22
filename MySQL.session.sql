--  GROUP BY QUERY
--
-- @block
-- 1. Contare quanti iscritti ci sono stati ogni anno
-- Count how many students have been enrolled in each year
SELECT YEAR(enrolment_date) , COUNT(*)
FROM students
GROUP BY YEAR(enrolment_date);

-- @block
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
-- Count the number of teachers that have the office in the same building
SELECT office_address, COUNT(*)
FROM teachers
GROUP BY office_address;

-- @block
-- 3. Calcolare la media dei voti di ogni appello d'esame
-- Calculate the average of each exam session
SELECT exam_id, AVG(vote)
FROM exam_student
GROUP BY exam_id;

-- @BLOCK
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
-- Count the number of degrees per department
SELECT department_id, COUNT(*)
FROM degrees
GROUP BY department_id;
