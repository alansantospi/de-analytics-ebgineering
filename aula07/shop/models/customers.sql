{{ config(materialized='table') }}

with customers as (

    select
        customer_id,
        customer_city,
        customer_state

    from `shiba_ecommerce`.customers

),

orders as (

    select
        order_id as order_id,
        customer_id as customer_id,
        order_approved_at as order_date,
        order_status as status

    from `shiba_ecommerce`.orders

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_date) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customers.customer_id,
        customers.customer_city,
        customers.customer_state,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final