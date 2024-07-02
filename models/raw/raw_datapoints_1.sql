{{ config(schema='raw') }}

select
  *
from
  read_csv_auto('/Users/Downloads/de_case_study/DE_project/input_files/datapoints_1.csv', header=True)
