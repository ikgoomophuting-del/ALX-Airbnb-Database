-- Insert sample users
INSERT INTO users (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- Insert sample properties
INSERT INTO properties (user_id, title, location) VALUES
(1, 'Cozy Apartment', 'Johannesburg'),
(2, 'Beach House', 'Cape Town'),
(3, 'Mountain Cabin', 'Drakensberg');

-- Insert sample bookings
INSERT INTO bookings (user_id, property_id, start_date, end_date) VALUES
(1, 2, '2025-09-10', '2025-09-15'),
(2, 1, '2025-10-01', '2025-10-05'),
(3, 3, '2025-11-12', '2025-11-20');

-- Insert sample reviews
INSERT INTO reviews (property_id, user_id, rating, comment) VALUES
(1, 2, 5, 'Great place!'),
(2, 1, 4, 'Lovely stay by the beach'),
(3, 3, 5, 'Perfect mountain escape');

-- Insert sample payments
INSERT INTO payments (booking_id, amount, status) VALUES
(1, 500.00, 'Completed'),
(2, 300.00, 'Pending'),
(3, 800.00, 'Completed');
