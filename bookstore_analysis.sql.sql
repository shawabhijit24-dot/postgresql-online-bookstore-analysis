create database onlinebookstore;

drop table if exists books;
create table books(
	book_id int primary key,
	title varchar(100),
	author varchar(50),
	genre varchar(50),
	published_year int,
	price decimal(10,2),
	stock int
);

drop table if exists customers;
create table customers(
	customer_id int primary key,
	name varchar(50),
	email varchar(100),
	phone int,
	city varchar(50),
	country varchar(100)
	
);

drop table if exists orders;
create table orders(
	order_id int primary key,
	customer_id int references customers(customer_id),
	book_id int references books(book_id),
	order_date date,
	quantity int,
	total_amount decimal(10,2)
);

select * from books;
select * from customers;
select * from orders;

copy books(book_id,title,author,genre,published_year,price,stock)
from'C:/bookstore/Books.csv'
csv header;

copy customers(customer_id,name,email,phone,city,country)
from'C:/bookstore/Customers.csv'
csv header;

copy orders(order_id,customer_id,book_id,order_date,quantity,total_amount)
from'C:/bookstore/Orders.csv'
csv header;

-- Retrieve all books in the "Fiction" genre
select * from books
where genre='Fiction';

-- Find books published after the year 1950
select * from books 
where published_year>1950;

-- List all customers from the Canada
select * from customers 
where country='Canada';

-- Show orders placed in November 2023
select * from orders
where order_date>='2023-11-01';

-- Retrieve the total stock of books available
select sum(stock) as total_stock from books; 

-- Find the details of the most expensive book
select * from books order by price desc limit 1;

-- Show all customers who ordered more than 1 quantity of a book
select * from orders where quantity>1;

-- Retrieve all orders where the total amount exceeds $20
select * from orders where total_amount>20;

--List all genres available in the Books table
select distinct genre from books;

-- Find the book with the lowest stock
select * from books order by stock asc limit 1;

-- Calculate the total revenue generated from all orders
select sum(total_amount) as total_revenue from orders;

-- Retrieve the total number of books sold for each genre
select b.genre,sum(o.quantity) as total_books_sold
from books b join orders o on b.book_id=o.book_id
group by b.genre;

--  Find the average price of books in the "Fantasy" genre
select avg(price) as average_price from books
where genre='Fantasy';

-- List customers who have placed at least 2 orders
select o.customer_id,c.name,count(o.order_id) as order_count
from orders o
join customers c  on o.customer_id=c.customer_id
group by o.customer_id,c.name having count(order_id)>=2;

--  Find the most frequently ordered book
select o.book_id,b.title,count(o.order_id) as order_count
from orders o 
join books b on o.book_id=b.book_id
group by o.book_id,b.title order by order_count desc limit 1;

--  Show the top 3 most expensive books of 'Fantasy' Genre
select * from books where genre='Fantasy' order by price desc limit 3;

-- Retrieve the total quantity of books sold by each author
select b.author,sum(o.quantity) as total_quantity 
from books b join orders o on b.book_id=o.book_id
group by b.author;

-- List the cities where customers who spent over $30 are located
select distinct c.city,o.total_amount from orders o join customers c on c.customer_id=o.customer_id
where o.total_amount>30;

-- Find the customer who spent the most on orders
select c.customer_id,c.name,sum(o.total_amount) as spent_amount from orders o join customers c
on o.customer_id=c.customer_id group by c.customer_id,c.name order by spent_amount desc limit 1;

-- Calculate the stock remaining after fulfilling all orders
select b.book_id,b.title,b.stock, coalesce(sum(quantity),0) as order_quantity, b.stock-coalesce(sum(o.quantity),0) as remaining_quantity
from books b left join orders o on b.book_id=o.book_id group by b.book_id order by b.book_id;
