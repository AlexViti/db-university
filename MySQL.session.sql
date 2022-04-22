-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
-- 3. Calcolare la media dei voti di ogni appello d'esame
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
-- @block
-- 1. Contare quanti iscritti ci sono stati ogni anno
-- Count how many students have been enrolled in each year
SELECT YEAR(enrolment_date) , COUNT(*)
FROM students
GROUP BY YEAR(enrolment_date);


