SELECT 
  order_id
  ,customer_id
  ,store_id
  ,staff_id
  ,order_status
  ,order_date
  ,required_date AS order_required_date
  ,shipped_date AS order_shipped_date
FROM {{ source('local_bikes', 'orders') }}