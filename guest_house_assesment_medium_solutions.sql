-- These are my solutions of the Guest House Assesment medium questions  of SQLZoo
-- https://sqlzoo.net/wiki/Guest_House_Assessment_Medium

/*
6)
Ruth Cadbury. Show the total amount payable by guest Ruth Cadbury for her room bookings. You should JOIN to the rate table using room_type_requested and occupants.
*/

SELECT SUM(nights*amount)
FROM booking
JOIN rate
ON booking.room_type_requested = rate.room_type
AND booking.occupants = rate.occupancy
WHERE booking.guest_id =
(SELECT id
  FROM guest
  WHERE first_name= 'Ruth' AND last_name= 'Cadbury' )

/*
7)
Including Extras. Calculate the total bill for booking 5128 including extras.
*/



/*
8)
Edinburgh Residents. For every guest who has the word “Edinburgh” in their address show the total number of nights booked. Be sure to include 0 for those guests who have never had a booking. Show last name, first name, address and number of nights. Order by last name then first name.
*/



/*
9)
Show the number of people arriving. For each day of the week beginning 2016-11-25 show the number of people who are arriving that day.
*/



/*
10)

*/
