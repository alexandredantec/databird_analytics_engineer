WITH

orders AS (

    SELECT * FROM {{ ref('stg_local_bikes__orders') }}

),

final AS (

    SELECT 
        order_id
        ,customer_id
        ,store_id
        ,staff_id
        ,order_status
        ,order_date
        ,order_required_date
        ,order_shipped_date
    FROM orders
)

SELECT * FROM final