{{ config(schema='raw') }}


SELECT
  *
FROM
  read_csv_auto('/Users/Manasi/Downloads/de_case_study/DE_project/input_files/charges_2.csv', header=True)

