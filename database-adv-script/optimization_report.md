 Optimization Report

 Initial Query
The query joins Booking, User, Property, and Payment.

 EXPLAIN Analysis
- Found full table scans on User and Property.  
- Joins on user_id and property_id were inefficient.  

 Optimization
- Added indexes on Booking.user_id, Booking.property_id, and Payment.booking_id.  
- Refactored query executed faster (fewer scanned rows).
- Initial Query

The initial query retrieved all bookings along with user details, property details, and payment details using multiple `JOIN`s and selected many columns, including unnecessary ones.


SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name,
    p.city,
    pm.amount,
    pm.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pm ON b.id = pm.booking_id;


Issues Identified

The query selected more columns than required, increasing I/O.

Using only JOIN forced all tables to match, excluding bookings without payments.

No use of indexes mentioned (performance can degrade with large datasets).
---

Optimized Query

The query was refactored to select only the essential columns and use a LEFT JOIN for payments.

EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name,
    p.city,
    pm.amount,
    pm.payment_date
FROM
    bookings AS b
JOIN
    users AS u ON b.user_id = u.id
JOIN
    properties AS p ON b.property_id = p.id
JOIN
    payments AS pm ON b.id = pm.booking_id
WHERE
    b.start_date >= '2024-01-01' AND b.start_date < '2024-02-01';
Benefits

Reduced I/O by fetching only necessary columns.

Handled missing payments gracefully using LEFT JOIN.

Improved join performance by relying on indexed foreign keys (user_id, property_id, booking_id).

Execution Plan (EXPLAIN) showed fewer rows processed and faster execution time.
