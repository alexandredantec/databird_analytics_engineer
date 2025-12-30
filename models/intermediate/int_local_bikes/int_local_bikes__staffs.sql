WITH

staffs AS (

    SELECT * FROM {{ ref('stg_local_bikes__staffs') }}

),

final AS (

    SELECT 
      staff_id
      ,store_id
      ,manager_id
      ,staff_first_name
      ,staff_last_name
      ,staff_email
      ,staff_phone
      ,is_active_staff
    FROM staffs
)

SELECT * FROM final