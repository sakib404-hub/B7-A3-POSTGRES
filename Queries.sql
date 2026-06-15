-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

SELECT
  match_id,
  fixture,
  base_ticket_price
FROM
  matches
WHERE
  tournament_category = 'Champions League'
  AND match_status = 'Available';



-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).

SELECT
  user_id,
  full_name,
  email
FROM
  users
WHERE
  full_name LIKE 'Tanvir%' or full_name like '%Haque%';


-- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.

SELECT
  booking_id,
  user_id,
  match_id,
  coalesce(payment_status, 'Action Required') AS systematic_status
FROM
  bookings
WHERE
  payment_status IS NULL;



--Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.

SELECT
  booking_id,
  full_name,
  fixture,
  total_cost
FROM
  bookings
  INNER JOIN users USING (user_id)
  INNER JOIN matches USING (match_id);


-- Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.

SELECT
  user_id,
  full_name,
  booking_id
FROM
  users
  LEFT JOIN bookings USING (user_id);

