SELECT
    c.CondoID,
    c.CondoName AS 'Condominium',
    f.FacName AS 'Facility Name',
    bs.SlotDate AS 'Date of Maintenance',
    ts.SlotDesc AS 'Maintenance Duration'
FROM 
    Condo c
INNER JOIN 
    Facility f ON c.CondoID = f.CondoID
INNER JOIN 
    FacTimeSlot ts ON f.FacID = ts.FacID
INNER JOIN 
    BookSlot bs ON f.FacID = bs.FacID AND ts.TimeSlotSN = bs.TimeSlotSN
WHERE 
    bs.SlotStatus = 'M' AND bs.Slotdate BETWEEN '2024-01-31' AND '2024-02-17'
GROUP BY 
    c.CondoID, c.CondoName, f.FacName, bs.SlotDate, ts.SlotDesc
ORDER BY 
    c.CondoID;
