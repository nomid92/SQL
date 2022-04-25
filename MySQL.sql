/******* Практическое задание №1 *******/
SELECT name AS Студент,
		registration_date AS 'Дата подпики'
    FROM Students
    ORDER BY registration_date ASC;
   
   
SELECT DISTINCT Courses.name AS Курс,
		Courses.price AS 'Цена курса',
		Courses.students_count AS 'Количество студентов',
        Courses.duration AS Длительность
	FROM Courses
	WHERE Courses.students_count > 4
		AND Courses.duration > 10
    ORDER BY Courses.price DESC
    LIMIT 5;
    
    
(SELECT name AS ФИО,
		age AS Возраст,
		'Учитель' AS 'Отношение к курсу'
	FROM Teachers
    ORDER BY age ASC LIMIT 3)
UNION
(SELECT name AS ФИО,
		age AS Возраст,
        'Студент'  AS 'Отношение к курсу'
	FROM Students
    ORDER BY age DESC LIMIT 3);

/******* Практическое задание №2 *******/
SELECT AVG(age) AS 'Средний возраст'
	FROM Teachers
    WHERE salary > 10000;
    

SELECT SUM(price) AS 'Сумму цен курсов'
	FROM Courses
    WHERE type = 'DESIGN';


SELECT sum(duration * 60) AS 'Длителинось курсов в минутах'
	FROM Courses
    WHERE type = 'PROGRAMMING';


/******* Практическое задание №3 *******/
SELECT Students.name AS 'Студент',
		sum(Courses.duration) AS 'Длительность всех курсов'
	FROM Courses
		JOIN Subscriptions ON Courses.id = Subscriptions.course_id
        JOIN Students On Subscriptions.student_id = Students.id
	GROUP BY Students.name
    ORDER BY Students.name;


SELECT Teachers.name AS 'Учитель',
		AVG(Students.age) AS 'Средний возраст студентов'
	FROM Teachers
		JOIN Courses ON Teachers.id = Courses.teacher_id
        JOIN Subscriptions ON Courses.id = Subscriptions.course_id
        JOIN Students ON Subscriptions.student_id = Students.id
	GROUP BY Teachers.name
    ORDER BY Teachers.name;


SELECT Courses.type AS 'Типы курсов',
		AVG(Teachers.salary) AS 'Средняя зарплата учетелей по типу курса'
	FROM Teachers
		JOIN Courses on Courses.teacher_id = Teachers.id
	GROUP BY Courses.type
    ORDER BY Courses.type;