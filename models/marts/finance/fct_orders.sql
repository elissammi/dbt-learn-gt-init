with orders as(
    select * from {{ref('stg_jaffle_shop__orders')}}
)
,payments as(
    select * from {{ref('stg_stripe__payments')}}
)
,order_payments as(
    select 
        order_id,
        sum(case when status = 'success' then amount end) as amount
    from payments
    group by order_id
)
,fact_orders as(
    select o.order_id, o.customer_id, p.amount
    from orders o join order_payments p
    on o.order_id = p.order_id
)

select * from fact_orders