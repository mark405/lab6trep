-- This trigger logs changes in the 'fuel_price' column of the 'features' table
CREATE OR REPLACE FUNCTION log_fuel_price_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        INSERT INTO features (store, date, temperature, fuel_price, cpi)
        VALUES (NEW.store_id, NEW.date, NEW.temperature, OLD.fuel_price, NEW.fuel_price, NEW.cpi);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER fuel_price_change_trigger
AFTER UPDATE OF fuel_price ON features
FOR EACH ROW
EXECUTE FUNCTION log_fuel_price_changes();ges();