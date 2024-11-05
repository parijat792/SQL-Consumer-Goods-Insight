/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

select monthname(date) as Month,
s.fiscal_year as Year,
concat(round(sum(gross_price*sold_quantity)/1000000,2)," M") as "Gross sales Amount"
from fact_gross_price p
join fact_sales_monthly s
on p.product_code=s.product_code
join dim_customer c
on c.customer_code=s.customer_code
where customer="Atliq Exclusive"
group by Month,Year
Order by Year
