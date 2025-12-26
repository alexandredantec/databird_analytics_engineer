SELECT 
  category_id
  ,category_name
FROM {{ source('local_bikes', 'categories') }}