{{
    config(
        materialized='view'
    )
}}

--imports
with

int_model as (

    select *
    from {{ ref('int_successful_payments') }}

),
--transformations 
aggregated as (

    select
        created_at as date,
        sum(amount) as daily_sales,

    from int_model
    group by 1
    order by date asc

)
--final select
select *

from aggregated