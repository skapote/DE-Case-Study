{{ config(
    pre_hook="INSERT INTO main_staging.metadata_coverage (timestamp, stage, covered_lanes)
              SELECT CURRENT_TIMESTAMP, 'before', COUNT(*)
              FROM main_final.final_dq_check
              WHERE dq_ok = true;"
) }}
