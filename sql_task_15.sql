use jyothika_db;
create table journal_entries(
entry_id int primary key,
entry_date date,
account_name varchar(50),
description varchar(90),
debit decimal(10,2),
credit decimal(10,2)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(160) NOT NULL,
  email VARCHAR(254) UNIQUE,
  balance decimal(10,2)
);

CREATE TABLE accounts (
  account_id INT  PRIMARY KEY,
  account_code VARCHAR(20) NOT NULL UNIQUE,
  account_name VARCHAR(120) NOT NULL,
  account_type varchar (90)
);

CREATE TABLE invoices (
  invoice_id BIGINT PRIMARY KEY,
  invoice_number VARCHAR(40) NOT NULL UNIQUE,
  customer_id INT,
  invoice_date date
);
INSERT INTO journal_entries
(entry_id, entry_date, account_name, description, debit, credit)
VALUES
(1, '2026-01-01', 'Cash', 'Capital introduced', 50000, 0),
(2, '2026-01-01', 'Capital', 'Capital introduced', 0, 50000),
(3, '2026-01-03', 'Purchases', 'Goods purchased for cash', 20000, 0),
(4, '2026-01-03', 'Cash', 'Goods purchased for cash', 0, 20000),
(5, '2026-01-05', 'Rent', 'Rent paid in cash', 5000, 0);
select*from journal_entries;
 
INSERT INTO customers (customer_id, customer_name, email, balance)
VALUES
    (1, 'Northwind Retail', 'ap@northwind.com', 250.00),
    (2, 'Blue Sky Labs', 'billing@bluesky.com', 500.50),
    (3, 'Greenfield Stores', 'accounts@greenfield.com', 75.25),
    (4, 'Summit Tech', 'finance@summit.com', 1200.00),
    (5, 'Bright Path Services', 'payables@brightpath.com', 310.75);
    select * from customers;
 

INSERT INTO accounts
    (account_id, account_code, account_name, account_type)
VALUES
    (1, '1000', 'Cash', 'ASSET'),
    (2, '1100', 'Accounts Receivable', 'ASSET'),
    (3, '2000', 'Accounts Payable', 'LIABILITY'),
    (4, '4000', 'Service Revenue', 'REVENUE'),
    (5, '5000', 'Office Expense', 'EXPENSE');
    select* from accounts;
 

INSERT INTO invoices
    (invoice_id, invoice_number, customer_id, invoice_date)
VALUES
    (1, 'INV-2026-001', 1, '2026-01-10'),
    (2, 'INV-2026-002', 2, '2026-01-15'),
    (3, 'INV-2026-003', 3, '2026-02-01'),
    (4, 'INV-2026-004', 4, '2026-02-10'),
    (5, 'INV-2026-005', 5, '2026-02-20');
    select* from invoices;

CREATE TABLE Customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Gender VARCHAR(10),
    City VARCHAR(50),
    Age INT,
    Membership VARCHAR(20)
);
insert into Customers values(1,'jyothika','female','mangalore',18,'gold'),(2,'sowmya','female','mysuru',17,'silver'),(3,'pooja','female','mangalore',32,'gold'),(4,'prathiksha','female','mysuru',45,'silver'),(5,'dil','female','mysuru',65,'gold');
select * from customers;
 
UPDATE Customers SET City="Mysuru" WHERE Customer_ID=1;
 

select * from Customers where City between 'mangalore' and 'mysuru';
 
select count(distinct City) as total_City from Customers;

 
select
       sum(debit) as total_debit,
       sum(credit) as total_credit
from journal_entries;

 
select account_name, 
      case
      when sum(debit)>sum(credit)
      then sum(debit)-sum(credit)
      else 0 
	end as debit_balance,
      case
      when sum(credit)>sum(debit)
      then sum(credit)-sum(debit)
      else 0
	end as credit_balance
from journal_entries
group by account_name;


CREATE TABLE Customer(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    phone_number BIGINT);
    
CREATE TABLE Invoice(
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount INT,
    due_date DATE,
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id));
    
CREATE TABLE Payment(
     payment_id INT PRIMARY KEY,
     invoice_id INT,
     payment_amount DECIMAL(10,2),
     FOREIGN KEY (invoice_id)
    REFERENCES Invoice(invoice_id));
     
     
