WITH BaseQuery AS (
    SELECT
        condo.CondoName,
        facility.FacID,
        facility.FacName,
        COUNT(booking.BookingID) AS TotalBookings
    FROM 
        Booking booking
        INNER JOIN BookSlot bookslot ON booking.FacID = bookslot.FacID AND booking.TimeSlotSN = bookslot.TimeSlotSN AND booking.SlotDate = bookslot.SlotDate
        INNER JOIN FacTimeSlot factimeslot ON booking.FacID = factimeslot.FacID AND booking.TimeSlotSN = factimeslot.TimeSlotSN
        INNER JOIN Facility facility ON factimeslot.FacID = facility.FacID
        INNER JOIN Account account ON booking.AccID = account.AccID
        INNER JOIN Condo condo ON account.CondoID = condo.CondoID
    WHERE
        bookslot.SlotDate > CURRENT_TIMESTAMP
        AND bookslot.SlotStatus = 'B'
        AND booking.BookingStatus = 'Confirmed'
    GROUP BY
        condo.CondoName,
        facility.FacID,
        facility.FacName
),
LatestBooking AS (
    SELECT
        facility.FacID,
        booking.BookingID,
        booking.BookingStatus,
        bookslot.SlotDate,
        account.AccName,
        factimeslot.SlotDesc AS TimeSlotDesc,
        ROW_NUMBER() OVER (PARTITION BY facility.FacID ORDER BY bookslot.SlotDate ASC) AS RowNum
    FROM 
        Booking booking
        INNER JOIN BookSlot bookslot ON booking.FacID = bookslot.FacID AND booking.TimeSlotSN = bookslot.TimeSlotSN AND booking.SlotDate = bookslot.SlotDate
        INNER JOIN FacTimeSlot factimeslot ON booking.FacID = factimeslot.FacID AND booking.TimeSlotSN = factimeslot.TimeSlotSN
        INNER JOIN Facility facility ON factimeslot.FacID = facility.FacID
        INNER JOIN Account account ON booking.AccID = account.AccID
        INNER JOIN Condo condo ON account.CondoID = condo.CondoID
    WHERE
        bookslot.SlotDate > CURRENT_TIMESTAMP
        AND bookslot.SlotStatus = 'B'
        AND booking.BookingStatus = 'Confirmed'
)
SELECT
    base_query.CondoName AS Condominium,
    base_query.FacID AS FacilityID,
    base_query.FacName AS FacilityName,
    base_query.TotalBookings,
    latest_booking.BookingID AS LatestBookingID,
    latest_booking.BookingStatus AS LatestBookingStatus,
    latest_booking.SlotDate AS LatestBookingSlotDate,
    latest_booking.AccName AS LatestBookingAccountName,
    latest_booking.TimeSlotDesc AS LatestBookingTimeSlot
FROM 
    BaseQuery base_query
    LEFT JOIN (
        SELECT *
        FROM LatestBooking
        WHERE RowNum = 1
    ) AS latest_booking ON base_query.FacID = latest_booking.FacID
GROUP BY
    base_query.CondoName,
    base_query.FacID,
    base_query.FacName,
    base_query.TotalBookings,
    latest_booking.BookingID,
    latest_booking.BookingStatus,
    latest_booking.SlotDate,
    latest_booking.AccName,
    latest_booking.TimeSlotDesc
HAVING
    base_query.TotalBookings >= 1
ORDER BY
    TotalBookings ASC;
