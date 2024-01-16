-- This procedure updates the fuel prices of all features by a specified percentage
CREATE OR REPLACE PROCEDURE update_fuel_prices(IN percentage_change FLOAT)
AS $$
BEGIN
    UPDATE features SET fuel_price = fuel_price * (1 + percentage_change);
    COMMIT;
END;
$$ LANGUAGE plpgsql;