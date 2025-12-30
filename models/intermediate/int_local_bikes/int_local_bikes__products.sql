WITH

brands AS (
    
    SELECT * FROM {{ ref('stg_local_bikes__brands') }}

), 

categories AS (
    
    SELECT * FROM {{ ref('stg_local_bikes__categories') }}

), 

products AS (
    
    SELECT * FROM {{ ref('stg_local_bikes__products') }}

),

final AS (

    SELECT
        products.product_id 
        ,products.brand_id
        ,products.category_id
        ,products.product_name
        ,brands.brand_name
        ,categories.category_name
        ,products.model_year
        ,products.list_price
    FROM products 
        LEFT JOIN brands 
            ON products.brand_id = brands.brand_id
        LEFT JOIN categories 
            ON products.category_id = categories.category_id  
)

SELECT * FROM final