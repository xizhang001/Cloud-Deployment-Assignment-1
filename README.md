# CA4022 assignment: Cloud Deployment Assignment 1 - Starbucks Nutrition Analysis


### Report
- [Report](Report.pdf): Documentation for CA4022 Cloud Deployment Assignment 1.

### Data

The `Data` directory contains:

- [Cleaned_Data](./Data/Cleaned_data): The cleaned and processed data for analysis.
  - [drinks_cleaned](./Data/Cleaned_data/drinks_cleaned)
  - [drinks_expanded_cleaned](./Data/Cleaned_data/drinks_expanded_cleaned)
  - [foods_cleaned](./Data/Cleaned_data/foods_cleaned)

- [Raw_Data](./Data/Raw_data)


### Outputs
The `Outputs` directory contains:
The results from both simple and complex queries, which are designed to provide insights into the nutritional content of the Starbucks menu.

- [Hive_outputs](./Outputs/Hive_outputs): Stores the outputs from the Hive queries.
  
- [Pig_outputs](./Outputs/Pig_outputs): Contains the output data from Pig queries.

### Queries
The `Queries` directory contains:

- [Processing&Cleaning](./Queries/Processing&Cleaning.pig): Pig scripts for data cleaning.

- [Create_tables](./Queries/Create_tables.sql): SQL scripts for creating Hive tables from the cleaned data.
  
- [Hive_Queries](./Queries): Contains all the SQL queries used for analysis. 
  - [Complex_Queries](./Queries/Hive_complex_queries.sql)
  - [Simple_Queries](./Queries/Hive_simple_queries.sql)
  
- [Pig_Queries](./Queries): Pig scripts for both cleaning and analyzing data.
  - [Simple_Queries](./Queries/Pig_queries.pig)

### Video

A short screencast of the deployed running cluster.
