{{ config(materialized='table', alias='order_summary') }}

select
    order_date,
    count(*) as order_count,
    sum(amount) as gross_amount
from {{ source('cu_fixture', 'raw_orders') }}
group by order_date
