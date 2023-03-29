SELECT customers.customer_state, count(orders.order_id) as total
FROM `dbt_ecommerce.orders` as orders 
INNER JOIN `dbt_ecommerce.customers` as customers ON customers.customer_id = orders.customer_id
group by customers.customer_state