INSERT INTO Customer(customer_id,customer_name,phone_number) VALUES
(1,"Geetha",5645236985),
(2,"amith",8789595684),
(3,"jyothika",9876562158);
Select * from Customer;
 

INSERT INTO Invoice(invoice_id,customer_id,invoice_amount,due_date) VALUES
(101,1,9000,"2026-05-11"),
(102,2,7000,"2026-05-12"),
(103,3,8500,"2026-05-13");
Select * from Invoice ;
 

INSERT INTO Payment(payment_id,invoice_id,payment_amount) VALUES
(1001,101,29000),
(1002,102,15660),
(1003,103,70600);
Select * from Payment;
 

Create view customer_balance as 
select c.customer_name,
       i.invoice_amount,
       p.payment_amount,
       i.invoice_amount-p.payment_amount as balance
from Customer c
join Invoice i on 
c.customer_id=i.customer_id
join Payment p on i.invoice_id=p.invoice_id;
select * from customer_balance;
 

Create view customer_overdue_balance as 
select c.customer_name,
	   i.invoice_amount,
       p.payment_amount,
       i.invoice_amount-p.payment_amount as balance,
       DATEDIFF(CURDATE(),
       i.due_date) as days_overdue
from Customer c
join Invoice i on 
c.customer_id=i.customer_id
join Payment p on i.invoice_id=p.invoice_id;
select * from customer_overdue_balance;

create table transaction(
       transaction_id int primary key,
       transaction_date date,
       department varchar(40),
       transaction_type varchar(50),
       amount int);
       
       INSERT INTO transaction
(transaction_id, transaction_date, department, transaction_type, amount)
VALUES
(1, '2026-01-05', 'Sales', 'Income', 50000),
(2, '2026-01-08', 'Marketing', 'Expense', 12000),
(3, '2026-01-12', 'HR', 'Expense', 8000),
(4, '2026-01-15', 'Finance', 'Income', 35000),
(5, '2026-01-20', 'IT', 'Expense', 18000),
(6, '2026-02-03', 'Sales', 'Income', 45000),
(7, '2026-02-07', 'Marketing', 'Expense', 15000),
(8, '2026-02-11', 'HR', 'Expense', 7000),
(9, '2026-02-18', 'Finance', 'Income', 40000);

SELECT * FROM transaction;
 
 select year(transaction_date) as year,month(transaction_date) as month,sum(amount) as total_amount
from transactionsss
group by year(transaction_date),month(transaction_date);
 
CREATE TABLE monthly_sales (
    sale_month DATE,
    customer_name VARCHAR(50),
    sales DECIMAL(12,2)
);

INSERT INTO monthly_sales (sale_month, customer_name, sales)
VALUES
('2023-01-01', 'jyothika', 100000),
('2023-02-01', 'Bala', 120000),
('2023-03-01', 'Arun', 110000),
('2023-04-01', 'Divya', 150000),
('2023-05-01', 'Bala', 130000);
select * from monthly_sales;
 
select
     sale_month,
     customer_name,
     sales,
     rank()over(order by sales desc) as sales_rank
from monthly_sales;
 

select
     sale_month,
     customer_name,
     sales,
     dense_rank()over(order by sales desc) as sales_dense_rank
from monthly_sales;
 

select
     sale_month,
     customer_name,
     sales,
     Row_number()over(order by sales desc) as sales_Row_number
from monthly_sales;
 
     
select
     sale_month,
     sales,
     lag(sales,14)over(order by sale_month) as previous_month_sale
from monthly_sales;
 

select 
      sale_month,
      sales,
      lead(sales,14)over(order by sale_month)as next_month_sale 
from monthly_sales;
 

select 
      sale_month,
      sales,
      sum(sales)over(order by sale_month)as running_total 
from monthly_sales;
 

select sale_month,sales,lag(sales,12) over (ORDER BY sale_month) as previous_year_sale,
(sales-lag (sales,12) over (ORDER BY sale_month))/lag(sales,12) over (ORDER BY sale_month)*100 as yoy_growth
from monthly_sales;
 
CREATE TABLE monthly_finance (
    id INT PRIMARY KEY,
    customer_name VARCHAR(90),
    month_name VARCHAR(50),
    sales DECIMAL(10,2),
    expenses DECIMAL(10,2),
    tax_rate DECIMAL(5,2)
    );
    
