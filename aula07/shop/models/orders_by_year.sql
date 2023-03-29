{{ config(materialized='table') }}
select 
  extract(year from date(order_approved_at)) as year, 
  count(order_id) as total
  from `dbt_ecommerce.orders` 
  group by 1