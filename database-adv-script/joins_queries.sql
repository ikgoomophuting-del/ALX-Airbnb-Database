-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

---
-- Retrieve all properties and their reviews, including those with no reviews
SELECT users.user_id, bookings.booking_id
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
UNION
SELECT users.user_id, bookings.booking_id
FROM users
RIGHT JOIN bookings ON users.user_id = bookings.user_id
WHERE users.user_id IS NULL;

-- FULL OUTER JOIN: Retrieve all users and all bookings, even if user has no booking or booking is not linked to a user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
