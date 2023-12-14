-- Processing and Cleaning queries

-----------------------------------------------------------------
-- drinks_cleaning
-- Load the drinks dataset

drinks = LOAD 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Raw_data/starbucks-menu-nutrition-drinks.csv' USING PigStorage(',') AS (
    Beverage:chararray, 
    Calories:chararray, 
    Fat:chararray, 
    Carb:chararray, 
    Fiber:chararray, 
    Protein:chararray, 
    Sodium:chararray
);

-- Clean the drinks dataset by replacing '-' with NULL
drinks_cleaned = FOREACH drinks GENERATE 
    Beverage, 
    (Calories == '-' ? NULL : Calories) AS Calories, 
    (Fat == '-' ? NULL : Fat) AS Fat, 
    (Carb == '-' ? NULL : Carb) AS Carb, 
    (Fiber == '-' ? NULL : Fiber) AS Fiber, 
    (Protein == '-' ? NULL : Protein) AS Protein, 
    (Sodium == '-' ? NULL : Sodium) AS Sodium;

DUMP drinks_cleaned;

-- Save the cleaned data
STORE drinks_cleaned INTO 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/drinks_cleaned' USING PigStorage(',');

-----------------------------------------------------------------
-- drinks_expanded_cleaning
-- Load the expanded drinks dataset
expanded_drinks = LOAD 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Raw_data/starbucks_drinkMenu_expanded.csv' USING PigStorage(',') AS (
    Beverage_category:chararray, 
    Beverage:chararray, 
    Beverage_prep:chararray, 
    Calories:chararray, 
    Total_Fat:chararray, 
    Trans_Fat:chararray, 
    Saturated_Fat:chararray, 
    Sodium:chararray, 
    Total_Carbohydrates:chararray, 
    Cholesterol:chararray, 
    Dietary_Fibre:chararray, 
    Sugars:chararray, 
    Protein:chararray, 
    Vitamin_A:chararray, 
    Vitamin_C:chararray, 
    Calcium:chararray, 
    Iron:chararray, 
    Caffeine:chararray
);

-- Clean the expanded drinks dataset by replacing '-' with NULL
expanded_drinks_cleaned = FOREACH expanded_drinks GENERATE 
    Beverage_category, 
    Beverage, 
    Beverage_prep, 
    (Calories == '-' ? NULL : Calories) AS Calories, 
    (Total_Fat == '-' ? NULL : Total_Fat) AS Total_Fat,
    (Trans_Fat == '-' ? NULL : Trans_Fat) AS Trans_Fat,
    (Saturated_Fat == '-' ? NULL : Saturated_Fat) AS Saturated_Fat,
    (Sodium == '-' ? NULL : Sodium) AS Sodium,
    (Total_Carbohydrates == '-' ? NULL : Total_Carbohydrates) AS Total_Carbohydrates,
    (Cholesterol == '-' ? NULL : Cholesterol) AS Cholesterol,
    (Dietary_Fibre == '-' ? NULL : Dietary_Fibre) AS Dietary_Fibre,
    (Sugars == '-' ? NULL : Sugars) AS Sugars,
    (Protein == '-' ? NULL : Protein) AS Protein,
    (Vitamin_A == '-' ? NULL : Vitamin_A) AS Vitamin_A,
    (Vitamin_C == '-' ? NULL : Vitamin_C) AS Vitamin_C,
    (Calcium == '-' ? NULL : Calcium) AS Calcium,
    (Iron == '-' ? NULL : Iron) AS Iron,
    (Caffeine == '-' ? NULL : Caffeine) AS Caffeine;

-- Save the cleaned data
STORE expanded_drinks_cleaned INTO 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/drinks_expanded_cleaned' USING PigStorage(',');

-----------------------------------------------------------------
-- foods_cleaning
-- Load the food dataset
food = LOAD 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Raw_data/starbucks-menu-nutrition-food.csv' USING PigStorage(',') AS (
    Item:chararray, 
    Calories:chararray,
    Fat:chararray, 
    Carb:chararray, 
    Fiber:chararray, 
    Protein:chararray
);

-- Clean the food dataset by replacing '-' with NULL
food_cleaned = FOREACH food GENERATE 
    Item, 
    (Calories == '-' ? NULL : Calories) AS Calories, 
    (Fat == '-' ? NULL : Fat) AS Fat,
    (Carb == '-' ? NULL : Carb) AS Carb,
    (Fiber == '-' ? NULL : Fiber) AS Fiber,
    (Protein == '-' ? NULL : Protein) AS Protein;

-- Save the cleaned data
STORE food_cleaned INTO 'gs://xi-assignment-1/Starbucks-Nutrition-Analysis/Data/Cleaned_data/foods_cleaned' USING PigStorage(',');
