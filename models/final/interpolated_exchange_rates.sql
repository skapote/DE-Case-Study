{{ config(schema='staging') }}

WITH rates AS (
  SELECT
    day,
    currency,
    exchange_rate
  FROM
    {{ ref('stg_exchange_rates') }}
),
filled_rates AS (
  SELECT
    day,
    currency,
    coalesce(exchange_rate, lag(exchange_rate) over (partition by currency ORDER BY day)) AS exchange_rate
  FROM
    rates
)
SELECT
  *
FROM
  filled_rates
