-- Q1 Who is the most senior employee based on job title?

select * from music_store_analysis.employee
order by 1 desc
limit 1;


-- Q2 Which countries have most invoices ?

select count(*) as count, billing_country as country
from music_store_analysis.invoice
group by billing_country
order by count desc;


-- Q3 What are top 3 values of total invoices

select round(total,2) from music_store_analysis.invoice
order by total desc
limit 3;


/* Q4 Which city has best customers? We would like to throw a promotional music festival in city we made the most money. 
      Write a querry that returns one city that has the highest sum of invoices totals. 
      Return both city name and sum of all invoices totals */

select billing_city,
round(sum(total),2) as Sum_of_invoice_total
from music_store_analysis.invoice
group by 1
order by Sum_of_invoice_total desc
limit 1;


/* Q5 Who is the best customer? The customer who has spent most will be declared as best customer
      Write a querry that returns the person who has spent the most money */

select c.customer_id,
c.first_name,
c.last_name,
round(sum(i.total),2) as Total_money_spent 
from customer c
left join invoice i
on c.customer_id = i.customer_id
group by 1,2,3
order by Total_money_spent desc
limit 1;


/* Q6 Write querry to return email, first name, last name and genre of all rock music listeners.
      Return your list ordered alphabetically by email sorting with A */

SELECT c.email as customer_email,c.first_name,c.last_name,g.name
FROM track t
left join genre g
on t.genre_id = g.genre_id
left join invoice_line il
on t.track_id = il.track_id
left join invoice i
on i.invoice_id = il.invoice_id
left join customer c
on c.customer_id = i.customer_id
where g.name = 'Rock'
order by customer_email;


/* Q7 Return all track names that have a song length longer than avg song length
      Return the name and millisecond for each track
      Order by song length with the longest songs listed first */

SELECT name,
milliseconds from track
where milliseconds > (
	select avg(milliseconds) as avg_sec
	FROM track )
order by milliseconds desc;






