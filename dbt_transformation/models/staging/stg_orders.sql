-- models/staging/stg_orders.sql
with raw_orders as (
    select * from {{ source('raw_data', 'orders') }}
)

select
    order_id,
    customer_id,
    status,
    order_purchased_at,
    order_approved_at,
    order_delivered_at,
    _ab_cdc_updated_at as updated_normalized_at
from raw_orders
