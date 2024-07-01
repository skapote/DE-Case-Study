# Example Query

## Average Container Shipping Price

### Query
To get the average container shipping price of equipment type _2_ from China East Main region to US West Coast region:

```sql
SELECT
  origin_port.port_name AS origin_port,
  destination_port.port_name AS destination_port,
  fp.valid_from,
  fp.valid_to,
  fp.avg_price
FROM
  final.final_prices fp
JOIN
  raw.ports origin_port
  ON fp.origin_pid = origin_port.pid
JOIN
  raw.ports destination_port
  ON fp.destination_pid = destination_port.pid
JOIN
  raw.regions origin_region
  ON origin_port.slug = origin_region.slug
JOIN
  raw.regions destination_region
  ON destination_port.slug = destination_region.slug
WHERE
  fp.equipment_id = 2
  AND origin_region.name = 'China East Main'
  AND destination_region.name = 'US West Coast'
ORDER BY
  fp.valid_from
