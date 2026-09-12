select
        id as customer_id,
        first_name,
        last_name
    --between source and model
    --from raw.jaffle_shop.customers
    from {{source('jaffle_shop', 'customers')}}