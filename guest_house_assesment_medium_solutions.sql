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
!!!NOT YET COMPLETE!!!
*/

SELECT rate.amount * nights, extra.amount
FROM booking
JOIN rate
ON booking.room_type_requested=rate.room_type AND booking.occupants = rate.occupancy
JOIN extra ON extra.booking_id = booking.booking_id
WHERE booking.booking_id= 5128

/*
8)
Edinburgh Residents. For every guest who has the word “Edinburgh” in their address show the total number of nights booked. Be sure to include 0 for those guests who have never had a booking. Show last name, first name, address and number of nights. Order by last name then first name.
*/

SELECT last_name, first_name, address, IFNULL(sum(nights), 0) as nights
FROM guest
LEFT OUTER JOIN booking
ON booking.guest_id = guest.id
WHERE address LIKE '%Edinburgh%'
GROUP BY last_name,first_name,address
ORDER BY last_name,first_name;

/*
9)
Show the number of people arriving. For each day of the week beginning 2016-11-25 show the number of people who are arriving that day.
*/

SELECT booking_date AS arrival_date, count(*) AS number_of_arrivals
FROM booking
WHERE booking_date IN ('2016-11-25','2016-11-26','2016-11-27','2016-11-28','2016-11-29','2016-11-30','2016-12-01')
GROUP BY booking_date;

/*
10)
How many guests? Show the number of guests in the hotel on the night of 2016-11-21. Include all those who checked in that day or before but not those who have check out on that day or before.
*/
