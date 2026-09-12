 select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    --between source and model
    --from raw.jaffle_shop.orders
    from {{source('jaffle_shop', 'orders')}}