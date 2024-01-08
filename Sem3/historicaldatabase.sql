CREATE TABLE historical_lessons (
    historical_lesson_id SERIAL PRIMARY KEY,
    lesson_id INT,
    lesson_type VARCHAR(20),
    genre VARCHAR(50),
    instrument VARCHAR(50),
    lesson_price FLOAT(50),
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
    CASE
        WHEN l.type = 'Ensemble' THEN ens.genre
        ELSE NULL
    END AS genre,
    COALESCE(gl.instrument, il.instrument) AS instrument,
    COALESCE(lf.cost, 0) AS lesson_price,
    p.name AS student_name,
    e.email AS student_email
FROM
    lesson l
JOIN attendants a ON l.lesson_id = a.lesson_id
JOIN student s ON a.student_ID = s.student_ID
JOIN person p ON s.person_number = p.person_number
LEFT JOIN ensemble ens ON l.lesson_id = ens.lesson_id
LEFT JOIN group_lesson gl ON l.lesson_id = gl.lesson_id
LEFT JOIN individual_lesson il ON l.lesson_id = il.lesson_id
LEFT JOIN (
    SELECT lesson_ID, student_ID, MAX(cost) AS cost
    FROM lesson_fee
    GROUP BY lesson_ID, student_ID
) lf ON l.lesson_id = lf.lesson_ID AND s.student_ID = lf.student_ID
LEFT JOIN email e ON p.person_number = e.person_number
WHERE
    l.lesson_id = YOUR_SPECIFIED_LESSON_ID;
