SELECT
    condo.CondoName AS "Condominium",
    condomgmt.ContactPerson AS "Condo Mgmt Contact Person",
    account.AccName AS "Vehicle Label Applicant",
    account.AccCtcNo AS 'Contact No.',
    account.AccEmail AS Email,
    vehicle.VehicleNo AS 'Vehicle No.',
    vehicle.IUNo AS 'Vehicle IU No.',
    tempvehlabel.TempExpiryDate AS "Expiry Date",
    DATEDIFF(DAY, GETDATE(), tempvehlabel.TempExpiryDate) AS "Days Left"
FROM VehLabel vehiclelabel
INNER JOIN Account account ON vehiclelabel.AppliedBy = account.AccID
INNER JOIN Condo condo on account.CondoID = condo.CondoID
INNER JOIN Vehicle vehicle ON vehiclelabel.VehicleNo = vehicle.VehicleNo
INNER JOIN CondoMgmt condomgmt ON vehiclelabel.IssuedBy = condomgmt.CondoMgmtID
INNER JOIN TempVehLabel tempvehlabel ON vehiclelabel.VehLblAppID = tempvehlabel.VehLblAppID
WHERE DATEDIFF(MONTH, GETDATE(), tempvehlabel.TempExpiryDate) < 1
  AND vehiclelabel.VehLblStatus = 'Approved'
  AND vehiclelabel.IssuedBy = (
    SELECT CondoMgmtID
    FROM CondoMgmt specificcondomgmt
    INNER JOIN Account condomgmtacc ON specificcondomgmt.CondoMgmtID = condomgmtacc.AccID
    INNER JOIN Condo condomgmtcondo ON condomgmtacc.CondoID = condomgmtcondo.CondoID
    WHERE
        condomgmtcondo.CondoName = 'Blossom Residences'
  )
GROUP BY
    condo.CondoName,
    condomgmt.ContactPerson,
    account.AccName,
    account.AccCtcNo,
    account.AccEmail,
    vehicle.VehicleNo,
    vehicle.IUNo,
    tempvehlabel.TempExpiryDate
HAVING
    DATEDIFF(DAY, GETDATE(), tempvehlabel.TempExpiryDate) > 0
ORDER BY "Days Left" ASC;
