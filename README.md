# Online Book Store 📚

## Overview
The **Online Book Store** is a database-driven project built using **pgAdmin (PostgreSQL)**. It manages books, customers, and orders efficiently while providing insightful queries for data retrieval and analysis.

## Features
- **Books Management**: Store and retrieve book details such as title, author, genre, price, stock, and published year.
- **Customers Management**: Maintain customer information, including name, email, phone, city, and country.
- **Order Processing**: Track orders with details like order date, quantity, and total amount.
- **Data Queries**: Perform various SQL queries for insights, including total stock, top-selling books, and revenue calculations.

## Database Schema

### Books Table
Stores information about books available in the store.
```sql
CREATE TABLE Books(
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10,2),
    Stock INT
);
```

### Customers Table
Maintains details of customers.
```sql
CREATE TABLE Customers(
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(100)
);
```

### Orders Table
Records customer orders and book purchases.
```sql
CREATE TABLE Orders(
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10,2)
);
```

## SQL Queries

### Basic Queries
- Retrieve all books in the **Fiction** genre.
- Find books published after **1950**.
- List customers from **Canada**.
- Show orders placed in **November 2023**.
- Retrieve the **total stock** of books.
- Find the **most expensive book**.

### Advanced Queries
- Retrieve the **total number of books sold** for each genre.
- Find the **average price** of books in the **Fantasy** genre.
- List customers who placed **at least 2 orders**.
- Find the **most frequently ordered book**.
- Retrieve the **top 3 most expensive** books in the **Fantasy** genre.
- Calculate the **stock remaining** after fulfilling all orders.

For the full list of queries, check the [`queries.sql`](queries.sql) file.

## Installation & Setup

1. Install **PostgreSQL** and **pgAdmin**.
2. Create a new database in **pgAdmin**.
3. Run the **schema** and **queries** in `queries.sql` to create tables and retrieve data.

## Future Enhancements 🚀
- Implement a **frontend interface** for user interaction.
- Add **stored procedures** for automated stock management.
- Integrate a **payment system** for real-time transactions.

## Contributors
👨‍💻 **Ankit Raj**

---
