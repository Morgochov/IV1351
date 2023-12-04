SELECT
    e.lesson_ID,
    e.genre,
    TO_CHAR(l.time, 'Day') AS weekday,
    CASE
        WHEN COUNT(a.lesson_ID) >= CAST(e.spots AS INTEGER) THEN 'No Seats'
        WHEN COUNT(a.lesson_ID) >= CAST(e.spots AS INTEGER) - 2 THEN '1-2 Seats Left'
        ELSE 'Many Seats'
    END AS booking_status
FROM
    ensemble e
JOIN
    lesson l ON e.lesson_ID = l.lesson_ID
LEFT JOIN
    attendants a ON e.lesson_ID = a.lesson_ID
WHERE
    l.time >= CURRENT_DATE
    AND l.time < CURRENT_DATE + INTERVAL '1 week'
GROUP BY
    e.lesson_ID, e.genre, l.time
ORDER BY
    e.genre, l.time;
