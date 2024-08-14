SELECT DISTINCT
condo.CondoName AS 'Condominium',
    account.AccID,
    account.AccName,
feedback.FbkDesc,
feedback.FbkStatus
FROM
    Feedback feedback
INNER JOIN Account account ON feedback.ByAccID = account.AccID
INNER JOIN Condo condo ON account.CondoID = condo.CondoID
INNER JOIN Booking booking ON account.AccID = booking.AccID
INNER JOIN BookSlot bookslot ON booking.FacID = bookslot.FacID AND booking.TimeSlotSN = bookslot.TimeSlotSN AND booking.SlotDate = bookslot.SlotDate
    INNER JOIN FacTimeSlot factimeslot ON booking.FacID = factimeslot.FacID AND booking.TimeSlotSN = factimeslot.TimeSlotSN
INNER JOIN Facility facility ON factimeslot.FacID = facility.FacID
WHERE
bookslot.SlotStatus = 'B'
    AND booking.BookingID IS NOT NULL;
