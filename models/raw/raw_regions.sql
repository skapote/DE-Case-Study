{{ config(schema='raw') }}

SELECT
  *
FROM
  read_csv_auto('/Users/Downloads/de_case_study/DE_project/input_files/regions.csv', header=True)
