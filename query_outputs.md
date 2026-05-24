# Query Outputs and Validation

## 1. Active Students
Purpose: Retrieve active student records.

Result Summary:
Returned 232 active students from batches 2025–2027.

Validation:
All returned rows had status = 'Active'.

---

## 2. Invalid Emails
Purpose: Detect bad email entries.

Result Summary:
Found 2 students with NULL or malformed emails.

Validation:
Emails missing '@' or domain suffix were correctly identified.

---

## 3. Easy and Medium Problems
Purpose: Filter problems by difficulty.

Result Summary:
Returned 60 problems.

Validation:
No Hard difficulty problems appeared.

---

## 4. Latest 20 Submissions
Purpose: Show recent activity.

Result Summary:
Displayed the newest 20 submissions sorted by timestamp.

Validation:
Timestamps appeared in descending order.

---

## 5. Failed Submissions
Purpose: Identify unsuccessful attempts.

Result Summary:
Returned 1000 submissions with statuses like Wrong Answer and Runtime Error.

Validation:
Accepted submissions were excluded.

---

## 6. Submission Details Join
Purpose: Combine student, problem, and submission information.

Result Summary:
Returned 1000 detailed submission records with readable names.

Validation:
Submission IDs correctly matched student and problem data.

---

## 7. Students and Enrollments
Purpose: Show all students including unenrolled ones.

Result Summary:
718 students appeared with NULL course IDs.

Validation:
LEFT JOIN preserved students without enrollments.

---

## 8. Course Enrollment Counts
Purpose: Count enrolled students per course.

Result Summary:
Data Structures had the highest enrollment count.

Validation:
Courses with no enrollments still appeared.

---

## 9. Test Case Results
Purpose: Display execution-level results.

Result Summary:
Each test-case result included student and problem details.

Validation:
All results mapped correctly through submission IDs.

---

## 10. Enrolled but No Submission
Purpose: Find inactive enrolled students.

Result Summary:
Returned 0 students.

Validation:
Each student existed in enrollments but not submissions.

---

## 11. Submission Count by Status
Purpose: Analyze submission outcomes.

Result Summary:
Accepted submissions were the largest category.

Validation:
Counts matched total submission records.

---

## 12. Average Score Per Problem
Purpose: Compare problem performance.

Result Summary:
Easy problems generally had higher averages.

Validation:
Average values were within score limits (0–100).

---

## 13. Students with Many Submissions
Purpose: Identify highly active users.

Result Summary:
51 students had more than 10 submissions.

Validation:
HAVING clause correctly filtered grouped counts.

---

## 14. Low Success Rate Problems
Purpose: Detect difficult problems.

Result Summary:
13 problems had success rates below 40%.

Validation:
Acceptance ratio calculations matched dataset totals.

---

## 15. Top 10 Most Attempted Problems
Purpose: Identify frequently attempted problems.

Result Summary:
Graph Traversal 40 problem ranked highest.

Validation:
Results were sorted by descending attempt count.

---

## 16. Students Above Average
Purpose: Compare student averages to global average.

Result Summary:
152 students exceeded the platform-wide average score.

Validation:
Each listed average was greater than the overall average.

---

## 17. Problems Never Attempted
Purpose: Detect unused problems.

Result Summary:
1 problem had zero submissions.

Validation:
Problem IDs were absent from submissions table.

---

## 18. Enrolled but Never Submitted
Purpose: Find inactive users.

Result Summary:
0 students returned who are enrolled in courses but inactive.

Validation:
Students existed in enrollments only.

---

## 19. Python and Java Users
Purpose: Identify multi-language participants.

Result Summary:
181 students used both Python and Java.

Validation:
Each student had at least one submission in each language.

---

## 20. Second Highest Score
Purpose: Find second-best performance.

Result Summary:
NULL returned for problem ID 5.

Validation:
Highest score was excluded before comparison.
