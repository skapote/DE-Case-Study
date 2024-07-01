
{{ config(schema='final') }}

WITH intermediate_aggregation AS (
  SELECT
    equipment_id,
    origin_pid,
    destination_pid,
    valid_from,
    valid_to,
    company_id,
    supplier_id,
    AVG(c.usd_value) AS avg_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY c.usd_value) AS median_price
  FROM
    {{ ref('stg_datapoints_1') }} d
    JOIN (
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
    ) c ON d.d_id = c.d_id
  GROUP BY
    equipment_id, origin_pid, destination_pid, valid_from, valid_to, company_id, supplier_id
),
final_aggregation AS (
  SELECT
    equipment_id,
    origin_pid,
    destination_pid,
    valid_from,
    valid_to,
    AVG(avg_price) AS avg_price,
    AVG(median_price) AS median_price,
    COUNT(DISTINCT company_id) AS company_count,
    COUNT(DISTINCT supplier_id) AS supplier_count
  FROM
    intermediate_aggregation
  GROUP BY
    equipment_id, origin_pid, destination_pid, valid_from, valid_to
)
SELECT
  equipment_id,
  origin_pid,
  destination_pid,
  valid_from,
  valid_to,
  avg_price,
  median_price,
  CASE
    WHEN company_count >= 5 AND supplier_count >= 2 THEN true
    ELSE false
  END AS dq_ok
FROM
  final_aggregation

