Select * from cheque
Where bank_name = 'ICICI Bank'

--Payment pending status (Q-2401)
Select id, attempt, status,amount from payment
where status = 'Pending'

--Balance of all the invoices in completed status(Q-2402)
Select id, due_date, total, balance from invoice
Where status = 'Completed'
Order by id asc

--User details with 2 or more failure attempts (Q-2403)
Select * from user_details 
where failed_attempts >= 2

--Invoices created between March and April (Q-2404)
Select id, due_date, total, balance from invoice
where EXTRACT(MONTH FROM created_time) between 3 and 4

--Contacts that belongs to the state Karnataka or TamilNadu (Q-2405)
Select org_name, first_name, email, city from contact
where state in ('Karnataka','TamilNadu')
order by org_name, first_name asc

--User password of all the users with atleast one failure attempt (Q-2406)
Select username, user_password from user_details
where failed_attempts > 0
order by username desc

--Item details whose price are greater than 20000(Q-2407)
select name, internal_number from item
where price > 20000
order by name asc

--Customer details whose credit limit is more than 20000(Q-2408)
select id, notes from customer
where credit_limit > 20000
order by id asc

--Purchase order details based on status(Q-2409)
select bill_type, active_since, active_until from purchase_order
where status = 'Completed'
order by active_since asc

--User details based on last login value (Q-2410)
select username, lastlogin_time from user_details
where EXTRACT(MONTH FROM lastlogin_time) = 2
order by lastlogin_time asc 

--Users that are not deleted (Q-2422)
Select id, username from user_details
where deleted = 0
order by id asc

--Section 2 EXAM
--Address details (Q-2436)
select distinct city, state from address
where country in ('India','USA')
order by city asc

--Cargo details (Q-2438)
select description, height, width, weight from cargo
where cargo_length between 10 and 30
order by description asc 

--Shipment status details (Q-2441)
select status, description from shipment_status
where code in ('3','29','33')
order by status asc

--Shipment entity details (Q-2463)
select id, name, identification_number from shipment_entity
where credit_limit > ANY (Select max(credit_limit) from shipment_entity where name = 'Air Conditioner')

--Section 3
--SINGLE ROW,CONVERSION & AGGREGATE FUNCTIONS
--User Details (Q-2220)
select * from user_details 
where Extract(Year from created_time) = 2015
order by id asc

--Cheque Details (Q-2221)
select distinct(bank_name) from cheque
order by bank_name asc

--Maximum Credit Limit (Q-2222)
Select max(credit_limit) as max_limit from customer

--Minimum Total Amount (Q-2223)
Select min(total) as min_total from invoice

--Total Balance(Q-2224)
select sum(balance) as total_balance from invoice

--Customer Count (Q-2225)
Select count(id) as customer_count from customer 

--Average Payment (Q-2226)
Select AVG(amount) as average_payment from payment

--Purchase Order Details (Q-2227)
select * from purchase_order 
where Extract(Year from created_time) = 2016
order by id asc

--Inactive Users(Q-2228)
Select count(username) as Inactive_Users from user_details
Where lastlogin_time is null

--Completed Orders (Q-2229)
Select count(id) as Completed_Orders from purchase_order
where status = 'Completed'

--Updated Last Name (Q-2230)
Select first_name, last_name, phone_number, email, NVL(last_name,first_name) as updated_last_name from contact 
Order by first_name desc

--DDL & DML
--Section 5
--Create Currency table (2180)
create table currency(id int NOT NULL PRIMARY KEY, 
code varchar2(255) NOT NULL, 
country varchar2(255) NOT NULL)

--Create Contact table (2181)
create table contact(id int NOT NULL PRIMARY KEY, 
org_name varchar2(255) NOT NULL, 
street_address1 varchar2(255) NOT NULL,
street_address2 varchar2(255) NOT NULL,
city varchar2(255) NOT NULL,
state varchar2(255) NOT NULL,
postal_code varchar2(255) NOT NULL,
country_code varchar2(255) NOT NULL,
last_name varchar2(255),
first_name varchar2(255) NOT NULL,
person_title varchar2(255),
phone_country_code int NOT NULL,
phone_area_code int,
phone_number varchar2(255) NOT NULL,
email varchar2(255) NOT NULL,
created_time TIMESTAMP NOT NULL)

--Create User Details table (2182)
create table user_details(id int NOT NULL PRIMARY KEY, 
username varchar2(255) NOT NULL, 
user_password varchar2(255) NOT NULL,
deleted int NOT NULL, 
created_time TIMESTAMP NOT NULL,
lastupdated_time TIMESTAMP NOT NULL
lastlogin_timefailed_attempts
contact_id
