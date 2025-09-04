Airbnb Database Schema

Overview
This schema represents a simplified version of the Airbnb system.  
It covers **users, properties, bookings, payments, reviews, and messaging**.

The database is normalized up to **Third Normal Form (3NF)** to remove redundancy and ensure data integrity.



Entities & Attributes

## Users
- `user_id` (PK)
- `first_name`, `last_name`
- `email` (unique)
- `password_hash`
- `phone_number`
- `role` (guest, host, admin)
- `created_at`

## Properties
- `property_id` (PK)
- `host_id` (FK → Users)
- `name`, `description`, `location`
- `price_per_night`
- `created_at`, `updated_at`

## Bookings
- `booking_id` (PK)
- `property_id` (FK → Properties)
- `user_id` (FK → Users)
- `start_date`, `end_date`
- `total_price`
- `status` (pending, confirmed, canceled)
- `created_at`

## Payments
- `payment_id` (PK)
- `booking_id` (FK → Bookings)
- `amount`
- `payment_date`
- `payment_method` (credit_card, paypal, stripe)

## Reviews
- `review_id` (PK)
- `property_id` (FK → Properties)
- `user_id` (FK → Users)
- `rating` (1–5)
- `comment`
- `created_at`

## Messages
- `message_id` (PK)
- `sender_id` (FK → Users)
- `recipient_id` (FK → Users)
- `message_body`
- `sent_at`



Normalization to 3NF
1. **1NF:** No repeating groups, all attributes atomic.  
2. **2NF:** All non-key attributes depend fully on the primary key.  
3. **3NF:** No transitive dependencies. For example:
   - Payment depends only on booking, not directly on user or property.
   - Reviews depend only on property and user.



##Indexing
- Primary keys are automatically indexed.
- Additional indexes:
  - `users.email`
  - `properties.host_id`
  - `bookings.property_id`, `bookings.user_id`
  - `payments.booking_id`
  - `reviews.property_id`
  - `messages.sender_id`, `messages.recipient_id`

