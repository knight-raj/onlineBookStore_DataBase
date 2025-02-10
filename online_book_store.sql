CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(100)
);

CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID	INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);

-- Here we upload CSV file manually using dashboard(import file)

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


--1) Retrive all books in the "Fiction" genre
SELECT * FROM Books
WHERE Genre = 'Fiction';

--2) Find the books published after the year 1950:
SELECT * FROM Books
WHERE Published_year > 1950;

--3) List all the customer from the Canada
SELECT * FROM Customers
WHERE City = 'South Craigfort';

--4) show orders placed in November 2023
SELECT * FROM Orders
WHERE Order_Date  
BETWEEN '2023-11-01' AND '2023-11-30';


--5) Retrive the total stock of books available:
SELECT SUM(stock) 
as Total_Stock 
FROM Books;

--6) Find the details of the most expensive book
SELECT * FROM Books 
ORDER BY Price 
DESC LIMIT 1;

--7) Show all customers who ordered more than 1 quantity of book:
SELECT * FROM Orders
WHERE quantity > 1;

 --8) Retrive all orders where the total amount exceeds $20
SELECT * FROM Orders
WHERE total_amount > 20;

--9) List all generes available in the Books table
SELECT DISTINCT genre FROM Books;

-- 10) Find the book with the lowest stock:
SELECT * FROM Books
ORDER BY stock
LIMIT 1;

--11) Calculate the total revenue generated from all orders
SELECT SUM(total_amount) as Revenue FROM Orders;


--Advance Query

--1) Retrive the total number of books sold for each genre:
SELECT b.Genre, SUM(o.Quantity) as Total_Books_Sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

--2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) As Average_Price
FROM Books
WHERE Genre = 'Fantasy';

--3) List customers who have placed at least 2 orders
SELECT customer_id, COUNT(Order_id) AS Order_Count
FROM orders
GROUP BY customer_id
HAVING COUNT(Order_id) >= 2;

--with name
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS Order_Count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >= 2;


--4) Find the most frequently ordered book:
SELECT Book_id, COUNT(order_id) AS ORDER_COUNT
FROM orders 
GROUP BY BooK_id
ORDER BY ORDER_COUNT DESC
LIMIT 1;

--with  name
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY o.BooK_id, b.title
ORDER BY ORDER_COUNT DESC
LIMIT 1;


--5) show the top 3 most expensive books of 'fantasy' Genre
SELECT * FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

--6) Retrieve the total quamtity of books sold b each author
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.author;

--7) List the cities where customers who spent over $30 are located
SELECT DISTINCT c.city, total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 200;

--8) Find the customer who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_Spent DESC LIMIT 1;

--9)Calculate the stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE (SUM(o.quantity),0) AS Order_quantity,
	b.stock - COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id;










