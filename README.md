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
- Filter books by genre and publication year.
- Analyze customers by country.
- Calculate total inventory and revenue.
- Identify the most expensive book and lowest-stock book.
- Calculate books sold by genre and average genre price.
- Identify repeat customers and frequently ordered books.
- Analyze customer spending and remaining inventory.

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

