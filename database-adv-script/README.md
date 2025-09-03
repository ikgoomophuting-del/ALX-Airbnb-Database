Advanced SQL Joins

This directory contains SQL scripts demonstrating complex queries using different types of joins.

Files

- **joins_queries.sql**: Contains queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.

Queries

1. **INNER JOIN**
   - Retrieves all bookings with the users who made them.
   - Example: Get booking details along with user’s name and email.

2. **LEFT JOIN**
   - Retrieves all properties and their reviews.
   - Includes properties that do not have reviews.

3. **FULL OUTER JOIN**
   - Retrieves all users and all bookings.
   - Includes users without bookings and bookings not linked to any user.


Subqueries

This folder contains SQL queries demonstrating the use of correlated and non-correlated subqueries.

## Files
- **subqueries.sql**: Contains the following queries:
  1. Non-correlated subquery to find all properties where the average rating is greater than 4.0.
  2. Correlated subquery to find users who have made more than 3 bookings.

