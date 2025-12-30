WITH

order_items AS (

    SELECT * FROM {{ ref('int_local_bikes__order_items') }}

),

final AS (

    SELECT 
        order_item_id
        ,order_id
        ,item_id
        ,product_id
        ,quantity
        ,list_price
        ,discount
        ,customer_price
        ,total_price
        ,total_customer_price
    FROM order_items
)

SELECT * FROM final