--creating the database named libraray management system ---
CREATE DATABASE library_management;

--drop table if it already exists--
DROP TABLE IF EXISTS branch ;

--creating table branch --
CREATE TABLE branch
 (
     branch_id VARCHAR(10) PRIMARY KEY ,
	 manager_id VARCHAR(10),
	 branch_address VARCHAR(55),
	 contact_no VARCHAR(10)
 );

--NOW CREATING EMPLOYEES TABLE -- 
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
 (
     emp_id VARCHAR(10) PRIMARY KEY ,
	 emp_name VARCHAR(25),
	 position VARCHAR(15),
	 salary INT,
	 branch_id VARCHAR(25) --fk
 );

--NOW CREATING BOOKS TABLE --- 
DROP TABLE IF EXISTS books;
CREATE TABLE books
 (
   isbn VARCHAR(20) PRIMARY KEY,
   book_title VARCHAR(75),
   category VARCHAR(10),
   rental_price	FLOAT ,
   status VARCHAR(15),
   author  VARCHAR(35),
   publisher VARCHAR(55)
 );

--NOW CREATING MEMBERS TABLE ---
DROP TABLE IF EXISTS members;

CREATE TABLE members 
   (
   member_id	VARCHAR(10) PRIMARY KEY ,
   member_name VARCHAR(25),
   member_address VARCHAR(75),	
   reg_date DATE
   );

--NOW CREATING ISSUED  STATUS TABLE -- 

DROP TABLE IF EXISTS issued_status;

CREATE TABLE issued_status
  (
      issued_id VARCHAR(10) PRIMARY KEY,
	  issued_member_id VARCHAR(10) , --fk
	  issued_book_name	VARCHAR(75) ,
	  issued_date DATE ,
	  issued_book_isbn VARCHAR(25), --fk
	  issued_emp_id VARCHAR(10) --fk
  );

--NOW CREATING RETURN STATUS TABLE ---

DROP TABLE IF EXISTS return_status;

CREATE TABLE return_status 
   (
         return_id  VARCHAR(10) PRIMARY KEY,
		 issued_id  VARCHAR(10),
		 return_book_name VARCHAR(75),
		 return_date DATE ,
		 return_book_isbn VARCHAR(20)
   )


--foreign key ----
ALTER TABLE issued_status
ADD  CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

--ADDING AGAIN AN FOREIGN KEY ---
ALTER TABLE issued_status
ADD  CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

--ADDING AGAIN AN FOREIGN KEY ---
ALTER TABLE issued_status
ADD  CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);


--ADDING AGAIN AN FOREIGN KEY ---

ALTER TABLE employees
ADD  CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);


--ADDING AGAIN AN FOREIGN KEY ---

ALTER TABLE employees
ADD  CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);


--ADDING AGAIN AN FOREIGN KEY --

ALTER TABLE return_status 
ADD CONSTRAINT fk_issued_status 
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

--ALTERIN TABLE  DATA TYPE---
ALTER TABLE books
ALTER COLUMN  category TYPE VARCHAR(20);

--ALTERING BRANCH CONTACT NO ---
ALTER TABLE branch 
ALTER COLUMN contact_no TYPE VARCHAR(20);


--NOW APPLYING/INSERTING VALUES IN  MEMBERS TABLE  WE GET ---
INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;


-- Insert values into each employees table
INSERT INTO employees(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');

--checking if the values is imported or not ---
SELECT * FROM employees;


-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');


-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');


--applying select query on issued_Date 
SELECT * FROM issued_status;


SELECT * FROM return_status;


--seeing every table data ---
SELECT * FROM books;

SELECT * FROM branch;

SELECT * FROM employees;

SELECT * FROM issued_status;

SELECT * FROM members;

SELECT * FROM return_status;

SELECT * FROM return_status;

--TASK 1 CREATE A NEW RECORD --
--INSERTING INTO VALUES --
INSERT INTO books(isbn , book_title , category , rental_price , status , author , publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird' , 'Classic' , 6.09 , 'yes' , 'Harper Lee' , 'J.B Lippincott & Co.');



--now if it is inserted or not 
SELECT * FROM books;


SELECT * FROM members;

--PROJECT TASK 2 --- 
---TASK 2 : UPDATE AN EXISTING MEMBER 'S ADDRESS ---
UPDATE members 
SET member_address  = '125 Main St'
WHERE member_id = 'C101';

--NOW CHECKING OUR DATA IN MEMBERS IF IT'S UPDATED OR NOT 
SELECT * FROM members;


SELECT * FROM issued_status;

---TASK 3 : DELETE A RECORD FROM THE ISSUED  STATUS TABLE 
DELETE FROM issued_status 
WHERE  issued_id = 'IS121';


--NOW CHECK IF IT IS DELETED OR NOT 
SELECT * FROM issued_status
WHERE  issued_id = 'IS121';

SELECT*FROM issued_status ;

--TASK 4 : RETRIEVE ALL BOOKS ISSUED BY SPECIFIC EMPLOYEES ---
SELECT*FROM issued_status 
WHERE issued_emp_id = 'E101';


--TASK 5 : LIST MEMBERS WHO HAVE ISSUED MORE THAN ONE BOOK ---
SELECT 
  issued_emp_id,
  COUNT(issued_id) as total_book_issued
FROM issued_status 
GROUP BY issued_emp_id 
HAVING COUNT(issued_id) > 1;



--CTASS 
--TASK 6 : CREATE A SUMMARY TABLE : USED CTAS TO GENERATE NEW TABLES BASED ON QUERY RESULT - EACH BOOK AND TOTAL BOOK_ISSUED_CNT ---
CREATE TABLE book_cnts --CTAS
AS
SELECT 
  b.isbn,
  b.book_title,
  COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN 
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1,2;

--SELECTING THE NEW TABLE WE GET 
SELECT * FROM book_cnts;

--Data Analysis & Findings---

--Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books 
WHERE category = 'Classic';


---Task 8: Find Total Rental Income by Category:

SELECT 
   b.category,
   SUM(b.rental_price),
   COUNT(*)
FROM books as b
JOIN 
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1;

---9:List Members Who Registered in the Last 180 Days:

SELECT * FROM members 
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days'

INSERT INTO members(member_id, member_name , member_address , reg_date)
VALUES 
('C118' , 'Sam' , '145 Main St' , '2024-06-01'),
('C119' , 'John' , '133 Main St' , '2024-05-01');


--10:List Employees with Their Branch Manager's Name and their branch details:

SELECT 
   e1.*,
   b.manager_id,
   e2.emp_name as manager
FROM employees as e1 
JOIN 
branch  as b 
ON b.branch_id = e1.branch_id 
JOIN
employees as e2 
ON b.manager_id = e2.emp_id ; --this will tell the employyess who is also a manager 

---Task 11. Create a Table of Books with Rental Price Above a Certain Threshold 7 usd :

--CREATING CTAS

CREATE TABLE books_price_greater_than_seven 
AS
SELECT * FROM books
WHERE rental_price >= 7;

SELECT * FROM 
books_price_greater_than_seven ;


--Task 12: Retrieve the List of Books Not Yet Returned

SELECT 
   DISTINCT ist.issued_book_name
FROM issued_status AS ist
LEFT JOIN 
return_status  AS rs 
ON  ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL;


