{{
    config
    (
        materialized = "table",
        transient = false
    )
}}

with cte as 
(
    select * from 
    {{
        source
        (
            'datafeed_shared_schema','stg_product_name'
        )
    }}
),

final_data as
(
    select
    productid,
    productname,
    {{
        cents_to_dollars('price')
    }} as productprice
    from cte
)

select * from final_data