Airbnb Database Normalization (Up to 3NF)

Objective
To ensure the Airbnb database schema complies with the Third Normal Form (3NF), eliminating redundancy and ensuring data integrity.

---

1. First Normal Form (1NF)
- Each table has a primary key.
- All attributes hold atomic values.
- No repeating groups or multi-valued attributes.

The schema is in 1NF.

---

2. Second Normal Form (2NF)
- All non-key attributes depend on the whole primary key.
- Since every table uses a single-column primary key (UUID), there are no partial dependencies.

The schema is in 2NF.

---

3. Third Normal Form (3NF)
- No transitive dependencies (non-key attributes must not depend on other non-key attributes).

### Issue Identified
In the **Booking** table:
- The attribute `total_price` is derived from:
(end_date - start_date) * Property.price_per_night

- This introduces redundancy and violates 3NF because `total_price` does not depend directly on `booking_id`.

### Solution
- Removed `total_price` from the **Booking** table.
- `total_price` should be calculated dynamically when needed (e.g., in SQL queries or application logic).

---

4. Final 3NF Schema
- **User**, **Property**, **Booking**, **Payment**, **Review**, and **Message** tables are in 3NF.
- All attributes in each table depend only on the primary key, with no partial or transitive dependencies.

The schema is fully normalized to 3NF.
