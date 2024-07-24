CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT AUTO_INCREMENT PRIMARY KEY,
    Manager_Id INT NOT NULL,
    Branch_address VARCHAR(255) NOT NULL,
    Contact_no VARCHAR(20) NOT NULL
);

DESC Branch;

CREATE TABLE Employee (
    Emp_Id INT AUTO_INCREMENT PRIMARY KEY,
    Emp_name VARCHAR(100) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

DESC Employee;

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Rental_Price DECIMAL(10, 2) NOT NULL,
    Status ENUM('yes', 'no') NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Publisher VARCHAR(100) NOT NULL
);

DESC Books;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Customer_address VARCHAR(255) NOT NULL,
    Reg_date DATE NOT NULL
);
DESC Customer;

CREATE TABLE IssueStatus (
    Issue_Id INT AUTO_INCREMENT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255) NOT NULL,
    Issue_date DATE NOT NULL,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

DESC IssueStatus;

CREATE TABLE ReturnStatus (
    Return_Id INT AUTO_INCREMENT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255) NOT NULL,
    Return_date DATE NOT NULL,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

DESC ReturnStatus;


INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-3-16-148410-0', 'Introduction to SQL', 'Programming', 15.99, 'yes', 'John Smith', 'Tech Books Inc.'),
('978-1-23-456789-0', 'Data Structures and Algorithms', 'Computer Science', 19.99, 'yes', 'Jane Doe', 'Coding Press'),
('978-0-00-000000-0', 'History of the World', 'History', 12.50, 'no', 'David Johnson', 'History Books Ltd.');

select * from books;


SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';


INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Library St', '555-1234'),
(2, 102, '456 Book Ave', '555-5678'),
(3, 103, '789 Reading Blvd', '555-9012'),
(4, 104, '101 Archive Rd', '555-3456');

select * from Branch;

INSERT INTO Employee (Emp_name, Position, Salary, Branch_no)
VALUES
('Alice Johnson', 'Librarian', 40000.00, 1),
('Bob Smith', 'Assistant Librarian', 30000.00, 1),
('Charlie Brown', 'Cataloguer', 32000.00, 2),
('Diana Prince', 'Archivist', 35000.00, 2),
('Edward Nygma', 'Library Technician', 28000.00, 3),
('Fiona Shrek', 'Circulation Assistant', 29000.00, 3),
('George Washington', 'Reference Librarian', 45000.00, 4),
('Hannah Montana', 'Library Assistant', 31000.00, 4);

select * from employee;

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;


INSERT INTO Customer (Customer_name, Customer_address, Reg_date)
VALUES
('John Doe', '123 Elm Street', '2023-01-15'),
('Jane Smith', '456 Oak Avenue', '2023-02-20'),
('Michael Johnson', '789 Pine Road', '2023-03-10'),
('Emily Davis', '101 Maple Street', '2023-04-25'),
('William Brown', '202 Birch Boulevard', '2023-05-30'),
('Olivia Garcia', '303 Cedar Drive', '2023-06-15'),
('James Wilson', '404 Walnut Lane', '2023-07-20'),
('Sophia Martinez', '505 Cherry Street', '2023-08-25');


select * from Customer;


INSERT INTO IssueStatus (Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 'Introduction to SQL', '2024-01-01', '978-3-16-148410-0'),
(2, 'Data Structures and Algorithms', '2024-01-05', '978-1-23-456789-0'),
(3, 'History of the World', '2024-01-10', '978-0-00-000000-0'),
(4, 'Introduction to SQL', '2024-01-15', '978-3-16-148410-0'),
(5, 'Data Structures and Algorithms', '2024-01-20', '978-1-23-456789-0'),
(6, 'History of the World', '2024-01-25', '978-0-00-000000-0'),
(7, 'Introduction to SQL', '2024-02-01', '978-3-16-148410-0'),
(8, 'Data Structures and Algorithms', '2024-02-05', '978-1-23-456789-0');

select * from IssueStatus;


SELECT 
    B.Book_title,
    C.Customer_name
FROM 
    Books B
JOIN 
    IssueStatus I ON B.ISBN = I.Isbn_book
JOIN 
    Customer C ON I.Issued_cust = C.Customer_Id;

select * from books;


SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;


UPDATE Employee
SET Salary = 60000
WHERE Emp_name = 'Alice Johnson';

UPDATE Employee
SET Salary = Salary * 1.15;


SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

select * from customer;


UPDATE Customer
SET Reg_date = '2021-01-01'
WHERE Customer_Id = 1;

UPDATE Customer
SET Reg_date = '2021-02-01'
WHERE Customer_Id = 2;

UPDATE Customer
SET Reg_date = '2021-03-01'
WHERE Customer_Id = 3;

SELECT Customer.Customer_name
FROM Customer
LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE Customer.Reg_date < '2022-01-01'  ;
  
  
  select * from customer;
  
  select * from IssueStatus;
  
  select * from branch;

  
  
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;


UPDATE IssueStatus
SET Issue_date = '2023-06-15'
WHERE Issue_Id = 1;

UPDATE IssueStatus
SET Issue_date = '2023-06-20'
WHERE Issue_Id = 2;

SELECT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE IssueStatus.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';


SELECT book_title
FROM Books
WHERE book_title LIKE '%history%';


select * from branch;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(9, 104, '456 Elm Street, CityB', '987-654-3210'),
(5, 105, '789 Oak Street, CityC', '654-321-0987'),
(6, 106, '101 Pine Street, CityD', '321-098-7654'),
(7, 107, '202 Maple Street, CityE', '432-109-8765'),
(8, 108, '303 Birch Street, CityF', '543-210-9876');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(21, 'Johny Smithe', 'Librarian', 50000, 3),
(22, 'Janey Doew', 'Assistant Librarian', 45000, 2),
(23, 'Michaeler Johnsony', 'Cataloguer', 48000, 2),
(24, 'Emilyn Brown', 'IT Support', 52000, 2),
(25, 'David Leeyo', 'Security Officer', 40000, 3),
(26, 'Sarah Clarks', 'Custodian', 38000, 2),
(17, 'James Wilsons', 'Assistant Librarian', 46000, 2),
(18, 'Jennifer Martinezz', 'Librarian', 51000, 3),
(19, 'Roberto Taylors', 'Assistant Librarian', 47000, 3),
(20, 'Mary Garcias', 'Cataloguer', 49000, 3);


select * from employee;

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 1;


select * from branch;
select * from employee;


UPDATE Employee
SET Position = 'Manager'
WHERE Emp_Id IN (9, 10, 11);

SELECT e.Emp_name AS Employee_Name, b.Branch_address AS Branch_Address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';



USE library;



UPDATE Books
SET Rental_Price = 30  
WHERE Rental_Price < 25;



SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;






