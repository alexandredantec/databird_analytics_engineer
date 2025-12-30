WITH

stores AS (

    SELECT * FROM {{ ref('stg_local_bikes__stores') }}

),

final AS (
    
    SELECT 
        store_id
        ,store_name
        ,store_phone
        ,store_email
        ,store_street
        ,store_city
        ,store_state
        ,store_zip_code
    FROM stores
)

SELECT * FROM final