/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

with cte as 
  (select segment,count(distinct s.product_code) as product_count_2020 
  from fact_sales_monthly s 
  join dim_product p 
  on s.product_code=p.product_code 
  where fiscal_year=2020 
  group by segment),
cte2 as 
  (select segment,count(distinct s.product_code) as product_count_2021 
  from fact_sales_monthly s 
  join dim_product p 
  on s.product_code=p.product_code
  where fiscal_year=2021 
  group by segment)
select cte.segment,product_count_2020,
  product_count_2021,
  (product_count_2021-product_count_2020) as difference 
  from cte 
  join cte2 
  where cte.segment=cte2.segment;
