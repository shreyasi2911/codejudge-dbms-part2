# codejudge-dbms-part2
# SQL Query Implementation & Verification — Part 2

## Overview

This repository contains the SQL query implementation and verification for **Part 2** of the Database Management System assignment.

The objective of this part is to:

- Write SQL queries on top of the designed relational database
- Perform retrieval, filtering, joins, aggregation, and subquery operations
- Validate query outputs using the actual dataset
- Explain SQL reasoning and design decisions

The database models an online coding/judge platform containing students, courses, enrollments, problems, submissions, and test-case results.

---

# Repository Structure

| File Name | Description |
|------------|-------------|
| `README.md` | Project overview and repository guide |
| `queries.sql` | All SQL queries with comments and explanations |
| `query_outputs.md` | Query outputs, summaries, and validation notes |
| `sql_reasoning.md` | SQL reasoning and explanation answers |

---

# Database Features

The database includes:

- Student management
- Course enrollments
- Coding problems
- Submission tracking
- Test-case evaluation
- Score and performance analysis

---

# Topics Covered

## 1. Basic Retrieval & Filtering

Queries include:

- Active students
- Invalid email detection
- Problem filtering by difficulty
- Latest submissions
- Failed submissions

---

## 2. Joins

Queries include:

- Submission details with student and problem information
- Student enrollments
- Course-wise enrollment counts
- Test-case result analysis
- Students enrolled but inactive

---

## 3. Aggregation & HAVING

Queries include:

- Submission counts by status
- Average score per problem
- Highly active students
- Problem success rates
- Most attempted problems

---

## 4. Subqueries & Set Logic

Queries include:

- Students performing above average
- Problems never attempted
- Students who never submitted
- Multi-language users
- Second-highest score analysis

---

# SQL Concepts Used

The implementation demonstrates practical usage of:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- `LEFT JOIN`
- Aggregate Functions
- Nested Queries
- Subqueries
- Set Logic
- Conditional Expressions

---

# Output Verification

Each query includes:

- Purpose of the query
- SQL implementation
- Sample output or result summary
- Validation note explaining correctness

This ensures that results are logically verified against the dataset.

---

# Assumed Tables

The queries are based on the following tables:

- `students`
- `courses`
- `enrollments`
- `problems`
- `submissions`
- `testcase_results`

---

# How to Run

## Step 1 — Import Database

Import the SQL schema and dataset into your SQL environment.

Example platforms:

- MySQL
- PostgreSQL
- SQLite

---



## Step 2 — Execute Queries

Run:

```sql
SOURCE queries.sql;
```
---

# Validation Notes

Validation notes are included for every query to verify that:

joins are correct
filtering conditions work properly
aggregation values are logical
subqueries produce expected results
edge cases are handled carefully

---

# SQL Reasoning Highlights

The repository also explains:

Why LEFT JOIN is preferred in some cases
Why HAVING is required instead of WHERE
How subqueries simplify complex logic
How duplicate data can affect outputs
Edge cases considered during query writing

---
