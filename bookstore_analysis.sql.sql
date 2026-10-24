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

--deleting one table without touching other table which is connected with it
DROP TABLE customers CASCADE;

copy customers(customer_id,name,email,phone,city,country)
from'C:/bookstore/Customers.csv'
csv header;

copy orders(order_id,customer_id,book_id,order_date,quantity,total_amount)
from'C:/bookstore/Orders.csv'
csv header;

--BASIC QUERIES
select * from books
where genre='Fiction';

select * from books 
where published_year>1950;

select * from customers 
where country='Canada';

select * from orders
where order_date>='2023-11-01';

select sum(stock) as total_stock from books; 

select * from books order by price desc limit 1;

select * from orders where quantity>1;

select * from orders where total_amount>20;

select distinct genre from books;

select * from books order by stock asc limit 1;

select sum(total_amount) as total_revenue from orders;

--ADVANCE QUERIES

select b.genre,sum(o.quantity) as total_books_sold
from books b join orders o on b.book_id=o.book_id
group by b.genre;

select avg(price) as average_price from books
where genre='Fantasy';

select o.customer_id,c.name,count(o.order_id) as order_count
from orders o
join customers c  on o.customer_id=c.customer_id
group by o.customer_id,c.name having count(order_id)>=2;

select o.book_id,b.title,count(o.order_id) as order_count
from orders o 
join books b on o.book_id=b.book_id
group by o.book_id,b.title order by order_count desc limit 1;

select * from books where genre='Fantasy' order by price desc limit 3;

select b.author,sum(o.quantity) as total_quantiy 
from books b join orders o on b.book_id=o.order_id
group by b.author;

select distinct c.city,o.total_amount from orders o join customers c on c.customer_id=o.customer_id
where o.total_amount>30;

select c.customer_id,c.name,sum(o.total_amount) as spent_amount from orders o join customers c
on o.customer_id=c.customer_id group by c.customer_id,c.name order by spent_amount desc limit 1;

select b.book_id,b.title,b.stock, coalesce(sum(quantity),0) as order_quantity, b.stock-coalesce(sum(o.quantity),0) as remaining_quantity
from books b left join orders o on b.book_id=o.book_id group by b.book_id order by b.book_id;