WITH cte AS (
	SELECT s1.Roll_number, s1.student_name, s1.class, s1.section, s1.school_name,
    SUM(CASE WHEN pc.subject = 'Math' AND sr.option_marked = ca.correct_option AND sr.option_marked <> 'e' THEN 1 ELSE 0 END) AS math_correct,
	SUM(CASE WHEN pc.subject = 'Math' AND sr.option_marked <> ca.correct_option AND sr.option_marked <> 'e' THEN 1 ELSE 0 END) AS math_wrong,
    SUM(CASE WHEN pc.subject = 'Math' AND sr.option_marked = 'e' THEN 1 ELSE 0 END) AS math_yet_to_learn,
    SUM(CASE WHEN pc.subject = 'Math' THEN 1 ELSE 0 END) AS math_total,
	SUM(CASE WHEN pc.subject = 'Science' AND sr.option_marked = ca.correct_option AND sr.option_marked <> 'e' THEN 1 ELSE 0 END) AS Science_correct,
	SUM(CASE WHEN pc.subject = 'Science' AND sr.option_marked <> ca.correct_option AND sr.option_marked <> 'e' THEN 1 ELSE 0 END) AS Science_wrong,
    SUM(CASE WHEN pc.subject = 'Science' AND sr.option_marked = 'e' THEN 1 ELSE 0 END) AS Science_yet_to_learn,
    SUM(CASE WHEN pc.subject = 'Science' THEN 1 ELSE 0 END) AS Science_total
    
    FROM olympiad.student_list s1
    JOIN olympiad.student_response sr
    ON s1.roll_number = sr.roll_number
    JOIN olympiad.correct_answer ca
	ON sr.question_number = ca.question_number
    AND sr.question_paper_code = ca.question_paper_code
    JOIN olympiad.question_paper_code pc
    ON pc.paper_code = ca.question_paper_code
    GROUP BY s1.Roll_number, s1.student_name, s1.class, s1.section, s1.school_name)
    
SELECT roll_number, student_name, class, section, school_name, math_correct, math_yet_to_learn, math_correct AS math_score,
ROUND((CAST(math_correct AS decimal)/CAST(math_total AS Decimal))*100,2) AS math_percentage, science_correct, science_wrong, Science_yet_to_learn, science_correct AS science_score,
ROUND((CAST(science_correct AS decimal)/CAST(science_total AS decimal))*100,2) AS science_percentage
FROM cte;