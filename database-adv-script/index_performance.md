Index Performance Analysis

Objective
The goal of indexing is to improve query performance on frequently accessed columns, especially those used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

# Chosen Indexes
- **Users Table**
  - `email`: Frequently searched during login or user lookup.
  - `role`: Useful for filtering by role (e.g., guest, host, admin).

- **Properties Table**
  - `host_id`: Used in joins with the `users` table.
  - `location`: Often used in search queries for filtering by city or region.

- **Bookings Table**
  - `property_id`: Used in joins with `properties`.
  - `user_id`: Used in joins with `users`.
  - `start_date`: Useful for filtering bookings by date range.

# Performance Measurement
Queries were tested using PostgreSQL `EXPLAIN ANALYZE`.

# Example: Without Index
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'some-uuid';
