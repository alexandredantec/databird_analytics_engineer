WITH

stocks AS (

    SELECT * FROM {{ ref('int_local_bikes__stocks') }}

),

final AS (
    SELECT 
      stock_id
      ,store_id
      ,product_id
      ,quantity
    FROM stocks
)

SELECT * FROM final