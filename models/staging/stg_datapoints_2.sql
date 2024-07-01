{{ config(schema='staging') }}

select
  created,
  d_id,
  origin_pid,
  destination_pid,
  valid_from,
  valid_to,
  company_id,
  supplier_id,
  equipment_id
from
  {{ ref('raw_datapoints_2') }}
