-- Initial query retrieving bookings with user, property, and payment details
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
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date IS NOT NULL
  AND pay.status = 'completed';

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
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date IS NOT NULL
  AND (pay.status = 'completed' OR pay.status IS NULL);

---

-- Analyze query performance with EXPLAIN
EXPLAIN SELECT b.booking_id,
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
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date IS NOT NULL
  AND pay.status = 'completed';

---

-- Notes on Optimization:
-- 1. Selected only necessary columns instead of SELECT *.
-- 2. Used LEFT JOIN for payments in optimized query (to include unpaid bookings).
-- 3. Added WHERE with AND to filter meaningful records.
-- 4. Ensure indexes on user_id, property_id, booking_id, and pay.status for better performance.
