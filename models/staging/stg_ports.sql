{{ config(schema='staging') }}

SELECT
  PID AS pid,
  CODE AS port_code,
  NAME AS port_name,
  SLUG AS region_slug,
  COUNTRY AS country,
  COUNTRY_CODE AS country_code
FROM
  {{ ref('raw_ports') }}
