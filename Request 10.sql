/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/ 

with cte as (
  select division,product_code,product,
  sum(sold_quantity) as total_sold_quantity,
  rank() over (partition by division order by sum(sold_quantity) desc) as rank_order
  from dim_product p
  join fact_sales_monthly s
  using(product_code)
  where fiscal_year=2021
  group by division,product_code,product
)
select* 
from cte 
where rank_order in (1,2,3);
