CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    title VARCHAR(200) NOT NULL,
    location VARCHAR(200)
);

CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    property_id INT REFERENCES properties(property_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    property_id INT REFERENCES properties(property_id),
    user_id INT REFERENCES users(user_id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id),
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL
);
