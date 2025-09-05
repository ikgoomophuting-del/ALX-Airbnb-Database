Partition Performance Report

 Initial Problem
The `bookings` table had become very large, making queries on date ranges (e.g., retrieving bookings for a specific year) slow. Each query scanned the entire table.

---

 Partitioning Implementation
We implemented **range partitioning** on the `bookings` table using the `start_date` column. Partitions were created for each year:

- `bookings_2024`
- `bookings_2025`

This allows PostgreSQL to perform **partition pruning**, scanning only the relevant partition when filtering by `start_date`.

---

 Performance Test
 
 Query
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

Results

Before Partitioning: The query scanned the entire bookings table (sequential scan), even when filtering for 2025.

After Partitioning: The query scanned only the bookings_2025 partition, significantly reducing I/O and execution time.
