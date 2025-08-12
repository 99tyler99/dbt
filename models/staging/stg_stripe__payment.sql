--imports
with

source as (

select * 
from {{ source('stripe', 'payment') }}

),

--final CTE
renamed as (
    select
    
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount,
    created as created_at,
    _batched_at

from source

)
--final select
select *
from renamed