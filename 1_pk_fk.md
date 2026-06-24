```sql
-- Drop database (if it exists)
DROP DATABASE IF EXISTS tutorial;

-- Create database
CREATE DATABASE tutorial;

-- Use database
USE tutorial;

-- Authors table
CREATE TABLE authors (
  id INT PRIMARY KEY,
  name VARCHAR(20),
  age INT
);

-- Books table (foreign key to authors)
CREATE TABLE books (
  id INT PRIMARY KEY,
  title VARCHAR(20),
  price INT,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Insert authors
INSERT INTO authors (id, name, age) VALUES
(1, 'ramesh', 23),
(2, 'mahesh', 32),
(3, 'dinesh', 24);

-- View authors
SELECT * FROM authors;

-- Insert books
INSERT INTO books (id, title, price, author_id) VALUES
(1, 'Nature in Future', 1000, 1),
(2, 'Water Life',       500,  1),
(3, 'Jungle Destiny',   1200, 2),
(4, 'Life Science',     800,  1);

-- Find author name who wrote "Water Life"
SELECT name
FROM authors
WHERE id = (
  SELECT author_id
  FROM books
  WHERE title = 'Water Life'
);

-- Insert a new book (NOTE: will fail unless authors.id=5 exists)
INSERT INTO books (id, title, price, author_id) VALUES
(5, 'Electronify', 100, 5);

-- Find author name who wrote "Electronify"
SELECT name
FROM authors
WHERE id = (
  SELECT author_id
  FROM books
  WHERE title = 'Electronify'
);
```