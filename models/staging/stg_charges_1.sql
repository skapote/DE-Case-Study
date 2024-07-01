{{ config(schema='staging') }}

select
  d_id,
  currency,
  CHARGE_VALUE AS value
from
  {{ ref('raw_charges_1') }}
