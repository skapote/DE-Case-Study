{{ config(schema='staging') }}

select
  SLUG AS slug,
  NAME AS region_name,
  PARENT AS parent_region_slug
FROM
  {{ ref('raw_regions') }}
