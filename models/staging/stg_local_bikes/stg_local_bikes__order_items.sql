SELECT 
  CONCAT(order_id, '_', item_id) AS order_item_id
  ,order_id
  ,item_id
  ,product_id
  ,COALESCE(quantity, 0) AS quantity
  ,COALESCE(list_price, 0) AS list_price
  ,COALESCE(discount, 0) AS discount
FROM {{ source('local_bikes', 'order_items') }}