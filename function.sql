-- This function calculates the total size of all stores
CREATE OR REPLACE FUNCTION calculate_total_store_size()
RETURNS INT AS $$
DECLARE
    total_size INT;
BEGIN
    SELECT SUM(size) INTO total_size FROM stores;
    RETURN total_size;
END;
$$ LANGUAGE plpgsql;