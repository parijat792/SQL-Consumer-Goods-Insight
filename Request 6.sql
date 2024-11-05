/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/

select c.customer_code,customer,
round(avg(pre_invoice_discount_pct),4) as average_discount_percentage
from gdb023.fact_pre_invoice_deductions d
join dim_customer c 
on d.customer_code=c.customer_code
where fiscal_year=2021 and market="INDIA" 
group by customer_code,customer
order by average_discount_percentage desc 
limit 5;
