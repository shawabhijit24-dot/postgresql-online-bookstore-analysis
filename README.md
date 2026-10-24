# PostgreSQL Online Bookstore Data Analysis

## Project Overview
This project uses PostgreSQL to analyze an online bookstore database containing books, customers, and orders. SQL queries explore sales performance, revenue, customer purchasing behavior, and inventory.

## Tools & Technologies
- PostgreSQL
- SQL
- CSV
- pgAdmin

## Database Tables
- **Books:** Book details, genre, author, price, publication year, and stock.
- **Customers:** Customer names and contact/location details.
- **Orders:** Order dates, books purchased, quantities, and total amounts.

## Analysis Performed
- Retrieve books in the Fiction genre.
- Find books published after 1950.
- List customers from Canada.
- Show orders placed in November 2023.
- Calculate the total stock of available books.
- Identify the most expensive book.
- Find customers who ordered more than one copy of a book.
- Retrieve orders with a total amount exceeding $20.
- List all available book genres.
- Identify the book with the lowest stock.
- Calculate total revenue generated from orders.
- Calculate the total number of books sold for each genre.
- Find the average price of books in the Fantasy genre.
- Identify customers who have placed at least two orders.
- Find the most frequently ordered book.
- Retrieve the three most expensive books in the Fantasy genre.
- Calculate the total quantity of books sold by each author.
- Identify cities where customers who spent over $30 are located.
- Find the customer who spent the most on orders.
- Calculate the remaining stock after fulfilling orders.

## Project Structure
```text
postgresql-online-bookstore-analysis/
├── README.md
├── .gitignore
├── bookstore_analysis.sql
├── Books.csv
├── Customers.csv
└── Orders.csv
```

## How to Run
1. Install PostgreSQL and open pgAdmin.
2. Create a database named `onlinebookstore`.
3. Open `bookstore_analysis.sql` in the query editor.
4. Update the CSV file paths in the SQL script to match your computer.
5. Import the CSV data and execute the analysis queries.

## Learning Outcomes
- Database and table creation
- Primary and foreign keys
- Filtering, sorting, and aggregation
- JOIN operations
- GROUP BY and HAVING
- Revenue, customer, and inventory analysis

## Author
Abhijit Kumar Shaw

BTech – Computer Science and Technology

