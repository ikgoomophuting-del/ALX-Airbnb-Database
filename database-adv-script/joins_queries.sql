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
SELECT properties.property_id, properties.name, reviews.review_id, reviews.rating, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;

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
