--  GROUP BY QUERIES
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

-- JOIN QUERIES
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
-- @BLOCK
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
-- select all students enrolled in 'Corso di Laurea in Economia' degree
SELECT students.id, students.name, students.surname, students.registration_number, students.email
FROM students
JOIN degrees
ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';

-- @BLOCK
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
-- select all degrees of 'Dipartimento di Neuroscienze' department
SELECT degrees.name
FROM degrees
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Neuroscienze';

-- @BLOCK
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
-- select all courses in which Fulvio Amato (id=44) teaches
SELECT courses.name
FROM courses
JOIN course_teacher
ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44;

-- @BLOCK
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.name, students.surname, students.registration_number, degrees.name, departments.name
FROM students
JOIN degrees
ON students.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;