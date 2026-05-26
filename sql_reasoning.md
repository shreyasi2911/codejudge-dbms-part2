# SQL Reasoning and Explanation

## 1. Explain one query where using LEFT JOIN is more appropriate than INNER JOIN.

Query Used:
Students and enrollments query.

Reason:
A LEFT JOIN was necessary because we wanted to display all students, including those who are not enrolled in any course.

If INNER JOIN had been used, students without enrollment records would disappear from the output.

Example:
No student appeared with NULL enrollment values.

---

## 2. Explain one query where HAVING is required instead of WHERE.

Query Used:
Students with more than 10 submissions.

Reason:
WHERE filters rows before grouping, while HAVING filters grouped results after aggregation.

The condition COUNT(*) > 10 can only be evaluated after GROUP BY executes.

Incorrect:
WHERE COUNT(*) > 10

Correct:
HAVING COUNT(*) > 10

---

## 3. Explain one query where a subquery helped solve the problem.

Query Used:
Students whose average score is greater than the overall average.

Reason:
The subquery calculates the global average score first.

Then the outer query compares each student's average against that single value.

Without the subquery, the comparison would require more complex logic.

---

## 4. Explain one situation where your query output could be misleading if duplicate records exist.

Situation:
Counting enrollments per course.

Potential Problem:
If duplicate enrollment rows exist for the same student and course, the total student count becomes inflated.

Example:
A student accidentally enrolled twice in DBMS.

Fix:
Use COUNT(DISTINCT student_id) if duplicates are possible.

---

## 5. Explain one edge case you considered while writing any query.

Query Used:
Problems with success rate below 40%.

Edge Case:
Problems with zero submissions could cause division-by-zero errors.

Handling:
The query only joins problems that already have submissions, ensuring COUNT(*) is never zero.

Alternative Solution:
Use CASE statements or NULLIF() to safely handle zero attempts.
