WITH customers AS (

    SELECT * FROM {{ ref('int_local_bikes__customers') }}

),

orders AS (

    SELECT * FROM {{ ref('int_local_bikes__orders') }}

),

order_items AS (

    SELECT * FROM {{ ref('int_local_bikes__order_items') }}

),

stores AS (

    SELECT * FROM {{ ref('int_local_bikes__stores') }}

),

aggregated_orders AS (

    SELECT
        orders.customer_id
        ,COUNT(DISTINCT orders.order_id) AS total_orders
        ,SUM(order_items.total_customer_price) AS total_paid
        ,SUM(order_items.total_customer_price) / COUNT(DISTINCT orders.order_id) AS average_order_value
        ,MIN(orders.order_date) AS first_order_date
        ,MAX(orders.order_date) AS last_order_date
    FROM order_items 
    INNER JOIN orders
        ON order_items.order_id = orders.order_id
    GROUP BY customer_id
),

store_orders AS (

    SELECT
        orders.customer_id
        ,stores.store_name
        ,COUNT(*) AS total_orders 
    FROM orders 
    LEFT JOIN stores
        ON orders.store_id = stores.store_id
    GROUP BY orders.customer_id, stores.store_name
),

top_store AS (
    SELECT
        customer_id
        ,store_name
        ,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total_orders DESC) AS row_number
    FROM store_orders
),

final AS (

    SELECT 
      customers.customer_id
      ,customers.customer_first_name
      ,customers.customer_last_name
      ,customers.customer_name
      ,customers.customer_phone
      ,customers.customer_email
      ,customers.customer_street
      ,customers.customer_city
      ,customers.customer_state
      ,customers.customer_zip_code
      ,aggregated_orders.total_orders
      ,aggregated_orders.total_paid
      ,aggregated_orders.average_order_value
      ,aggregated_orders.first_order_date
      ,aggregated_orders.last_order_date
      ,top_store.store_name AS preferred_store
    FROM customers
    LEFT JOIN aggregated_orders 
        ON customers.customer_id = aggregated_orders.customer_id
    LEFT JOIN top_store
        ON (customers.customer_id = top_store.customer_id AND row_number = 1)
)

SELECT * FROM final