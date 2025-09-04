
-- Data Seed


-- Clear existing data (for repeatability)
TRUNCATE TABLE messages, reviews, payments, bookings, properties, users RESTART IDENTITY CASCADE;


-- Insert Users

INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'hashed_password1', '+27123456789', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'hashed_password2', '+27129876543', 'host'),
('Carol', 'Mokoena', 'carol@example.com', 'hashed_password3', '+27121234567', 'guest'),
('David', 'Nguyen', 'david@example.com', 'hashed_password4', '+27124567890', 'host'),
('Admin', 'User', 'admin@example.com', 'hashed_admin', '+27120000000', 'admin');


-- Insert Properties

INSERT INTO properties (host_id, name, description, location, price_per_night)
SELECT user_id, 'Cozy Loft', 'Modern loft in Johannesburg CBD', 'Johannesburg', 850.00
FROM users WHERE email = 'bob@example.com';

INSERT INTO properties (host_id, name, description, location, price_per_night)
SELECT user_id, 'Beach House', 'Relaxing beach house with ocean view', 'Durban', 1500.00
FROM users WHERE email = 'david@example.com';


-- Insert Bookings

INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
SELECT p.property_id, u.user_id, '2025-09-05', '2025-09-10', 4250.00, 'confirmed'
FROM properties p, users u
WHERE p.name = 'Cozy Loft' AND u.email = 'alice@example.com';

INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
SELECT p.property_id, u.user_id, '2025-09-15', '2025-09-20', 7500.00, 'pending'
FROM properties p, users u
WHERE p.name = 'Beach House' AND u.email = 'carol@example.com';


-- Insert Payments

INSERT INTO payments (booking_id, amount, payment_method)
SELECT b.booking_id, 4250.00, 'credit_card'
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com';


-- Insert Reviews

INSERT INTO reviews (property_id, user_id, rating, comment)
SELECT p.property_id, u.user_id, 5, 'Amazing stay! Very clean and comfortable.'
FROM properties p, users u
WHERE p.name = 'Cozy Loft' AND u.email = 'alice@example.com';

INSERT INTO reviews (property_id, user_id, rating, comment)
SELECT p.property_id, u.user_id, 4, 'Great house but Wi-Fi was a bit slow.'
FROM properties p, users u
WHERE p.name = 'Beach House' AND u.email = 'carol@example.com';


-- Insert Messages

INSERT INTO messages (sender_id, recipient_id, message_body)
SELECT u1.user_id, u2.user_id, 'Hi, is your property available earlier?'
FROM users u1, users u2
WHERE u1.email = 'alice@example.com' AND u2.email = 'bob@example.com';

INSERT INTO messages (sender_id, recipient_id, message_body)
SELECT u1.user_id, u2.user_id, 'Yes, I can make it available from 3rd September.'
FROM users u1, users u2
WHERE u1.email = 'bob@example.com' AND u2.email = 'alice@example.com';
