
import duckdb

# Connect to the DuckDB
con = duckdb.connect('/Users/Downloads/de_case_study/DE_project/dev.duckdb')

# Query the final_prices table
try:
    final_prices_df = con.execute("SELECT * FROM dev.main_final.final_prices").fetchdf()
    final_prices_df.to_csv('/Users/Downloads/de_case_study/DE_project/results/final_prices.csv', index=False)
    print("final_prices table exported to final_prices.csv")
except Exception as e:
    print(f"Error querying final_prices table: {e}")

# Query the final_dq_check table
try:
    final_dq_check_df = con.execute("SELECT * FROM dev.main_final.final_dq_check").fetchdf()
    final_dq_check_df.to_csv('/Users/Downloads/de_case_study/DE_project/results/final_dq_check.csv', index=False)
    print("final_dq_check table exported to final_dq_check.csv")
except Exception as e:
    print(f"Error querying final_dq_check table: {e}")

try:
    final_exchange_rate_df = con.execute("SELECT * FROM dev.main_staging.interpolated_exchange_rates").fetchdf()
    final_exchange_rate_df.to_csv('/Users/Downloads/de_case_study/DE_project/results/interpolated_exchange_rates.csv', index=False)
    print("final_exchange_rate_df table exported to final_exchange_rate_df.csv")
except Exception as e:
    print(f"Error querying final_exchange_rate_df table: {e}")

# try:
#     metadata_coverage_df = con.execute("SELECT * FROM dev.main_staging.metadata_coverage").fetchdf()
#     metadata_coverage_df.to_csv('/Users/Downloads/de_case_study/DE_project/results/metadata_coverage.csv', index=False)
#     print("metadata_coverage_df table exported to metadata_coverage.csv")
# except Exception as e:
#     print(f"Error querying metadata_coverage_df table: {e}")
