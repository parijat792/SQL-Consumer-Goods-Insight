/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/

with cte as 
  (select count(distinct product_code) as unique_products_2020 
  from fact_sales_monthly 
  where fiscal_year=2020),
cte2 as 
  (select count(distinct product_code) as unique_products_2021 
  from fact_sales_monthly 
  where fiscal_year=2021)
select*,
  round((unique_products_2021-unique_products_2020)*100/unique_products_2020,2) as percentage_chg 
  from cte 
  join cte2;
