--imports
with

source as (

select *
from {{ source('jaffle_shop', 'orders') }}

),

--final CTE
renamed as (
    select
    
    id as order_id,
    user_id,
    order_date,
    status,
    _etl_loaded_at

from source

)

--final select
select *
from renamed

