-- Call the function to calculate total store size
SELECT calculate_total_store_size() AS total_store_size;

-- Display the original fuel prices in the 'features' table
SELECT * FROM features;

-- Execute the procedure to update fuel prices
CALL update_fuel_prices(0.1);  -- Increase fuel prices by 10%

-- Display the updated fuel prices in the 'features' table
SELECT * FROM features;

-- Perform an operation to trigger the trigger
-- (update 'fuel_price' in the 'features' table)
UPDATE features SET fuel_price = fuel_price + 1 WHERE store = 1 AND date = '2024-01-15';

-- Check the effect of the trigger
-- (Check the 'features' table for the new log entry)
SELECT * FROM features;