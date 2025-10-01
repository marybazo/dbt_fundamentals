select 
    ord.order_id as order_id,
    ord.customer_id as customer_id,
    sum(pay.amount) as ammount 
from 
    {{ ref('stg_jaffle_shop__orders') }} as ord
    join {{ ref('stg_stripe__payments') }} as pay 
        on ord.order_id = pay.order_id
group by ord.order_id, ord.customer_id