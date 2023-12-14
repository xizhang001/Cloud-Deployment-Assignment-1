-- Hive Simple Queries

-----------------------------------------------------------------
-- Avg_sugar_for_each_bev_cat
INSERT OVERWRITE DIRECTORY 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Hive_outputs/Avg_sugar_for_each_bev_cat_output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT 
    Beverage_category, 
    ROUND(AVG(CAST(Sugars AS DOUBLE)), 2) AS Avg_Sugar
FROM 
    expanded_drinks_cleaned
WHERE 
    Beverage_category != 'Beverage_category'
GROUP BY 
    Beverage_category
ORDER BY 
    Avg_Sugar DESC;

-----------------------------------------------------------------
-- Top10Bev_with_highest_cal
INSERT OVERWRITE DIRECTORY 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Hive_outputs/Top10Bev_with_highest_cal_output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT beverage, calories
FROM drinks_cleaned
ORDER BY calories DESC
LIMIT 10;
