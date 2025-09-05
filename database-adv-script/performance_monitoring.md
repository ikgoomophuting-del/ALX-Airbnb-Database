Database Performance Monitoring Report

 Objective
The goal of this task was to continuously monitor and refine database performance by analyzing execution plans and applying schema/index optimizations.

---

 Tools Used
- **EXPLAIN ANALYZE**: Measured execution cost and row estimates.
- **SHOW PROFILE** (alternative in MySQL, but for PostgreSQL we rely on `EXPLAIN ANALYZE`).

---

 Queries Monitored
 1. Retrieve all bookings for a given user
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, p.title, u.username
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE u.user_id = 1;
```


Observation (Before): Sequential scan on bookings and users.

Improvement: Added index on bookings.user_id.

CREATE INDEX idx_bookings_user_id ON bookings(user_id);

---
2. Retrieve reviews for a property
```sql
EXPLAIN ANALYZE
SELECT r.review_id, r.rating, r.comment
FROM reviews r
WHERE r.property_id = 5;

Observation (Before): Sequential scan across reviews.

Improvement: Added index on reviews.property_id.
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
```
---

3. Find top properties by number of bookings
```sql

EXPLAIN ANALYZE
SELECT p.property_id, p.title, COUNT(b.booking_id) AS total_bookings
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY total_bookings DESC;

Observation (Before): Full table scans on bookings.

Improvement: Added composite index on bookings(property_id, booking_id).
CREATE INDEX idx_bookings_property ON bookings(property_id, booking_id);
Result (After): Grouping became faster, reducing total cost.
```
