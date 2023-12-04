SELECT
    EXTRACT(MONTH FROM l.time) AS month,
    COUNT(*) AS lesson_count,
    SUM(CASE WHEN e.lesson_id IS NOT NULL THEN 1 ELSE 0 END) AS ensemble_count,
    SUM(CASE WHEN g.lesson_id IS NOT NULL THEN 1 ELSE 0 END) AS group_count,
    SUM(CASE WHEN i.lesson_id IS NOT NULL THEN 1 ELSE 0 END) AS individual_count
FROM
    lesson l
LEFT JOIN
    ensemble e ON l.lesson_id = e.lesson_id
LEFT JOIN
    group_lesson g ON l.lesson_id = g.lesson_id
LEFT JOIN
    individual_lesson i ON l.lesson_id = i.lesson_id
WHERE
    EXTRACT(YEAR FROM l.time) = 2023
GROUP BY
    month;