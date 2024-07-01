{{ config(schema='staging') }}

SELECT
  DAY AS day,
  CURRENCY AS currency,
  RATE AS exchange_rate
FROM
  {{ ref('raw_exchange_rates') }}
