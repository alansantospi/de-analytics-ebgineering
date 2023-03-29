SELECT 
   date(shipping_limit_date) as shipping_date, 
   count(order_id) as num_orders 
FROM 
   `shiba_ecommerce.order_items` 
where 
   date(shipping_limit_date)='{{ var("ingestion_date") }}' 
group by 1