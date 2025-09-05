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


SELECT b.booking_id, b.start_date, b.end_date, u.user_id, u.name, u.email,
       p.property_id, p.title, p.location,
       pay.payment_id, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;


Issues Identified

The query selected more columns than required, increasing I/O.

Using only JOIN forced all tables to match, excluding bookings without payments.

No use of indexes mentioned (performance can degrade with large datasets).
---

Optimized Query

The query was refactored to select only the essential columns and use a LEFT JOIN for payments.

SELECT b.booking_id, b.start_date, b.end_date,
       u.name AS user_name, p.title AS property_title, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id

Benefits

Reduced I/O by fetching only necessary columns.

Handled missing payments gracefully using LEFT JOIN.

Improved join performance by relying on indexed foreign keys (user_id, property_id, booking_id).

Execution Plan (EXPLAIN) showed fewer rows processed and faster execution time.
