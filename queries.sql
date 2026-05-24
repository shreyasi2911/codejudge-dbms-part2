-- --------------------------------
-- PART 2 -SQL QUERY IMPLEMENTATION
-- --------------------------------
-- --------------------------------------------------------------------------------------
-- 1. List all active students with student ID, name, email, batch, and admission date.
--  Purpose:-
-- Retrieve active students with key academic details
-- --------------------------------------------------------------------------------------

select student_id, full_name, email, graduation_year, admission_date
from students
where enrollment_status="active";

-- Sample output-
-- student_id |   full_name  |              email            | graduation_year | admission_date
--  S0001	  | Vivaan Gupta | vivaan.gupta001@codejudge.edu |	    2025       |	2025-02-13
--  S0002	  |  Harsh Das	 | harsh.das002@codejudge.edu	 |      2026	   |    2025-04-08

-- Validation note-
-- Only students marked as "active" are returned.

-- --------------------------------------------------------------
-- 2. Find students whose email is missing or appears invalid
-- Purpose:
-- Detect poor-quality email records.
-- --------------------------------------------------------------

select student_id, full_name, email
from students
where email is NULL
or email not like '%@%.%';

-- Sample output-
--    student_id   | full_name   |  email  
--      S0005	   | Ayaan Gupta |  NULL	
--      S0018      | Anika Patel | ravi.no-at-symbol.codejudge.edu

-- Validation Note:
-- Emails missing '@' or domain structure are flagged.

-- ------------------------------------------------------------
-- 3. List all problems with difficulty level Easy or Medium.
-- Purpose-
-- Retrieve problems with Easy or Medium difficulty level.
-- ------------------------------------------------------------

select problem_id, title, difficulty
from problems
where difficulty in('Easy','Medium');

-- Sample output-
-- problem_id |           title             | difficulty
--   P0001    |	     Shortest Path 1        |   Medium
--   P0002	  |Dynamic Programming Basics 2	|   Easy

-- Validation Note-
-- Only Easy and Medium difficulties appear.

-- --------------------------------------------------------------------
-- 4. Display the latest 20 submissions based on submission timestamp.
-- Purpose:
-- Display the most recent submissions.
-- --------------------------------------------------------------------

select *
from submissions
order by submitted_at desc
limit 20;

-- Sample output-
--  submission_id | student_id | problem_id | contest_id | language | submitted_at       | status    | score | runtime_ms
--   SUB000123	  |  S0002	   | P0067      |	CT003	 |     C    |2025-08-04 15:30:00 |	Accepted | 50	 | 1855
--   SUB000500	  |  S0283	   | P0028	    |	         |Python	| 2025-07-23 11:17:00|	Accepted | 75	 | 4509

-- Validation note-
-- Results are sorted newest to oldest.

-- ---------------------------------------------------------
-- 5. Find submissions where the status is not successful.
-- Purpose-
-- Find submissions that were unsuccessful.
-- ---------------------------------------------------------

select submission_id, student_id, problem_id, status 
from submissions
where status not like 'Accepted';

-- Sample output-
-- submission_id | student_id | problem_id | status
--   SUB000001	 |  S0282     |  P0043     | Wrong Answer
--   SUB000002	 |  S0289	  |  P0028     | Wrong Answer

-- Validation note-
-- Accepted submissions are excluded.

-- -----------------------------------------------------------------------------------------------------------
-- 6. Display each submission with student name, problem title, language, status, score, and submitted time.
-- Purpose-
-- Combine submission, student, and problem data.
-- -----------------------------------------------------------------------------------------------------------

select s.submission_id, st.full_name, p.title, s.language, s.status, s.score, s.submitted_at
from submissions s
join students st
on s.student_id= st.student_id
join problems p
on s.problem_id= p.problem_id;

-- Sample output-
-- submission_id |  full_name   |         title        | langauge  |     status       | score | submitted_at
--   SUB001989   | Vivaan Gupta | Database Indexing 20 | JavaScript|   Wrong Answer	  |  32	  | 2025-03-23 04:02:00
--   SUB001832   | Vivaan Gupta	| Graph Traversal 6	   | JavaScript| Compilation Error|	  0	  | 2025-04-22 05:36:00

