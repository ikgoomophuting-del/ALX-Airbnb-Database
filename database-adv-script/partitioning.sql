-- Step 1: Rename existing table (if it exists) to keep old data
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create new partitioned table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT fk_property FOREIGN KEY(property_id) REFERENCES properties(property_id)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (e.g., yearly partitions)
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Move old data into the new structure
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status)
SELECT booking_id, user_id, property_id, start_date, end_date, status
FROM bookings_old;

-- Optional: drop old table after verifying data migration
-- DROP TABLE bookings_old;

-- Query bookings in 2025
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
