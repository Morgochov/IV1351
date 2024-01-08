-- Create Historical Database
CREATE TABLE historical_lessons (
    historical_lesson_id SERIAL PRIMARY KEY,
    lesson_id INT,
    lesson_type VARCHAR(20),
    genre VARCHAR(50),
    instrument VARCHAR(50),
    lesson_price FLOAT(50), -- Adjusted to FLOAT based on the new database schema
    student_name VARCHAR(200),
    student_email VARCHAR(100)
);

INSERT INTO historical_lessons (
    lesson_id,
    lesson_type,
    genre,
    instrument,
    lesson_price,
    student_name,
    student_email
)
SELECT
    l.lesson_id,
    l.type AS lesson_type,
    l.proficiency AS genre,
    (
        SELECT MAX(instrument)
        FROM group_lesson
        WHERE lesson_ID = l.lesson_id
    ) AS instrument,
    (
        SELECT MAX(lf.cost)
        FROM lesson_fee lf
        WHERE lf.lesson_ID = l.lesson_id
    ) AS lesson_price,
    (
        SELECT MAX(p.name)
        FROM attendants a
        JOIN student s ON a.student_ID = s.student_ID
        JOIN person p ON s.person_number = p.person_number
        WHERE a.lesson_ID = l.lesson_id
    ) AS student_name,
    (
        SELECT MAX(e.email)
        FROM attendants a
        JOIN student s ON a.student_ID = s.student_ID
        JOIN person p ON s.person_number = p.person_number
        JOIN email e ON p.person_number = e.person_number
        WHERE a.lesson_ID = l.lesson_id
    ) AS student_email
FROM
    lesson l
WHERE
    l.lesson_id = YOUR_SPECIFIED_LESSON_ID;


