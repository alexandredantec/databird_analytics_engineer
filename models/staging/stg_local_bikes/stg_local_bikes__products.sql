SELECT 
  product_id 
  ,brand_id
  ,category_id
  ,product_name
  ,model_year
  ,COALESCE(list_price, 0) AS list_price
FROM {{ source('local_bikes', 'products') }}