with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        CAST (ship_cost AS FLOAT64) AS ship_coast

    from source

)

select * from renamed
