WITH

staffs AS (

    SELECT * FROM {{ ref('int_local_bikes__staffs') }}

),

orders AS (

    SELECT * FROM {{ ref('int_local_bikes__orders') }}

),

order_items AS (

    SELECT * FROM {{ ref('int_local_bikes__order_items') }}

),

aggregated_orders AS (

    SELECT
        orders.staff_id
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
    GROUP BY orders.staff_id
),

final AS (

    SELECT 
      staffs.staff_id
      ,staffs.store_id
      ,staffs.manager_id
      ,staffs.staff_first_name
      ,staffs.staff_last_name
      ,staffs.staff_email
      ,staffs.staff_phone
      ,staffs.is_active_staff
      ,aggregated_orders.total_orders
      ,aggregated_orders.total_customers
      ,aggregated_orders.total_sales_value
      ,aggregated_orders.total_volume_sold
      ,aggregated_orders.total_discount_given
      ,aggregated_orders.first_order_date
      ,aggregated_orders.last_order_date
    FROM staffs
    LEFT JOIN aggregated_orders
        ON staffs.staff_id = aggregated_orders.staff_id
)

SELECT * FROM final