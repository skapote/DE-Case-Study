
import duckdb

# Path to DuckDB file
db_path = '/Users/Downloads/de_case_study/DE_project/dev.duckdb'

# SQL statement to create the metadata_coverage table
create_table_sql = """
CREATE TABLE IF NOT EXISTS main_staging.metadata_coverage (
  timestamp TIMESTAMP,
  stage VARCHAR,
  covered_lanes INT
);
"""

# Connect to the DuckDB 
con = duckdb.connect(db_path)

con.execute(create_table_sql)

con.close()

print("metadata_coverage table created successfully.")
