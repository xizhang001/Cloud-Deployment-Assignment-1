-- Hive Complex Queries

-----------------------------------------------------------------
-- Calorie_density_comparison
INSERT OVERWRITE DIRECTORY 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Hive_outputs/Calorie_density_comparison_output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT 
  f.Item AS FoodItem,
  d.Beverage AS DrinkItem,
  ROUND(CAST(f.calories AS DOUBLE) / 
    (CAST(f.fat_g AS DOUBLE) + CAST(f.carb_g AS DOUBLE) + CAST(f.fiber_g AS DOUBLE) + CAST(f.protein_g AS DOUBLE)), 2) AS FoodCalDensity,
  ROUND(CAST(d.calories AS DOUBLE) / 
    (CAST(d.total_fat AS DOUBLE) + CAST(d.total_carbohydrates AS DOUBLE) + CAST(d.dietary_fibre AS DOUBLE) + CAST(d.protein AS DOUBLE)), 2) AS DrinkCalDensity
FROM 
  foods_cleaned f
CROSS JOIN 
  expanded_drinks_cleaned d
WHERE 
  f.calories IS NOT NULL AND
  d.calories IS NOT NULL AND
  f.fat_g IS NOT NULL AND
  f.carb_g IS NOT NULL AND
  f.fiber_g IS NOT NULL AND
  f.protein_g IS NOT NULL AND
  d.total_fat IS NOT NULL AND
  d.total_carbohydrates IS NOT NULL AND
  d.dietary_fibre IS NOT NULL AND
  d.protein IS NOT NULL AND
  -- Ensure that none of the fields in the denominator are zero to avoid division by zero
  (CAST(f.fat_g AS DOUBLE) + CAST(f.carb_g AS DOUBLE) + CAST(f.fiber_g AS DOUBLE) + CAST(f.protein_g AS DOUBLE)) > 0 AND
  (CAST(d.total_fat AS DOUBLE) + CAST(d.total_carbohydrates AS DOUBLE) + CAST(d.dietary_fibre AS DOUBLE) + CAST(d.protein AS DOUBLE)) > 0;

-----------------------------------------------------------------
-- Find_caffeine
INSERT OVERWRITE DIRECTORY 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Hive_outputs/Find_caffeine_output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT DISTINCT
  dc.beverage,
  dc.calories,
  dc.fat_g AS `Fat (g)`,
  dc.carb_g AS `Carb. (g)`,
  dc.fiber_g AS `Fiber (g)`,
  dc.protein_g AS `Protein (g)`,
  dc.sodium_mg AS `Sodium (mg)`,
  edc.caffeine AS `Caffeine (mg)`
FROM
  drinks_cleaned dc
JOIN
  expanded_drinks_cleaned edc ON dc.beverage = edc.beverage
WHERE
  edc.caffeine IS NOT NULL;

-----------------------------------------------------------------
-- Menu_pair
INSERT OVERWRITE DIRECTORY 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Hive_outputs/Menu_pair_output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT DISTINCT
  f.Item AS FoodItem,
  d.Beverage AS BeverageItem,
  f.Calories + d.Calories AS TotalCalories
FROM 
  foods_cleaned f
CROSS JOIN 
  expanded_drinks_cleaned d
WHERE 
  (f.Calories + d.Calories) <= 500
ORDER BY 
  TotalCalories ASC
LIMIT 50;

-----------------------------------------------------------------
-- Sampling
INSERT OVERWRITE DIRECTORY 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Outputs/Hive_outputs/Sampling_output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT 'Food' AS Type, item AS Name, CAST(Calories AS DOUBLE) AS Calories
FROM foods_cleaned
WHERE RAND() <= 0.1 AND CAST(Calories AS DOUBLE) < 300

UNION ALL

SELECT 'Drink' AS Type, beverage AS Name, CAST(calories AS DOUBLE) AS Calories
FROM drinks_cleaned
WHERE RAND() <= 0.1 AND calories IS NOT NULL AND CAST(calories AS DOUBLE) < 300

UNION ALL

SELECT 'Expanded Drink' AS Type, beverage AS Name, CAST(calories AS DOUBLE) AS Calories
FROM expanded_drinks_cleaned
WHERE RAND() <= 0.1 AND calories IS NOT NULL AND CAST(calories AS DOUBLE) < 300;
