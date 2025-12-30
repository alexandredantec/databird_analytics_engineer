WITH customers AS (

    SELECT * FROM {{ ref('stg_local_bikes__customers') }}

),

final AS (

    SELECT 
      customer_id
      ,customer_first_name
      ,customer_last_name
      ,CONCAT(customer_first_name, ' ', customer_last_name) AS customer_name
      ,customer_phone
      ,customer_email
      ,customer_street
      ,customer_city
      ,customer_state
      ,customer_zip_code
    FROM customers
)

SELECT * FROM final