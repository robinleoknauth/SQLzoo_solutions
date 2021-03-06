-- These are my solutions of the Guest House Assesment easy questions  of SQLZoo
-- https://sqlzoo.net/wiki/Guest_House_Assessment_Easy

/*
1)
Guest 1183. Give the booking_date and the number of nights for guest 1183.
*/

SELECT booking_date , nights
FROM booking JOIN guest ON guest_id = guest.id
WHERE room_no=101 AND booking_date='2016-11-17'

/*
2)
When do they get here? List the arrival time and the first and last names for all guests due to arrive on 2016-11-05, order the output by time of arrival.
*/

SELECT arrival_time, first_name, last_name
FROM booking JOIN guest ON guest_id = guest.id
WHERE booking_date = '2016-11-05'
ORDER BY 1;

/*
3)
Look up daily rates. Give the daily rate that should be paid for bookings with ids 5152, 5165, 5154 and 5295. Include booking id, room type, number of occupants and the amount.
*/

SELECT booking_id, room_type_requested, occupants, amount
FROM booking JOIN rate ON room_type_requested = room_type
WHERE booking_id IN (5152, 5165, 5154, 5295)
AND occupancy = occupants;


/*
4)
Who’s in 101? Find who is staying in room 101 on 2016-12-03, include first name, last name and address.
*/

SELECT first_name, last_name , address, booking_date
FROM guest JOIN booking ON id = guest_id
WHERE room_no = 101 AND booking_date = '2016-12-03'

/*
5)
How many bookings, how many nights? For guests 1185 and 1270 show the number of bookings made and the total number nights. Your output should include the guest id and the total number of bookings and the total number of nights.
*/

SELECT guest_id, COUNT(nights), SUM(nights)
FROM booking
WHERE guest_id IN (1185, 1270)
GROUP BY 1;
