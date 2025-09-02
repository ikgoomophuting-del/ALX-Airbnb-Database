# Airbnb Database Normalization (Up to 3NF)

## Objective
To ensure the Airbnb database schema complies with the Third Normal Form (3NF), eliminating redundancy and ensuring data integrity.

---

## 1. First Normal Form (1NF)
- Each table has a primary key.
- All attributes hold atomic values.
- No repeating groups or multi-valued attributes.

✅ The schema is in 1NF.

---

## 2. Second Normal Form (2NF)
- All non-key attributes depend on the whole primary key.
- Since every table uses a single-column primary key (UUID), there are no partial dependencies.

✅ The schema is in 2NF.

---

## 3. Third Normal Form (3NF)
- No transitive dependencies (non-key attributes must not depend on other non-key attributes).

### Issue Identified
In the **Booking** table:
- The attribute `total_price` is derived from:
- 
