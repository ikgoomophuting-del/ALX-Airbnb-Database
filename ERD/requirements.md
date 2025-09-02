Airbnb Database Requirements

1. Overview
This document describes the requirements for the Airbnb database design.  
It focuses on entities, attributes, and relationships needed to support the platform.

---

2. Entities and Attributes

### User
- **user_id (PK)**: UUID
- first_name: VARCHAR
- last_name: VARCHAR
- email: VARCHAR (Unique)
- password_hash: VARCHAR
- phone_number: VARCHAR (Nullable)
- role: ENUM(guest, host, admin)
- created_at: TIMESTAMP

### Property
- **property_id (PK)**: UUID
- **host_id (FK → User.user_id)**
- name: VARCHAR
- description: TEXT
- location: VARCHAR
- price_per_night: DECIMAL
- created_at: TIMESTAMP
- updated_at: TIMESTAMP

### Booking
- **booking_id (PK)**: UUID
- **property_id (FK → Property.property_id)**
- **user_id (FK → User.user_id)**
- start_date: DATE
- end_date: DATE
- total_price: DECIMAL
- status: ENUM(pending, confirmed, canceled)
- created_at: TIMESTAMP

### Payment
- **payment_id (PK)**: UUID
- **booking_id (FK → Booking.booking_id)**
- amount: DECIMAL
- payment_date: TIMESTAMP
- payment_method: ENUM(credit_card, paypal, stripe)

### Review
- **review_id (PK)**: UUID
- **property_id (FK → Property.property_id)**
- **user_id (FK → User.user_id)**
- rating: INT (1–5)
- comment: TEXT
- created_at: TIMESTAMP

### Message
- **message_id (PK)**: UUID
- **sender_id (FK → User.user_id)**
- **recipient_id (FK → User.user_id)**
- message_body: TEXT
- sent_at: TIMESTAMP

---

3. Relationships
- A **User** can host many **Properties**.  
- A **User** can make many **Bookings**.  
- A **Property** can have many **Bookings**.  
- A **Booking** can have one **Payment**.  
- A **User** can leave many **Reviews** on **Properties**.  
- A **User** can send many **Messages** to another **User**.

---

4. Deliverables
- Entity Relationship Diagram (ERD) in `.drawio` format.  
- Requirements documented in this file.  
- SQL schema generation (to be added later).
