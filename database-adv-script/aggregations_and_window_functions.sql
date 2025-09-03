-- Total number of bookings made by each user
SELECT users.user_id,
       COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id;

-- Rank properties based on total number of bookings
SELECT properties.property_id,
       COUNT(bookings.booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(bookings.booking_id) DESC) AS rank
FROM properties
LEFT JOIN bookings ON properties.property_id = bookings.property_id
GROUP BY properties.property_id;
