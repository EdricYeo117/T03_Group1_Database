SELECT
    Condominium,
    FacilityName,
    TotalRevenue,
    AVG(TotalRevenue) OVER (PARTITION BY Condominium) AS AvgRevenuePerFacility
FROM (
    SELECT
        condo.CondoName AS Condominium,
        facility.facname AS FacilityName,
        SUM(facility.Deposit) AS TotalRevenue
    FROM 
        Booking booking
    INNER JOIN BookSlot bookslot ON booking.FacID = bookslot.FacID AND booking.TimeSlotSN = bookslot.TimeSlotSN AND booking.SlotDate = bookslot.SlotDate
    INNER JOIN FacTimeSlot factimeslot ON booking.FacID = factimeslot.FacID AND booking.TimeSlotSN = factimeslot.TimeSlotSN
    INNER JOIN Facility facility ON factimeslot.FacID = facility.FacID
    INNER JOIN Condo condo ON facility.CondoID = condo.CondoID
    INNER JOIN Account account ON booking.AccID = account.AccID
    WHERE
        booking.BookingStatus = 'Confirmed'
        AND bookslot.SlotStatus = 'B'
        AND facility.Deposit > 0
    GROUP BY
        condo.CondoName,
        facility.facname
) AS Subquery
ORDER BY
    TotalRevenue DESC;
