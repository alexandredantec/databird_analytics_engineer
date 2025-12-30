WITH

order_items AS (

    SELECT * FROM {{ ref('stg_local_bikes__order_items') }}

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
        ,list_price - discount AS customer_price
        ,list_price * quantity AS total_price
        ,(list_price - discount) * quantity AS total_customer_price
    FROM order_items
)

SELECT * FROM final