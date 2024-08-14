SELECT
    vehiclelabel.VehLblAppID AS 'Vehicle Label Application ID',
    vehicle.VehicleNo AS 'Vehicle No.',
    condoManagerAccount.AccName AS 'Condo Manager',
    condomgmt.CtcPersonMobile AS 'Contact Info.',
    account.AccName AS 'Vehicle Label Applicant',
    account.AccCtcNo AS 'Applicant Contact Info.'
FROM
    VehLabel vehiclelabel
INNER JOIN
    Vehicle vehicle ON vehiclelabel.VehicleNo = vehicle.VehicleNo
INNER JOIN
    Account account ON vehiclelabel.AppliedBy = account.AccID
INNER JOIN
    CondoMgmt condomgmt ON vehiclelabel.IssuedBy = condomgmt.CondoMgmtID
INNER JOIN
    Account condoManagerAccount ON condomgmt.CondoMgmtID = condoManagerAccount.AccID
WHERE
    vehiclelabel.VehLblStatus = 'Approved'
    AND vehiclelabel.IssuedBy IS NOT NULL
GROUP BY
    vehiclelabel.VehLblAppID,
    vehicle.VehicleNo,
    condoManagerAccount.AccName,
    condomgmt.CtcPersonMobile,
    account.AccName,
    account.AccCtcNo
ORDER BY
    condoManagerAccount.AccName ASC;