INSERT INTO monthly_finance
VALUES
(1, 'amith', 'January', 55000, 30000, 10),
(2, 'geetha', 'January', 65000, 45000, 10),
(3, 'bhumi', 'January', 50000, 25000, 10),

(4, 'amith', 'February', 65000, 32000, 10),
(5, 'geetha', 'February', 75000, 39000, 10),
(6, 'bhumi', 'February', 55000, 27000, 10),

(7, 'amith', 'March', 65000, 34000, 10),
(8, 'geeths', 'March', 75000, 49000, 10),
(9, 'bhumi', 'March', 60000, 30000, 10);
select * from monthly_finance;
 

DELIMITER //
CREATE PROCEDURE CalculateTAX(
     IN P_sales DECIMAL(10,2),
     IN P_tax_rate DECIMAL(10,2)
     )
     
BEGIN 
    SELECT P_sales AS Sales,
    P_tax_rate AS tax_rate,
    P_sales*P_tax_rate/100 AS tax_amount;
END //
DELIMITER ;

CALL CalculateTAX(5000,10);
 
CALL CalculateTAX(50000,14);

CREATE TABLE transactions(
	 transaction_id int primary key,
     account_name VARCHAR(90),
     transaction_type VARCHAR(60),
     amount DECIMAL(10,2),
     transaction_date date
     );
     
INSERT INTO transactions VALUES
(1,"Cash Account","Deposit",50000,"2026-09-12"),
(2,"Bank Account","Withdrawal",20000,"2026-08-13"),
(3,"Sales Account","Credit",90000,"2026-04-15");

CREATE TABLE audit_transaction(
    audit_id int AUTO_INCREMENT PRIMARY KEY,
    transaction_id int,
    account_name VARCHAR(90),
    transaction_type VARCHAR(60),
	amount DECIMAL(10,2),
    action_type VARCHAR(70),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
DELIMITER //
create trigger after_transaction_insert
after insert on transactions
for each row 
BEGIN
    INSERT INTO audit_transaction
    (audit_id,account_name,transaction_type,action_type,amount)
    VALUES
    (NEW.transaction_id,NEW.account_name,NEW.transaction_type,NEW.amount,'INSERT');
END //

DELIMITER ;

INSERT INTO transactions VALUES
(4,"Expenses Account","Deposit",82000,"2026-05-13");

select * from audit_transaction;
 

DELIMITER //
create trigger after_transaction_update
after update on transactions
for each row 
BEGIN
    INSERT INTO audit_transaction
    (audit_id,account_name,transaction_type,action_type,amount)
    VALUES
    (NEW.transaction_id,NEW.account_name,NEW.transaction_type,NEW.amount,'UPDATE');
END //

DELIMITER ;

update transactions
set amount=90000
where transaction_id=102;

select * from audit_transaction;

DELIMITER //
create trigger after_transaction_delete
after delete on transactions
for each row 
BEGIN
    INSERT INTO audit_transaction
    (audit_id,account_name,transaction_type,action_type,amount)
    VALUES
    (OLD.transaction_id,OLD.account_name,OLD.transaction_type,OLD.amount,'DELETE');
END //

DELIMITER ;

delete from transactions
where transaction_id=104;

select * from audit_transaction;
 
create database permission;
use permission;
create table Customers(
     customerid int primary key,
     customername varchar(50),
     email varchar(100)
);

create table transactions(
    transactionid int primary key,
    customerid int,
    amount decimal(10,2),
    transactiondate date,
    foreign key(customerid) references customers(customerid)
    );
    
create table salaries(
     employeeid int primary key,
     employeename varchar(50),
     salary decimal(10,2)
);

create user 'manager'@'localhost' identified by 'manger@123';
create user 'account'@'localhost' identified by 'account@123';
create user 'clerk'@'localhost' identified by 'clerk@123';

grant select on permission.*
to 'manager'@'localhost';

grant select,insert,update
on permission.transactions
to 'account'@'localhost';

grant select
on permission.Customers
to 'account'@'localhost';

grant select
on permission.Customers
to 'clerk'@'localhost';

grant delete
on permission.transactions
to 'account'@'localhost';

revoke delete 
on permission.transactions
from 'account'@'localhost';

show grants for 'manager'@'localhost';

 

     


