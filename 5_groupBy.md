# SQL Practice - Basic Queries, Aggregate Functions and GROUP BY

## Objective

In this exercise, you will learn how to retrieve, filter, sort, summarize, and group data using SQL.

By the end of this practice, you should be able to:

- Retrieve data from tables using `SELECT`
- Filter records using `WHERE`
- Sort records using `ORDER BY`
- Use aggregate functions
- Group records using `GROUP BY`
- Generate reports from multiple related tables

---

# Database Structure

The database contains three tables.

## Students

Stores student information.

| Column | Description |
|---------|-------------|
| id | Unique student ID |
| roll_number | Roll number of the student |
| student_name | Student's name |
| class | Class of the student |

---

## Subjects

Stores all available subjects.

| Column | Description |
|---------|-------------|
| id | Subject ID |
| subject_name | Name of the subject |

---

## Scores

Stores marks obtained by students in different subjects.

| Column | Description |
|---------|-------------|
| std_id | Student ID |
| sub_id | Subject ID |
| marks | Marks obtained |

This table connects Students and Subjects.

One student can have marks in multiple subjects.

---

# Understanding the Relationships

```
Students
---------
id
student_name
class

        |
        | id = std_id
        |

Scores
---------
std_id
sub_id
marks

        |
        | sub_id = id
        |

Subjects
---------
id
subject_name
```

---

# SQL Concepts Used

## SELECT

Used to retrieve data from one or more tables.

Syntax

```sql
SELECT column_name
FROM table_name;
```

---

## WHERE

Filters rows based on a condition.

Example

```sql
SELECT *
FROM Students
WHERE class = '9A';
```

---

## ORDER BY

Sorts the result.

Ascending

```sql
ORDER BY student_name ASC;
```

Descending

```sql
ORDER BY roll_number DESC;
```

---

## Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single value.

Common aggregate functions:

| Function | Purpose |
|----------|----------|
| COUNT() | Counts rows |
| SUM() | Calculates total |
| AVG() | Calculates average |
| MAX() | Finds highest value |
| MIN() | Finds lowest value |

Example

```sql
SELECT AVG(marks)
FROM Scores;
```

---

## GROUP BY

Groups rows having the same value.

It is mainly used with aggregate functions.

Example

```sql
SELECT class,
SUM(marks)
FROM Students
JOIN Scores
ON Students.id = Scores.std_id
GROUP BY class;
```

Without `GROUP BY`, SQL calculates one result for the entire table.

With `GROUP BY`, SQL calculates one result for each group.

---

# Practice Questions

## Part 1 - Basic SQL Queries

### Question 1

Display all records from the Students table.

---

### Question 2

Display only student_name and class from the Students table.

---

### Question 3

Find details of the student whose roll number is 103.

---

### Question 4

Display all students belonging to class 9A.

---

### Question 5

Show all subject names from the Subjects table.

---

### Question 6

Find students whose names start with the letter 'R'.

Hint:

Use the `LIKE` operator.

---

### Question 7

Display students whose roll number is greater than 104.

---

### Question 8

Show all students sorted by student_name in ascending order.

---

### Question 9

Display all students sorted by roll_number in descending order.

---

### Question 10

Count the total number of students in the Students table.

---

# Part 2 - Aggregate Functions

Remember:

Aggregate functions work on multiple rows and return a single result.

---

### Question 11

Find the total marks scored by all students.

---

### Question 12

Find the average marks of all students.

---

### Question 13

Find the highest marks scored in any subject.

---

### Question 14

Find the lowest marks scored in any subject.

---

### Question 15

Count the total number of score records available in the Scores table.

---

### Question 16

Find the total marks scored by student with std_id = 1.

---

### Question 17

Find the average marks obtained in the subject with sub_id = 2.

---

### Question 18

Find the highest marks obtained by student with std_id = 4.

---

### Question 19

Find the lowest marks obtained in the Computer subject (sub_id = 5).

---

### Question 20

Find the difference between the highest and lowest marks in the Scores table.

Hint:

Use

- MAX()
- MIN()

---

# Part 3 - GROUP BY Queries

Remember:

GROUP BY creates one result for every group.

Without GROUP BY

```
Total Marks
------------
1250
```

With GROUP BY

```
Class     Total Marks
----------------------
9A        510
9B        185
10A       247
10B       269
```

---

### Question 21

Display total marks scored by each student.

---

### Question 22

Display average marks scored by each student.

---

### Question 23

Display maximum marks obtained by each student.

---

### Question 24

Display minimum marks obtained by each student.

---

### Question 25

Display total marks for each subject.

---

### Question 26

Display average marks for each subject.

---

### Question 27

Count how many students have marks recorded for each subject.

---

### Question 28

Display the highest marks scored in each subject.

---

### Question 29

Display the lowest marks scored in each subject.

---

### Question 30

Show total marks class-wise using Students and Scores tables.

---

# Sample Solution

Using implicit join

```sql
SELECT
    s.class,
    SUM(sc.marks) AS total_marks
FROM Students s, Scores sc
WHERE s.id = sc.std_id
GROUP BY s.class;
```

Using INNER JOIN

```sql
SELECT
    Students.class,
    SUM(Scores.marks)
FROM Students
JOIN Scores
ON Students.id = Scores.std_id
GROUP BY Students.class;
```

---

# Key Takeaways

After completing this exercise, you should understand:

- Retrieving data using SELECT
- Filtering using WHERE
- Sorting using ORDER BY
- Using COUNT(), SUM(), AVG(), MAX(), and MIN()
- Grouping records using GROUP BY
- Generating summary reports
- Combining multiple tables using JOIN