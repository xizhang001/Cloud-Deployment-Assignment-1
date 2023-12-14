-- create tables for analysis

-----------------------------------------------------------------
-- create_drinks_cleaned_table
CREATE TABLE IF NOT EXISTS drinks_cleaned (
    Beverage String,
    calories String,
    fat_g String,
    carb_g String,
    fiber_g String,
    protein_g String,
    sodium_mg String
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
LOAD DATA INPATH 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/drinks_cleaned/part-m-00000' INTO TABLE drinks_cleaned;

-----------------------------------------------------------------
-- create_expanded_drinks_table
CREATE TABLE IF NOT EXISTS expanded_drinks_cleaned (
    Beverage_category STRING, 
    Beverage STRING, 
    Beverage_prep STRING, 
    Calories STRING, 
    Total_Fat STRING, 
    Trans_Fat STRING, 
    Saturated_Fat STRING, 
    Sodium STRING, 
    Total_Carbohydrates STRING, 
    Cholesterol STRING, 
    Dietary_Fibre STRING, 
    Sugars STRING, 
    Protein STRING, 
    Vitamin_A STRING, 
    Vitamin_C STRING, 
    Calcium STRING, 
    Iron STRING, 
    Caffeine STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
LOAD DATA INPATH 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/drinks_expanded_cleaned/part-m-00000' INTO TABLE expanded_drinks_cleaned;

-----------------------------------------------------------------
-- ccreate_food_table
CREATE TABLE IF NOT EXISTS foods_cleaned (
    Item STRING, 
    Calories String, 
    Fat_g String, 
    Carb_g String, 
    Fiber_g String, 
    Protein_g String
)

ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
LOAD DATA INPATH 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/foods_cleaned/part-m-00000' INTO TABLE foods_cleaned;
