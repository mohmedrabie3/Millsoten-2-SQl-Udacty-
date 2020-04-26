Q1

Use the Invoice table to determine the countries that have the most invoices. Provide a table of BillingCountry and Invoices ordered by the number of invoices for each country. The country with the most invoices should appear first.

select BillingCountry , count(*) as number_of_invoices
from Invoice
group by 1 
order by 2 desc

Q2

We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns the 1 city that has the highest sum of invoice totals. Return both the city name and the sum of all invoice totals.

check your solution

The top city for Invoice dollars was Prague with an amount of 90.24
select BillingCity , sum(total) 
from Invoice
group by 1 
order by 2 desc
limit 1  

Q3

The customer who has spent the most money will be declared the best customer. Build a query that returns the person who has spent the most money. I found the solution by linking the following three: Invoice, InvoiceLine, and Customer tables to retrieve this information, but you can probably do it with fewer!

check your solution
The customer who spent the most according to invoices was Customer 6 with 49.62 in purchases.

select cs.CustomerId,cs.FirstName ,cs.LastName , sum(il.UnitPrice)as invoices
from Customer cs 
join Invoice ie 
on cs.CustomerId = ie.CustomerId
join  InvoiceLine il
on ie.InvoiceId = il.InvoiceId 
where cs.CustomerId = "6"
group by 1

Q4

The team at Chinook would like to identify all the customers who listen to Rock music. Write a query to return the email, first name, last name, and Genre of all Rock Music listeners. Return your list ordered alphabetically by email address starting with 'A'.

Check your solution

Your final table should have 59 rows and 4 columns.


select c.Email , c.FirstName , c.LastName , g.Name 
from Genre g
join Track
on g.GenreId = Track.GenreId 
join InvoiceLine 
 on  Track.TrackId = InvoiceLine .TrackId  
join Invoice 
on InvoiceLine.Invoiceid = Invoice.Invoiceid 
join Customer c
on Invoice.CustomerId= c.CustomerId
where  g.Name = "Rock"
group by 1 
order by 1  
