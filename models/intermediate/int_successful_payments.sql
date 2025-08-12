--imports 

with

payments as (

    select *

    from {{ ref('stg_stripe__payment') }}
),

--transformations

successful as (

    select *

    from payments

    where status = 'success'

)
--final select

select *

from successful