# create_metadata_coverage_table.py

import duckdb

# Path to your DuckDB database file
db_path = '/Users/Manasi/Downloads/de_case_study/DE_project/dev.duckdb'

# SQL statement to create the metadata_coverage table
create_table_sql = """
CREATE TABLE IF NOT EXISTS main_staging.metadata_coverage (
  timestamp TIMESTAMP,
  stage VARCHAR,
  covered_lanes INT
);
"""

# Connect to the DuckDB database
con = duckdb.connect(db_path)

# Execute the SQL statement
con.execute(create_table_sql)

# Close the connection
con.close()

print("metadata_coverage table created successfully.")
