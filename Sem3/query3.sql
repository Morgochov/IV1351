SELECT i.instructor_ID, p.name, COUNT(*) AS lesson_count
FROM instructor i
JOIN lesson l ON i.instructor_ID = l.instructor_ID
JOIN person p ON i.person_number = p.person_number
WHERE EXTRACT(MONTH FROM l.time) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY i.instructor_ID, p.name
HAVING COUNT(*) > 1; -- Replace 1 with your specific number of lessons
