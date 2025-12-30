WITH

stores AS (

    SELECT * FROM {{ ref('int_local_bikes__stores') }}

),

orders AS (

    SELECT * FROM {{ ref('int_local_bikes__orders') }}

),

order_items AS (

    SELECT * FROM {{ ref('int_local_bikes__order_items') }}

),

aggregated_orders AS (

    SELECT
        orders.store_id
        ,COUNT(DISTINCT orders.order_id) AS total_orders
        ,COUNT(DISTINCT orders.customer_id) AS total_customers
        ,SUM(order_items.total_customer_price) AS total_sales_value
        ,SUM(order_items.quantity) AS total_volume_sold
        ,SUM(order_items.discount * order_items.quantity) AS total_discount_given
        ,MIN(orders.order_date) AS first_order_date
        ,MAX(orders.order_date) AS last_order_date
    FROM order_items 
    INNER JOIN orders
        ON order_items.order_id = orders.order_id
    GROUP BY orders.store_id
),

final AS (
    
    SELECT 
        stores.store_id
        ,stores.store_name
        ,stores.store_phone
        ,stores.store_email
        ,stores.store_street
        ,stores.store_city
        ,stores.store_state
        ,stores.store_zip_code
        ,aggregated_orders.total_orders
        ,aggregated_orders.total_customers
        ,aggregated_orders.total_sales_value
        ,aggregated_orders.total_volume_sold
        ,aggregated_orders.total_discount_given
        ,aggregated_orders.first_order_date
        ,aggregated_orders.last_order_date
    FROM stores
    LEFT JOIN aggregated_orders
        ON stores.store_id = aggregated_orders.store_id
)

SELECT * FROM final