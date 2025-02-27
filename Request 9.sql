/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

with cte as(
  select channel,
  round(sum(gross_price*sold_quantity)/1000000,2) as gross_sales_mln
  from fact_sales_monthly s
  join dim_customer c
  using(customer_code)
  join fact_gross_price g
  using(product_code)
  where s.fiscal_year=2021
  group by channel
  Order by gross_sales_mln desc
)
select*,
  round(gross_sales_mln/sum(gross_sales_mln) over()*100,2) as percentage
from cte
group by channel