-- Validation note-
-- Every submission correctly maps to one student and one problem.

-- -----------------------------------------------------------------------------------------------------
-- 7. Display all students and their enrollments, including students who are not enrolled in any course.
-- Purpose- 
-- Show all students even if not enrolled.
-- -----------------------------------------------------------------------------------------------------

select st.student_id, st.full_name, e.course_id, e.enrolled_on
from students st 
left join enrollments e
on st.student_id = e.student_id;

-- Sample output-
-- student_id | full_name    | course_id | enrolled_on 
--   S0001    |	Vivaan Gupta |	 C006	 | 2025-02-18
--   S0001	  | Vivaan Gupta |	 C001	 | 2025-03-04

-- Validation note- 
-- Students without enrollments still appear because LEFT JOIN is used.

-- ---------------------------------------------------------
-- 8. Display all courses with the number of enrolled students.
-- Purpose:
-- Count enrollments per course.
-- ---------------------------------------------------------

select c.course_id, c.course_title, count(e.student_id) as total_students
from courses c 
left join enrollments e
on c.course_id= e.course_id 
group by c.course_id, course_title;

-- Sample output-
-- course_id |     course_title         | total_students
--   C001	 | Programming Fundamentals |	83
--   C002	 |    Data Structures       |  101

-- Validation note-
-- Courses with zero enrollments still appear.

-- ---------------------------------------------------------------------------------------------
-- 9. Display test-case results for each submission, including problem title and student name.
-- Purpose- 
-- Display detailed test-case execution results.
-- ---------------------------------------------------------------------------------------------

select t.result_id, st.full_name, p.title, t.result_status, t.runtime_ms
from test_results t
join submissions s 
on t.submission_id= s.submission_id
join students st 
on s.student_id= st.student_id 
join problems p
on s.problem_id= p.problem_id;	

-- Sample output- 
-- result_id | full_name  |             title             | result_status | runtime_ms 
--  R0000001 | Isha Gupta |	Dynamic Programming Basics 43 | Runtime Error | 586
--  R0000002 | Isha Gupta |	Dynamic Programming Basics 43 |  Failed	      | 3549

-- Validation note- 
-- Every test-case result corresponds to a valid submission.

-- ----------------------------------------------------------------------------------------------------
-- 10. Find students who are enrolled in a course but have not submitted any solution for that course.
-- Purpose- 
-- Identify inactive enrolled students.
-- ----------------------------------------------------------------------------------------------------

select distinct st.student_id, st.full_name
from students st
join enrollments e
on st.student_id= e.student_id
left join submissions s
on st.student_id= s.student_id 
where s.submission_id is NULL;

-- Sample output-
-- student_id | full_name 
--            |

-- Validation Note:
-- Students exist in enrollments but not in submissions.

-- ----------------------------------------------------------------------------------------
-- 11. Count submissions by status.
-- Purpose- 
-- Measure submission distribution 
-- ----------------------------------------------------------------------------------------

select status, count(*) as total_submissions
from submissions
group by status;

-- Sample output- 
--    status    | total_submissions
-- Wrong Answer |	729
-- Accepted	    |   1127

-- Validation note- 
-- Counts reflect grouped submission outcomes.

-- -----------------------------------------------------------------------------------
-- 12. Calculate average score per problem.
-- Purpose- 
-- Analyze scoring trends.
-- -----------------------------------------------------------------------------------

select p.problem_id, p.title, avg(s.score) as average_score 
from problems p 
join submissions s
on p.problem_id= s.problem_id 
group by p.problem_id, p.title;

-- Sample output-
-- problem_id |         title        | average_score 
--   P0028	  | Valid Parentheses 28 | 44.3684
--   P0005	  | Queue using Stacks 5 | 32.4688

-- Validation note- 
-- Average is calculated from all submissions for each problem.

-- --------------------------------------------------------------------------
-- 13. Find students with more than a chosen number of submissions.
-- Purpose- 
-- Find students having more than 10 submissions.
-- --------------------------------------------------------------------------

