-- Pig Queries

-----------------------------------------------------------------
-- Avg_sugar_for_each_bev_cat

-- Load the data
beverages = LOAD 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/drinks_expanded_cleaned/part-m-00000' USING PigStorage(',')
        AS (Beverage_category:chararray, Beverage:chararray, Beverage_prep:chararray, Calories:int,
            Total_Fat_g:float, Trans_Fat_g:float, Saturated_Fat_g:float, Sodium_mg:int,
            Total_Carbohydrates_g:int, Cholesterol_mg:int, Dietary_Fibre_g:int, Sugars_g:float,
            Protein_g:float, Vitamin_A_DV:chararray, Vitamin_C_DV:chararray, Calcium_DV:chararray,
            Iron_DV:chararray, Caffeine_mg:int);

-- Filter out the header row assuming it exists in your dataset
beverages_data = FILTER beverages BY Beverage_category IS NOT NULL AND Beverage_category != 'Beverage_category';

-- Group the data by beverage category
grouped = GROUP beverages_data BY Beverage_category;

-- Calculate the average sugar content for each group
average_sugars = FOREACH grouped GENERATE group AS Beverage_category, ROUND(AVG(beverages_data.Sugars_g) * 100.0) / 100.0 AS Average_Sugar;

-- Sort the categories by average sugar content in descending order
sorted = ORDER average_sugars BY Average_Sugar DESC;

-- Store the results to a file
STORE sorted INTO 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Pig_outputs/AvgSugarForEachBevCat_output/part-m-00000' USING PigStorage(',');
-----------------------------------------------------------------
-- Top10Bev_with_highest_cal

-- Load cleaned drinks data
drinks_cleaned = LOAD 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/drinks_cleaned/part-m-00000' USING PigStorage(',')
AS (Beverage: chararray, Calories: int);

-- Order data by calories in descending order
sorted_data = ORDER drinks_cleaned BY Calories DESC;

-- Limit to top 10 results
top_10_beverages = LIMIT sorted_data 10;

-- Store result to output directory
STORE top_10_beverages INTO 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Pig_outputs/Top10BevWithHighestCal_output' USING PigStorage(',');

