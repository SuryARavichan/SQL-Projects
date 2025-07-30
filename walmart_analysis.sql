create table sales(
	invoice_id varchar(30) not null primary key,
	branch varchar(5) not null,
	city varchar(30) not null, 
	customer_type varchar(30) not null,
	gender varchar(10) not null,
	product_line varchar(100) not null,
	unit_price decimal(10,2) not null,
	quantity int not null,
	VAT float not null,
	total decimal(12,4) not null,
	date TIMESTAMP not null,
	time TIME not null,
	payment_method varchar(15) not null,
	cogs decimal(10, 2) not null,
	gross_margin_pct float,
	gross_income decimal(12, 4) not null,
	rating float
);


select * from sales;

select
distinct city
from sales;

select 
distinct branch
from sales;

select 
distinct city, branch
from sales;


select
count(distinct product_line) as distinct_products
from sales;


select
  payment_method, 
  count(payment_method) as count
from sales
group by payment_method
order by count desc;


select
  product_line, 
  count(product_line) as count
from sales
group by product_line
order by count desc;


select
   to_char(date, 'Month') as month,
   sum(total) as total_revenue
from sales
group by to_char(date, 'Month')
order by total_revenue desc;


select 
     to_char(date, 'Month') as month,
     sum(cogs) as cogs
from sales
group by to_char(date, 'Month')
order by cogs desc;


select 
     product_line,
     sum(total) as total_revenue
from sales
group by product_line
order by total_revenue desc;


select
     city,
     sum(total) as total_revenue
from sales
group by city, branch
order by total_revenue desc;


select
     product_line,
     avg(VAT) as avg_tax
from sales
group by product_line
order by avg_tax desc;


select 
     branch, 
     sum(quantity) as qty
from sales
group by branch 
having sum(quantity) > (select avg(quantity) from sales);



select 
      gender,
      product_line,
      count(gender) as total_count
from sales
group by gender, product_line 
order by total_count desc; 



select
     round(avg(rating)::numeric,2) as avg_rating,
     product_line
from sales
group by product_line
order by avg_rating desc;




