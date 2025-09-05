-- Initial query
SELECT b.id AS booking_id, u.name AS user_name, p.title AS property_title, pay.amount, pay.status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON b.id = pay.booking_id;


-- Initial unoptimized query
SELECT b.booking_id,
       b.start_date,
       b.end_date,
       u.user_id,
       u.name AS user_name,
       u.email,
       p.property_id,
       p.title AS property_title,
       p.location,
       pay.payment_id,
       pay.amount,
       pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

---

-- Optimized query using selective columns and indexed joins
SELECT b.booking_id,
       b.start_date,
       b.end_date,
       u.name AS user_name,
       p.title AS property_title,
       pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
 
---

Optimization done by:

Selecting only necessary columns (instead of *).

Using LEFT JOIN for payments (in case not all bookings have payments yet).

Ensuring indexes exist on user_id, property_id, and booking_id (from previous tasks).
