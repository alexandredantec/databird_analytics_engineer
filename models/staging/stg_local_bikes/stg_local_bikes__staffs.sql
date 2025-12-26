SELECT 
  staff_id
  ,store_id
  ,manager_id
  ,first_name AS staff_first_name
  ,last_name AS staff_last_name
  ,email AS staff_email
  ,phone AS staff_phone
  ,CASE
    WHEN active = 1 THEN TRUE
    ELSE FALSE
  END AS is_active_staff
FROM {{ source('local_bikes', 'staffs') }}