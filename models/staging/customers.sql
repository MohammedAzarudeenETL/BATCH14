
-- {{ config(materialized = 'table')}}

with tb1 as (
    select * from
    {{ source('datafeed_shared_schema','customers')}}
)

select * from tb1;