select student_id, count(*) as total_submissions
from submissions 
group by student_id 
having total_submissions >10;

-- Sample output- 
-- student_id | total_submissions 
--   S0154    |	 14
--   S0173	  |  11

-- Validation note- 
-- HAVING filters grouped counts after aggregation.

-- ---------------------------------------------------------------
-- 14. Find problems where the success rate is below 40%.
--  Purpose:
-- Identify difficult problems.
-- ---------------------------------------------------------------

select p.problem_id, p.title,
round( 100.0* sum(case when s.status='Accepted' then 1 else 0 end )/count(*),2) as success_rate
from problems p 
join submissions s 
on p.problem_id =s.problem_id 
group by p.problem_id, p.title 
having( 100.0* sum(case when s.status ='Accepted' then 1 else 0 end)/ count(*))<40;

-- Sample output-
-- problem_id |        title        | success_rate
--   P0028	  |Valid Parentheses 28	|  31.58
--   P0005	  |Queue using Stacks 5 |  34.38

-- Validation note- 
-- Only problems with less than 40% success rate are shown.

-- ------------------------------------------------------------------------
-- 15. Find the top 10 most attempted problems
-- Purpose- 
-- Find the most popular problems.
-- ------------------------------------------------------------------------

select p.problem_id, p.title, count(s.submission_id) as attempts 
from problems p 
join submissions s 
on p.problem_id = s.problem_id 
group by p.problem_id, p.title
order by attempts desc 
limit 10;  

-- Sample output-
-- problem_id |        title       | attempts 
--   P0040    |	Graph Traversal 40 |	55
--   P0001	  |Shortest Path 1	   |    53

-- Validation note- 
-- Results are sorted by highest attempt count.

-- -----------------------------------------------------------------------------------
-- 16. Find students whose average score is greater than the overall average score.
-- Purpose-
-- Compare student averages against platform average.
-- -----------------------------------------------------------------------------------

select student_id, avg(score) as avg_score
from submissions 
group by student_id 
having avg(score) >
( select avg(score)
  from submissions
  );
  
-- Sample output-
-- student_id | avg_score
--   S0282	  |51.7500
--   S0110	  |44.5714

-- Validation note- 
-- Student averages exceed the global average score.

-- ------------------------------------------------------
-- 17. Problems never attempted
-- Purpose:
-- Detect unused problems.
-- ------------------------------------------------------

select problem_id, title 
from problems 
where problem_id not in 
( select distinct problem_id 
from submissions
); 

-- Sample output- 
-- problem_id | title 
--   P0036	  |Trie Search 36

-- Validation note- 
-- These problems have no matching submission records.

-- -----------------------------------------------------------------
-- 18. Find students who have enrolled but never submitted any solution.
-- Purpose- 
-- Identify inactive students.
-- -----------------------------------------------------------------

select distinct st.student_id, st.full_name 
from students st
join enrollments e 
on st.student_id = e.student_id 
where st.student_id not in 
( select distinct student_id 
from submissions 
);

-- Sample putput-
-- student_id | full_ name 

-- Validation note- 
-- Students are enrolled but absent from submissions table.

-- ------------------------------------------------------------------
-- 19. Find students who submitted solutions in both Python and Java.
-- Purpose:
-- Find multi-language users.
-- ------------------------------------------------------------------

select distinct s1.student_id
from submissions s1
join submissions s2
on s1.student_id= s2.student_id
where s1.language='Python'
and s2.language='Java' ;

-- Sample output- 
-- student_id 
-- S0236
-- S0229

-- Validation note- 
-- Students must have submissions in both languages.

-- -----------------------------------------------------------
-- 20. Find the second-highest score for a selected problem.
-- Purpose- 
-- Retrieve the second-best score.
-- -----------------------------------------------------------

select max(score) as second_highest_score
from submissions 
where problem_id = 5
and score < (
select max(score)
from submissions 
where problem_id = 5
);

-- Sample output- 
-- second_highest_score
-- NULL

-- Validation Note:
-- Highest score is excluded before selecting MAX again.