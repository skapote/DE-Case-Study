# DE-Case-Study


**Table of Contents:**

```bash
Introduction
Project Structure
Setup Instructions
Data Loading
Data Transformation
Enhancements
Optional Tasks
Conclusion
```


**Introduction:**

This document provides a comprehensive overview of the solution for the DE Case Study. The primary objectives are to load initial data from files into a database, create daily regional aggregated prices using DBT, and implement enhancements including metadata coverage and handling exchange rates.



**Project Structure:**

```bash
DE_project/
├── dbt_project.yml
├── models/
│   ├── raw/
│   │   ├── raw_ports.sql
│   │   ├── raw_regions.sql
│   │   ├── raw_exchange_rates.sql
│   │   ├── raw_datapoints_1.sql
│   │   ├── raw_charges_1.sql
│   │   ├── raw_datapoints_2.sql
│   │   └── raw_charges_2.sql
│   ├── staging/
│   │   ├── stg_ports.sql
│   │   ├── stg_regions.sql
│   │   ├── stg_exchange_rates.sql
│   │   ├── stg_datapoints_1.sql
│   │   ├── stg_charges_1.sql
│   │   ├── stg_datapoints_2.sql
│   │   └── stg_charges_2.sql
│   ├── final/
│   │   ├── final_prices.sql
│   │   ├── final_dq_check.sql
│   │   └── interpolated_exchange_rates.sql
│   ├── hooks/
│   │   ├── pre_hook.sql
│   │   └── post_hook.sql
│   └── queries/
│       └── example_query.md
├── profiles.yml
├── requirements.txt
├── README.md
├── scripts/
│       ├── create_metadata_coverage_table.py
│       └── export_data_to_csv.py
├── results/
│       ├── final_prices.csv
│       ├── final_dq_check.csv
│       └── interpolated_exchange_rates.csv
└── input_files/
    ├── ports.csv
    ├── regions.csv
    ├── exchange_rates.csv
    ├── datapoints_1.csv
    ├── charges_1.csv
    ├── datapoints_2.csv
    └── charges_2.csv
```


**Setup Instructions:**




**Prerequisites:**

Python 3.8+
DBT
DuckDB




**Installation:**




**Clone the repository:**
```bash
git clone https://github.com/DE-Case-Study.git
cd DE-Case-Study
```

**Create a virtual environment:**
```bash
python -m venv venv
source venv/bin/activate
```

**Install the required packages:**
```bash
pip install -r requirements.txt
```

**Set up DBT profile:**

Update the profiles.yml file.


**Run DBT commands:**
```bash
dbt run
dbt test
```



**Data Loading:**

The initial data is loaded from CSV files located in the input_files/ directory. The raw data models in the models/raw/ directory define the structure and content of these initial datasets.




**Data Transformation:**

The data transformation process is defined using DBT models. 
The transformation is divided into stages:

**Raw Layer**: This layer loads the raw data from the source files.
**Staging Layer**: This layer cleans and transforms the raw data.
**Final Layer**: This layer aggregates the data to create the final tables used for analysis.




**Enhancements:**


**Metadata Coverage:**

To track the metadata coverage, the pre_hook.sql and post_hook.sql files insert records into the metadata_coverage table before and after the main data transformation.



**Handling Exchange Rates:**

In real world scenarios, exchange rates can fluctuate daily, and we might not have all the rates available beforehand. To handle this, we can create a model to interpolate missing exchange rates and ensure consistent conversion of monetary values to a common currency (USD).



**Interpolating Exchange Rates:**

The interpolated_exchange_rates.sql script interpolates missing exchange rates by carrying forward the last known rate. This ensures that every day has an exchange rate, which can be used for consistent conversion of charges.



**Converting Charges to USD:**

The final_prices.sql script converts charges to USD using the interpolated exchange rates and calculates the average and median prices for each contract.



**Data Quality Check:**

The final_dq_check.sql script performs a data quality check to ensure that each contract has sufficient data coverage, such as having at least 5 companies and 2 suppliers.

Note- Handling future exchange rates introduces complexity in ensuring data consistency and requires robust ETL processes to manage daily updates and interpolations effectively. For this, we will have to set up the pipeline in such a way.




**Conclusion:**

This documentation covers the essential steps and components of the DE Case Study solution. By following the setup and mentioned data transformation processes, the initial data has been loaded into DuckDB, transformed, and aggregated to meet the specified requirements in case study. The solution also includes enhancements such as metadata coverage and handling exchange rates to ensure comprehensive and accurate data processing.




**Time Log**


**Setup and Environment Configuration:**
Installed required tools, set up project structure.
Time Spent: 1 hours


**Data Ingestion:**
Loaded initial data into DuckDB.
Time Spent: 2 hours


**Creating Aggregated Prices Model:**
Developed DBT models for daily regional aggregated prices.
Time Spent: 3.5 hours


**Implementing Enhancements:**
Added metadata coverage checks and data quality validations.
Time Spent: 3 hours


**Handling Exchange Rates:**
Implemented exchange rate conversions and interpolations.
Time Spent: 3 hours


**Testing and Validation:**
Tested, validated, and debugged the pipeline.
Time Spent: 2 hours


**Documentation and Git Repository Setup:**
Documented the solution and set up the Git repository.
Time Spent: 2 hours

**Total time spent** : 16.5hrs