-- Active: 1710831019929@@database-03.c5iywe822rl5.ap-northeast-2.rds.amazonaws.com@3306@bigdata
CREATE TABLE Categories (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(255) NOT NULL,
  category_index INT
);
CREATE TABLE Authors (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  age INT
);
CREATE TABLE Books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  pub_year DATETIME NOT NULL,
  price INT NOT NULL,
  category_id INT,
  author_id INT,
  FOREIGN KEY (category_id) REFERENCES Categories(category_id),
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  age INT
);
CREATE TABLE Purchases (
  purchase_id INT PRIMARY KEY AUTO_INCREMENT,
  purchase_date DATETIME NOT NULL,
  quantity INT NOT NULL,
  purchase_price INT NOT NULL,
  user_id INT NOT NULL,
  book_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
SELECT name, age FROM Authors;
SELECT * FROM Books WHERE pub_year > 2020;
SELECT user_id, book_id, purchase_date FROM `Purchases` WHERE purchase_date LIKE '2024%';
SELECT name, address FROM `Users` WHERE address IN ('서울');
SELECT * FROM `Books` ORDER BY price DESC;
SELECT * FROM `Categories` WHERE category_name IN ('과학');
SELECT email, age FROM `Users` WHERE age BETWEEN 28 AND 30;
