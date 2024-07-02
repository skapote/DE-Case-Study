{{ config(schema='raw') }}

SELECT
  *
FROM
  read_csv_auto('/Users/Downloads/de_case_study/DE_project/input_files/datapoints_2.csv', header=True)
