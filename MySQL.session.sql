--  GROUP BY QUERIES

-- @block
-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(enrolment_date) , COUNT(*)
FROM students
GROUP BY YEAR(enrolment_date);

-- @block
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT office_address, COUNT(*)
FROM teachers
GROUP BY office_address;

-- @block
-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT exam_id, AVG(vote)
FROM exam_student
GROUP BY exam_id;

-- @BLOCK
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT department_id, COUNT(*)
FROM degrees
GROUP BY department_id;

-- JOIN QUERIES

-- @BLOCK
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT students.id, students.name, students.surname, students.registration_number, students.email
FROM students
JOIN degrees
ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';

-- @BLOCK
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT degrees.name
FROM degrees
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Neuroscienze';

-- @BLOCK
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

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

-- @BLOCK
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT degrees.name AS degree, courses.name AS course, CONCAT(teachers.name, ' ', teachers.surname) AS teacher
FROM degrees
JOIN courses
ON degrees.id = courses.degree_id
JOIN course_teacher
ON courses.id = course_teacher.course_id
JOIN teachers
ON course_teacher.teacher_id = teachers.id
ORDER BY degrees.name, courses.name;

-- @BLOCK
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica

SELECT DISTINCT(teachers.id), teachers.name, teachers.surname
FROM teachers
JOIN course_teacher
ON teachers.id = course_teacher.teacher_id
JOIN courses
ON course_teacher.course_id = courses.id
JOIN degrees
ON courses.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Matematica'

-- @BLOCK
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT students.id, students.name, students.surname, COUNT(*)
FROM students
JOIN exam_student
ON students.id = exam_student.student_id;