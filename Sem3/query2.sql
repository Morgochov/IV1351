SELECT sibling_count, COUNT(student_ID) AS student_count
FROM (
    SELECT s1.student_ID, COALESCE(COUNT(s2.siblingID), 0) AS sibling_count
    FROM student s1
    LEFT JOIN siblings s2 ON s1.student_ID = s2.student_ID
    GROUP BY s1.student_ID
) AS sibling_counts
GROUP BY sibling_count
ORDER BY sibling_count;