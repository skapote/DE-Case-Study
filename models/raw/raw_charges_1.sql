{{ config(schema='raw') }}


select
  *
from
  read_csv_auto('/Users/Manasi/Downloads/de_case_study/DE_project/input_files/charges_1.csv', header=True)
