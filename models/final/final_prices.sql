{{ config(schema='final') }}

WITH charges_in_usd AS (
  SELECT
    c.d_id,
    c.value / er.exchange_rate AS usd_value
  FROM
    {{ ref('stg_charges_1') }} c
    CROSS JOIN (
      SELECT DISTINCT currency, day, exchange_rate
      FROM {{ ref('stg_exchange_rates') }}
    ) er
  WHERE
    c.currency = er.currency
),
aggregated_prices AS (
  SELECT
    d.equipment_id,
    d.origin_pid,
    d.destination_pid,
    d.valid_from,
    d.valid_to,
    d.company_id,
    d.supplier_id,
    AVG(c.usd_value) AS avg_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY c.usd_value) AS median_price
  FROM
    {{ ref('stg_datapoints_1') }} d
    JOIN charges_in_usd c
      ON d.d_id = c.d_id
  GROUP BY
    d.equipment_id,
    d.origin_pid,
    d.destination_pid,
    d.valid_from,
    d.valid_to,
    d.company_id,
    d.supplier_id
)
SELECT
  equipment_id,
  origin_pid,
  destination_pid,
  valid_from,
  valid_to,
  company_id,
  supplier_id,
  avg_price,
  median_price
FROM
  aggregated_prices


